package com.vhans.bus.agree.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.agree.domain.Competition;
import com.vhans.bus.agree.mapper.CompetitionMapper;
import com.vhans.bus.agree.service.ICompetitionService;
import com.vhans.bus.agree.domain.dto.AgreeDTO;
import com.vhans.bus.agree.domain.dto.AgreeQueryDTO;
import com.vhans.bus.agree.domain.vo.AgreeVO;
import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import com.vhans.bus.user.domain.vo.UserIntroVO;
import com.vhans.bus.user.domain.User;
import com.vhans.bus.user.domain.UserAgree;
import com.vhans.bus.user.mapper.UserAgreeMapper;
import com.vhans.bus.user.mapper.UserMapper;
import com.vhans.bus.website.domain.SiteConfig;
import com.vhans.core.redis.RedisService;
import com.vhans.core.utils.BeanUtils;
import com.vhans.core.utils.data.StringUtils;
import com.vhans.core.web.model.dto.MailDTO;
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
import static com.vhans.core.constant.NumberConstant.THREE;
import static com.vhans.core.constant.NumberConstant.TWO;
import static com.vhans.core.constant.RedisConstant.COMPETITION_VIEW_COUNT;
import static com.vhans.core.constant.RedisConstant.SITE_SETTING;
import static com.vhans.core.constant.ScoreConstant.AUDIENCE_SCORE;
import static com.vhans.core.constant.ScoreConstant.COMPETITION_SCORE;
import static com.vhans.core.constant.ThymeleafConstant.*;
import static com.vhans.core.enums.AgreementTypeEnum.COMPETITION;

/**
 * 赛事业务处理
 *
 * @author vhans
 */
@Service("competitionServiceImpl")
public class CompetitionServiceImpl extends ServiceImpl<CompetitionMapper, Competition> implements ICompetitionService {

    @Value("${agreement.url}")
    private String websiteUrl;

    @Autowired
    private CompetitionMapper competitionMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserAgreeMapper userAgreeMapper;

    @Autowired
    private RedisService redisService;

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Override
    public List<AgreeVO> listCompetitionVO(AgreeQueryDTO query) {
        // 查询赛事信息
        List<AgreeVO> competitionVOS = competitionMapper.selectCompetitionVO(query);
        // 封装赛事信息
        competitionVOS.forEach(item -> {
            if (item.getStatus() == 3) {
                // 绑定赛事应战者
                item.setDestinedUserId(userAgreeMapper.selectOne(new LambdaQueryWrapper<UserAgree>()
                        .select(UserAgree::getUserId)
                        .eq(UserAgree::getType, 3)
                        .eq(UserAgree::getLimitType, 1)
                        .eq(UserAgree::getAgreeId, item.getId())).getUserId());
            }
            // 查询浏览量
            Double viewCount = Optional.ofNullable(redisService.getZsetScore(COMPETITION_VIEW_COUNT, item.getId()))
                    .orElse((double) 0);
            item.setViewCount(viewCount.intValue());
        });
        return competitionVOS;
    }

    @Override
    public void addCompetition(AgreeDTO competition) {
        // 添加赛事
        Competition newCompetition = BeanUtils.copyBean(competition, Competition.class);
        if (StringUtils.isBlank(newCompetition.getCover())) {
            SiteConfig siteConfig = redisService.getObject(SITE_SETTING);
            newCompetition.setCover(siteConfig.getCover());
        }
        newCompetition.setUserId(StpUtil.getLoginIdAsInt());
        competitionMapper.insert(newCompetition);
        // 增加分数
        userMapper.updateDegree(StpUtil.getLoginIdAsInt(), 2 * COMPETITION_SCORE);
    }

    @Override
    public void deleteCompetition(Integer competitionId) {
        // 删除赛事参与者
        userAgreeMapper.delete(new LambdaQueryWrapper<UserAgree>()
                .eq(UserAgree::getType, 3)
                .eq(UserAgree::getAgreeId, competitionId));
        // 删除赛事
        competitionMapper.deleteById(competitionId);
    }

    @Override
    public String updateCompetition(AgreeDTO competition) {
        // 用户id
        int userId = competition.getUserId();
        // 修改赛事
        Competition newCompetition = BeanUtils.copyBean(competition, Competition.class);
        Assert.isFalse(editCompetition(competition.getId()).getStatus() == 1 && competition.getStatus() == 2,
                "赛事已发出,不允许保存为草稿");
        if (competition.getStatus() == 3) {
            // 保存赛事观众
            competition.getUserIntroVOList().forEach(
                    item -> {
                        Assert.isFalse(StringUtils.isNull(userMapper.selectById(item.getId())),
                                "用户 [" + item.getNickname() + "] 未注册");
                        userAgreeMapper.saveCompetitionAudience(newCompetition.getId(), item.getId());
                    });
            return "手动设置赛事为完成状态,忽略平台继续寻找应战人员";
        }
        // 删除之前报名赛事的观众
        userAgreeMapper.delete(new LambdaQueryWrapper<UserAgree>()
                .eq(UserAgree::getType, 2)
                .eq(UserAgree::getAgreeId, newCompetition.getId()));
        competitionMapper.updateById(newCompetition);
        if (competition.getStatus() == 5) {
            // 查询用户信息
            User fromUser = userMapper.selectById(userId);
            // 查询应战者信息
            Integer toUserId = Optional.ofNullable(
                    userAgreeMapper.selectOne(new LambdaQueryWrapper<UserAgree>()
                                    .select(UserAgree::getUserId)
                                    .eq(UserAgree::getType, 3)
                                    .eq(UserAgree::getLimitType, 1)
                                    .eq(UserAgree::getAgreeId, competition.getId()))
                            .getUserId()).orElse(0);
            if (toUserId != 0) {
                // 给应战者发送邮件,提醒赛事取消
                User toUser = userMapper.selectById(toUserId);
                sendEmail(newCompetition, fromUser, toUser);
            }
            // 要发送的观众列表
            List<User> toUserList = competition.getUserIntroVOList().stream()
                    .map(item -> userMapper.selectById(item.getId())).toList();
            // 分别给观众发送邮件,提醒赛事取消
            toUserList.forEach(toUser -> sendEmail(newCompetition, fromUser, toUser));
            userMapper.updateDegree(userId, -4 * COMPETITION_SCORE);
            return "取消成功,发送邮件通知赛事相关人员,约起分数减少 " + -2 * COMPETITION_SCORE;
        }
        // 保存赛事观众
        Optional.ofNullable(competition.getUserIntroVOList()).orElse(new ArrayList<>()).forEach(
                item -> {
                    Assert.isFalse(StringUtils.isNull(userMapper.selectById(item.getId())),
                            "用户 [" + item.getNickname() + "] 未注册");
                    userAgreeMapper.saveCompetitionAudience(newCompetition.getId(), item.getId());
                });
        return "修改赛事成功";
    }

    @Override
    public AgreeVO editCompetition(Integer competitionId) {
        // 查询赛事信息
        AgreeVO competitionInfo = competitionMapper.selectCompetitionInfoById(competitionId);
        Assert.notNull(competitionInfo, "没有该赛事");
        if (competitionInfo.getStatus() == 3) {
            // 绑定赛事应战者
            competitionInfo.setDestinedUserId(userAgreeMapper.selectOne(new LambdaQueryWrapper<UserAgree>()
                    .select(UserAgree::getUserId)
                    .eq(UserAgree::getType, 3)
                    .eq(UserAgree::getLimitType, 1)
                    .eq(UserAgree::getAgreeId, competitionInfo.getId())).getUserId());
        }
        // 设定赛事观众
        competitionInfo.setUserList(userAgreeMapper.selectUserListByAgreeId(competitionId, THREE, TWO));
        return competitionInfo;
    }

    @Override
    public List<AgreeVO> listCompetitionHomeVO() {
        // 查询首页赛事
        List<AgreeVO> competitionList = competitionMapper.listCompetitionHomeVO();
        competitionList.forEach(competition -> {
            // 查询浏览量
            Double viewCount = Optional.ofNullable(redisService.getZsetScore(COMPETITION_VIEW_COUNT, competition.getId()))
                    .orElse((double) 0);
            competition.setViewCount(viewCount.intValue());
        });
        return competitionList;
    }

    @Override
    public AgreeVO getCompetitionHomeById(Integer competitionId) {
        // 查询赛事信息
        AgreeVO competition = competitionMapper.selectCompetitionAgreementById(competitionId);
        if (StringUtils.isNull(competition)) {
            return null;
        }
        // 浏览量+1
        redisService.incrZet(COMPETITION_VIEW_COUNT, competitionId, 1D);
        if (competition.getStatus() == 3) {
            // 绑定赛事应战者
            competition.setDestinedUserId(userAgreeMapper.selectOne(new LambdaQueryWrapper<UserAgree>()
                    .select(UserAgree::getUserId)
                    .eq(UserAgree::getType, 3)
                    .eq(UserAgree::getLimitType, 0)
                    .eq(UserAgree::getAgreeId, competitionId)).getUserId());
        }
        // 查询上一篇赛事
        PaginationVO lastCompetition = competitionMapper.selectLastCompetition(competitionId);
        // 查询下一篇赛事
        PaginationVO nextCompetition = competitionMapper.selectNextCompetition(competitionId);
        // 查询浏览量
        Double viewCount = Optional.ofNullable(redisService.getZsetScore(COMPETITION_VIEW_COUNT, competitionId))
                .orElse((double) 0);
        // 查询赛事观众
        List<UserIntroVO> userList = userAgreeMapper.selectUserListByAgreeId(competitionId, THREE, TWO);
        competition.setLastAgreement(lastCompetition);
        competition.setNextAgreement(nextCompetition);
        competition.setViewCount(viewCount.intValue());
        competition.setUserList(userList);
        return competition;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String takeCompetition(Integer competitionId) {
        // 登录用户id
        int userId = StpUtil.getLoginIdAsInt();
        // 查询赛事应战者信息
        UserAgree agreementUser = userAgreeMapper.selectOne(new LambdaQueryWrapper<UserAgree>()
                .select(UserAgree::getId, UserAgree::getUserId)
                .eq(UserAgree::getLimitType, 1)
                .eq(UserAgree::getType, 3)
                .eq(UserAgree::getAgreeId, competitionId));
        if (StringUtils.isNull(agreementUser)) {
            // 接下赛事,赛事完成
            userAgreeMapper.saveCompetitionUser(competitionId, userId);
            userMapper.updateDegree(userId, 6 * COMPETITION_SCORE);
            competitionMapper.updateById(Competition.builder().id(competitionId).status(3).build());
            // 给赛事发起者发送邮件,提示赛事完成信息
            constructionEmailWord(competitionId, "");
            return "成功应战,约起分数增加: " + 6 * COMPETITION_SCORE;
        } else if (agreementUser.getUserId().equals(userId)) {
            // 取消,约起分数减少
            userAgreeMapper.deleteById(agreementUser.getId());
            userMapper.updateDegree(userId, -10 * COMPETITION_SCORE);
            competitionMapper.updateById(Competition.builder().id(competitionId).status(1).build());
            //  给赛事发起者发送邮件,提示赛事重置信息
            constructionEmailWord(competitionId, "");
            return "成功取消,约起分数减少: " + 4 * COMPETITION_SCORE;
        } else {
            // 已被应战
            return "已被捷足先登";
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String applyCompetition(Integer competitionId) {
        // 登录用户id
        int userId = StpUtil.getLoginIdAsInt();
        int agreementUserId = 0;
        // 查询赛事应战者id
        Integer responderId = userAgreeMapper.selectOne(new LambdaQueryWrapper<UserAgree>()
                        .select(UserAgree::getId, UserAgree::getUserId)
                        .eq(UserAgree::getLimitType, 1)
                        .eq(UserAgree::getType, 3)
                        .eq(UserAgree::getAgreeId, competitionId))
                .getUserId();
        Assert.isFalse(userId == responderId, "赛事发起者不能够报名");
        // 查询赛事报名者信息
        List<UserAgree> agreementUsers = userAgreeMapper.selectList(new LambdaQueryWrapper<UserAgree>()
                .select(UserAgree::getId, UserAgree::getUserId)
                .eq(UserAgree::getLimitType, 3)
                .eq(UserAgree::getType, 3)
                .eq(UserAgree::getAgreeId, competitionId));
        for (UserAgree item : agreementUsers) {
            if (item.getUserId().equals(userId)) {
                // 当前用户报名了赛事
                agreementUserId = item.getId();
            }
        }
        if (agreementUserId > 0) {
            // 取消报名,减少约起分数
            userAgreeMapper.deleteById(agreementUserId);
            userMapper.updateDegree(userId, -2 * AUDIENCE_SCORE);
            // 发送邮件给赛事发起者,提醒有用户报名观众
            constructionEmailWord(competitionId, userMapper.selectById(userId).getNickname());
            return "取消成功,约起分数减少: " + AUDIENCE_SCORE;
        } else {
            userAgreeMapper.saveCompetitionAudience(competitionId, userId);
            userMapper.updateDegree(userId, AUDIENCE_SCORE);
            return "成功参与,约起分数增加: " + AUDIENCE_SCORE;
        }
    }

    /**
     * 构造邮件任务
     *
     * @param competitionId 赛事id
     * @param nickname      观众昵称
     */
    private void constructionEmailWord(Integer competitionId, String nickname) {
        Competition competition = competitionMapper.selectOne(new LambdaQueryWrapper<Competition>()
                .select(Competition::getTitle, Competition::getUserId,
                        Competition::getStatus)
                .eq(Competition::getId, competitionId));
        User toUser = userMapper.selectById(competition.getUserId());
        if (StringUtils.isNotEmpty(nickname)) {
            // 临时设置一个标记观众的值和临时设置一个content为观众的昵称
            competition.setStatus(6);
            competition.setContent(nickname);
        }
        sendEmail(competition, toUser);
    }

    /**
     * 获取链接地址
     *
     * @param competition 赛事信息
     * @return 链接地址
     */
    private String getUrl(Competition competition) {
        if (competition.getStatus() == 5) {
            return websiteUrl;
        } else {
            String helpId = Optional.ofNullable(competition.getId())
                    .map(Object::toString)
                    .orElse("");
            // 构造个人中心链接
            return websiteUrl + COMPETITION.getPath() + helpId;
        }
    }

    /**
     * 给赛事想关人员发送邮件
     *
     * @param competition 赛事信息
     * @param fromUser    发送方
     * @param toUser      接收方
     */
    private void sendEmail(Competition competition, User fromUser, User toUser) {
        MailDTO mailDTO = new MailDTO();
        Map<String, Object> contentMap = new HashMap<>(7);
        String url = getUrl(competition);
        mailDTO.setToEmail(toUser.getEmail());
        mailDTO.setSubject(COMPETITION_REMIND);
        mailDTO.setTemplate(COMPETITION_TEMPLATE);
        String createTime = DateUtil.formatLocalDateTime(competition.getCreateTime());
        contentMap.put("username", fromUser.getUsername());
        contentMap.put("time", createTime);
        contentMap.put("email", fromUser.getEmail());
        contentMap.put("title", competition.getTitle());
        contentMap.put("message", "非常抱歉,人生大事,无法再组装这次赛事,有想法请联系");
        contentMap.put("url", url);
        contentMap.put("intro", fromUser.getIntro());
        mailDTO.setContentMap(contentMap);
        // 发送HTML邮件
        rabbitTemplate.convertAndSend(EMAIL_EXCHANGE, EMAIL_HTML_KEY, mailDTO);
    }

    /**
     * 发送邮件
     *
     * @param competition 赛事信息
     * @param toUser      接收方
     */
    private void sendEmail(Competition competition, User toUser) {
        MailDTO mailDTO = new MailDTO();
        Map<String, Object> contentMap = new HashMap<>(5);
        String url = getUrl(competition);
        mailDTO.setToEmail(toUser.getEmail());
        Integer status = competition.getStatus();
        Assert.isTrue(status == 1 || status == 3 || status == 6, "赛事状态错误,终止发送邮件");
        String message = "赛事已改变";
        if (competition.getStatus() == 1) {
            mailDTO.setSubject(AGREEMENT_RESET_REMIND);
            message = "赛事已重置";
        } else if (competition.getStatus() == 3) {
            mailDTO.setSubject(AGREEMENT_REMIND);
            message = "赛事已完成";
        } else if (competition.getStatus() == 6) {
            message = "赛事加入新观众@" + competition.getContent();
        }
        mailDTO.setTemplate(AGREEMENT_TEMPLATE);
        // 当前时间
        String createTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        contentMap.put("username", toUser.getUsername());
        contentMap.put("message", message);
        contentMap.put("time", createTime);
        contentMap.put("title", competition.getTitle());
        contentMap.put("url", url);
        mailDTO.setContentMap(contentMap);
        // 发送HTML邮件
        rabbitTemplate.convertAndSend(EMAIL_EXCHANGE, EMAIL_HTML_KEY, mailDTO);
    }
}
