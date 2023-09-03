package com.vhans.bus.agree.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.agree.domain.Activity;
import com.vhans.bus.agree.mapper.ActivityMapper;
import com.vhans.bus.agree.service.IActivityService;
import com.vhans.bus.agree.domain.dto.AgreeDTO;
import com.vhans.bus.agree.domain.dto.AgreeQueryDTO;
import com.vhans.bus.agree.domain.vo.AgreeVO;
import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import com.vhans.bus.user.domain.User;
import com.vhans.bus.user.domain.UserAgree;
import com.vhans.bus.user.mapper.UserAgreeMapper;
import com.vhans.bus.user.mapper.UserMapper;
import com.vhans.bus.website.domain.SiteConfig;
import com.vhans.core.redis.RedisService;
import com.vhans.core.utils.BeanUtils;
import com.vhans.core.utils.data.StringUtils;
import com.vhans.core.web.model.dto.MailDTO;
import com.vhans.bus.user.domain.vo.UserIntroVO;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import static com.vhans.core.constant.MqConstant.EMAIL_EXCHANGE;
import static com.vhans.core.constant.MqConstant.EMAIL_HTML_KEY;
import static com.vhans.core.constant.NumberConstant.TWO;
import static com.vhans.core.constant.NumberConstant.ZERO;
import static com.vhans.core.constant.RedisConstant.ACTIVITY_VIEW_COUNT;
import static com.vhans.core.constant.RedisConstant.SITE_SETTING;
import static com.vhans.core.constant.ScoreConstant.ACTIVITY_SCORE;
import static com.vhans.core.constant.ThymeleafConstant.*;
import static com.vhans.core.enums.AgreementTypeEnum.ACTIVITY;

/**
 * 活动业务处理
 *
 * @author vhans
 */
@Service("activityServiceImpl")
public class ActivityServiceImpl extends ServiceImpl<ActivityMapper, Activity> implements IActivityService {

    @Value("${agreement.url}")
    private String websiteUrl;

    @Autowired
    private ActivityMapper activityMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserAgreeMapper userAgreeMapper;

    @Autowired
    private RedisService redisService;

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Override
    public List<AgreeVO> listActivityVO(AgreeQueryDTO query) {
        // 查询活动信息
        List<AgreeVO> activityVOS = activityMapper.selectActivityVO(query);
        // 封装活动信息
        activityVOS.forEach(item -> {
            // 查询浏览量
            Double viewCount = Optional.ofNullable(redisService.getZsetScore(ACTIVITY_VIEW_COUNT, item.getId()))
                    .orElse((double) 0);
            item.setViewCount(viewCount.intValue());
        });
        return activityVOS;
    }

    @Override
    public void addActivity(AgreeDTO activity) {
        // 添加活动
        Activity newActivity = BeanUtils.copyBean(activity, Activity.class);
        if (StringUtils.isBlank(newActivity.getCover())) {
            SiteConfig siteConfig = redisService.getObject(SITE_SETTING);
            newActivity.setCover(siteConfig.getCover());
        }
        newActivity.setUserId(StpUtil.getLoginIdAsInt());
        activityMapper.insert(newActivity);
        userMapper.updateDegree(StpUtil.getLoginIdAsInt(), 2 * ACTIVITY_SCORE);
    }

    @Override
    public void deleteActivity(Integer activityId) {
        // 删除活动参与者
        userAgreeMapper.delete(new LambdaQueryWrapper<UserAgree>()
                .eq(UserAgree::getAgreeId, activityId));
        // 删除活动
        activityMapper.deleteById(activityId);
    }

    @Override
    public String updateActivity(AgreeDTO activity) {
        // 修改活动
        Activity newActivity = BeanUtils.copyBean(activity, Activity.class);
        // 已参与活动的人数
        int peopleNumber = Optional.ofNullable(activity.getUserIntroVOList()).orElse(new ArrayList<>()).toArray().length;
        Assert.isFalse(newActivity.getPeopleNumber() < peopleNumber,
                "活动参与人数超出限制");
        Assert.isFalse(editActivity(activity.getId()).getStatus() == 1 && activity.getStatus() == 2,
                "活动已发出,不允许保存为草稿");
        if (newActivity.getPeopleNumber() == peopleNumber) {
            // 调整人为逻辑错误
            newActivity.setStatus(3);
        }
        // 删除之前参与活动的用户
        userAgreeMapper.delete(new LambdaQueryWrapper<UserAgree>()
                .eq(UserAgree::getType, 2)
                .eq(UserAgree::getAgreeId, newActivity.getId()));
        activityMapper.updateById(newActivity);
        if (newActivity.getStatus() == 3) {
            // 保存新的活动参与者
            Optional.ofNullable(activity.getUserIntroVOList()).orElse(new ArrayList<>()).forEach(item -> {
                Assert.isFalse(StringUtils.isNull(userMapper.selectById(item.getId())),
                        "用户 [" + item.getNickname() + "] 未注册");
                userAgreeMapper.saveCompetitionAudience(newActivity.getId(), item.getId());
            });
            // 活动完成,发送邮件通知活动发起者
            constructionEmailWord(newActivity.getId());
            return "活动完成,正在发送邮件通知活动发起者";
        }
        if (newActivity.getStatus() == 5) {
            userMapper.updateDegree(newActivity.getUserId(), -4 * ACTIVITY_SCORE);
            // 活动取消,发送邮件通知活动已参与者
            User fromUser = userMapper.selectById(newActivity.getUserId());
            Optional.ofNullable(activity.getUserIntroVOList()).orElse(new ArrayList<>()).forEach(item -> {
                Assert.isFalse(StringUtils.isNull(userMapper.selectById(item.getId())),
                        "用户 [" + item.getNickname() + "] 未注册");
                User toUser = userMapper.selectById(item.getId());
                // 分别给活动参与用户发送邮件,通知活动取消
                sendEmail(newActivity, fromUser, toUser);
            });
            return "活动取消,正在发送邮件通知活动已参与者,约起分数减少: " + ACTIVITY_SCORE;
        }
        // 保存新的活动参与者
        Optional.ofNullable(activity.getUserIntroVOList()).orElse(new ArrayList<>()).forEach(
                item -> {
                    Assert.isFalse(StringUtils.isNull(userMapper.selectById(item.getId())),
                            "用户 [" + item.getNickname() + "] 未注册");
                    userAgreeMapper.saveCompetitionAudience(newActivity.getId(), item.getId());
                });
        return "修改活动成功";
    }

    @Override
    public AgreeVO editActivity(Integer activityId) {
        // 查询活动信息
        AgreeVO activityInfo = activityMapper.selectActivityInfoById(activityId);
        Assert.notNull(activityInfo, "没有该活动");
        // 设定活动参与者
        activityInfo.setUserList(userAgreeMapper.selectUserListByAgreeId(activityId, TWO, ZERO));
        return activityInfo;
    }

    @Override
    public List<AgreeVO> listActivityHomeVO() {
        // 查询首页活动
        List<AgreeVO> activityList = activityMapper.listActivityHomeVO();
        activityList.forEach(activity -> {
            // 查询浏览量
            Double viewCount = Optional.ofNullable(redisService.getZsetScore(ACTIVITY_VIEW_COUNT, activity.getId()))
                    .orElse((double) 0);
            activity.setViewCount(viewCount.intValue());
        });
        return activityList;
    }

    @Override
    public AgreeVO getActivityAgreementById(Integer activityId) {
        // 查询活动信息
        AgreeVO activity = activityMapper.selectActivityAgreementById(activityId);
        if (StringUtils.isNull(activity)) {
            return null;
        }
        // 浏览量+1
        redisService.incrZet(ACTIVITY_VIEW_COUNT, activityId, 1D);
        // 查询上一篇活动
        PaginationVO lastActivity = activityMapper.selectLastActivity(activityId);
        // 查询下一篇活动
        PaginationVO nextActivity = activityMapper.selectNextActivity(activityId);
        // 查询浏览量
        Double viewCount = Optional.ofNullable(redisService.getZsetScore(ACTIVITY_VIEW_COUNT, activityId))
                .orElse((double) 0);
        // 查询活动参与者
        List<UserIntroVO> userList = userAgreeMapper.selectUserListByAgreeId(activityId, TWO, ZERO);
        activity.setLastAgreement(lastActivity);
        activity.setNextAgreement(nextActivity);
        activity.setViewCount(viewCount.intValue());
        activity.setUserList(userList);
        return activity;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String participationActivity(Integer activityId) {
        // 登录用户id
        int userId = StpUtil.getLoginIdAsInt();
        // 活动与用户关联的id
        int agreementUserId = 0;
        // 查询活动参与者信息
        List<UserAgree> agreementUsers = userAgreeMapper.selectList(new LambdaQueryWrapper<UserAgree>()
                .select(UserAgree::getId, UserAgree::getUserId)
                .eq(UserAgree::getType, 2)
                .eq(UserAgree::getAgreeId, activityId));
        for (UserAgree item : agreementUsers) {
            if (item.getUserId().equals(userId)) {
                // 当前用户参与了活动
                agreementUserId = item.getId();
            }
        }
        // 查询之前的活动信息
        AgreeVO activity = editActivity(activityId);
        int peopleNumber = Optional.ofNullable(activity.getUserList()).orElse(new ArrayList<>()).toArray().length;
        if (agreementUserId > 0) {
            if (activity.getPeopleNumber() == peopleNumber) {
                // 活动重新发表
                activityMapper.updateById(Activity.builder().id(activityId).status(1).build());
                // 活动重置,发送邮件通知活动发起者
                constructionEmailWord(activityId);
            }
            // 取消参与,减少约起分数
            userAgreeMapper.deleteById(agreementUserId);
            userMapper.updateDegree(userId, -2 * ACTIVITY_SCORE);
            return "取消成功,约起分数减少: " + ACTIVITY_SCORE;
        } else {
            // 参与活动
            Assert.isTrue(activity.getPeopleNumber() > peopleNumber,
                    "活动参与人数超出限制");
            userAgreeMapper.saveActivityUser(activityId, userId);
            userMapper.updateDegree(userId, ACTIVITY_SCORE);
            if (activity.getPeopleNumber() == peopleNumber + 1) {
                // 人数已满,活动完成
                activityMapper.updateById(Activity.builder().id(activityId).status(3).build());
                // 活动完成,发送邮件通知活动发起者
                constructionEmailWord(activityId);
            }
            return "成功参与,约起分数增加: " + ACTIVITY_SCORE;
        }
    }

    /**
     * 构造邮件任务
     *
     * @param activityId 活动id
     */
    private void constructionEmailWord(Integer activityId) {
        Activity activity = activityMapper.selectOne(new LambdaQueryWrapper<Activity>()
                .select(Activity::getTitle, Activity::getUserId, Activity::getStatus)
                .eq(Activity::getId, activityId));
        User toUser = userMapper.selectById(activity.getUserId());
        sendEmail(activity, toUser);
    }

    /**
     * 获取链接地址
     *
     * @param activity 活动信息
     * @return 链接地址
     */
    private String getUrl(Activity activity) {
        if (activity.getStatus() == 5) {
            return websiteUrl;
        } else {
            String activityId = Optional.ofNullable(activity.getId())
                    .map(Object::toString)
                    .orElse("");
            // 构造个人中心链接
            return websiteUrl + ACTIVITY.getPath() + activityId;
        }
    }

    /**
     * 给活动参与人员发送取消邮件
     *
     * @param activity 活动信息
     * @param fromUser 发送方
     * @param toUser   接收方
     */
    private void sendEmail(Activity activity, User fromUser, User toUser) {
        MailDTO mailDTO = new MailDTO();
        Map<String, Object> contentMap = new HashMap<>(7);
        String url = getUrl(activity);
        mailDTO.setToEmail(toUser.getEmail());
        mailDTO.setSubject(ACTIVITY_REMIND);
        mailDTO.setTemplate(AND_ACTIVITY_HELP_TEMPLATE);
        // 当前时间
        String createTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        contentMap.put("username", fromUser.getUsername());
        contentMap.put("time", createTime);
        contentMap.put("title", activity.getTitle());
        contentMap.put("email", fromUser.getEmail());
        contentMap.put("url", url);
        contentMap.put("message", "非常抱歉,人生大事,无法举办这次活动,有什么问题请联系");
        contentMap.put("intro", fromUser.getIntro());
        mailDTO.setContentMap(contentMap);
        // 发送HTML邮件
        rabbitTemplate.convertAndSend(EMAIL_EXCHANGE, EMAIL_HTML_KEY, mailDTO);
    }

    /**
     * 发送邮件
     *
     * @param activity 活动信息
     * @param toUser   接收方
     */
    private void sendEmail(Activity activity, User toUser) {
        MailDTO mailDTO = new MailDTO();
        Map<String, Object> contentMap = new HashMap<>(5);
        String url = getUrl(activity);
        mailDTO.setToEmail(toUser.getEmail());
        Integer status = activity.getStatus();
        Assert.isTrue(status == 1 || status == 3, "活动状态错误,终止发送邮件");
        String message = "活动已改变";
        if (activity.getStatus() == 1) {
            mailDTO.setSubject(AGREEMENT_RESET_REMIND);
            message = "活动已重置";

        } else if (activity.getStatus() == 3) {
            mailDTO.setSubject(AGREEMENT_REMIND);
            message = "活动已完成";
        }
        mailDTO.setTemplate(AGREEMENT_TEMPLATE);
        // 当前时间
        String createTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        contentMap.put("username", toUser.getUsername());
        contentMap.put("message", message);
        contentMap.put("time", createTime);
        contentMap.put("title", activity.getTitle());
        contentMap.put("url", url);
        mailDTO.setContentMap(contentMap);
        // 发送HTML邮件
        rabbitTemplate.convertAndSend(EMAIL_EXCHANGE, EMAIL_HTML_KEY, mailDTO);
    }
}
