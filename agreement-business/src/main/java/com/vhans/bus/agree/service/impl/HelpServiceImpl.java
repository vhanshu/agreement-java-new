package com.vhans.bus.agree.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.agree.domain.Help;
import com.vhans.bus.agree.mapper.HelpMapper;
import com.vhans.bus.agree.service.IHelpService;
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
import static com.vhans.core.constant.NumberConstant.FOUR;
import static com.vhans.core.constant.NumberConstant.ZERO;
import static com.vhans.core.constant.RedisConstant.HELP_VIEW_COUNT;
import static com.vhans.core.constant.RedisConstant.SITE_SETTING;
import static com.vhans.core.constant.ScoreConstant.HELP_SCORE;
import static com.vhans.core.constant.ThymeleafConstant.*;
import static com.vhans.core.enums.AgreementTypeEnum.ACTIVITY;

/**
 * 帮助业务处理
 *
 * @author vhans
 */
@Service("helpServiceImpl")
public class HelpServiceImpl extends ServiceImpl<HelpMapper, Help> implements IHelpService {

    @Value("${agreement.url}")
    private String websiteUrl;

    @Autowired
    private HelpMapper helpMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserAgreeMapper userAgreeMapper;

    @Autowired
    private RedisService redisService;

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Override
    public List<AgreeVO> listHelpVO(AgreeQueryDTO query) {
        // 查询帮助信息
        List<AgreeVO> helpVOS = helpMapper.selectHelpVO(query);
        // 封装帮助信息
        helpVOS.forEach(item -> {
            // 查询浏览量
            Double viewCount = Optional.ofNullable(redisService.getZsetScore(HELP_VIEW_COUNT, item.getId()))
                    .orElse((double) 0);
            item.setViewCount(viewCount.intValue());
        });
        return helpVOS;
    }

    @Override
    public void addHelp(AgreeDTO help) {
        // 添加帮助
        Help newHelp = BeanUtils.copyBean(help, Help.class);
        if (StringUtils.isBlank(newHelp.getCover())) {
            SiteConfig siteConfig = redisService.getObject(SITE_SETTING);
            newHelp.setCover(siteConfig.getCover());
        }
        newHelp.setUserId(StpUtil.getLoginIdAsInt());
        helpMapper.insert(newHelp);
        userMapper.updateDegree(StpUtil.getLoginIdAsInt(), 2 * HELP_SCORE);
    }

    @Override
    public void deleteHelp(Integer helpId) {
        // 删除帮助参与者
        userAgreeMapper.delete(new LambdaQueryWrapper<UserAgree>()
                .eq(UserAgree::getAgreeId, helpId));
        // 删除帮助
        helpMapper.deleteById(helpId);
        // 发送邮件通知参与者

    }

    @Override
    public String updateHelp(AgreeDTO help) {
        // 修改帮助
        Help newHelp = BeanUtils.copyBean(help, Help.class);
        // 已参与帮助的人数
        int peopleNumber = Optional.ofNullable(help.getUserList()).orElse(new ArrayList<>()).toArray().length;
        Assert.isFalse(newHelp.getPeopleNumber() < peopleNumber,
                "帮助参与人数超出限制");
        Assert.isFalse(editHelp(help.getId()).getStatus() == 1 && help.getStatus() == 2,
                "帮助已发出,不允许保存为草稿");
        if (help.getPeopleNumber() == peopleNumber) {
            // 调整人为逻辑错误
            newHelp.setStatus(3);
        }
        // 删除之前参与帮助的用户
        userAgreeMapper.delete(new LambdaQueryWrapper<UserAgree>()
                .eq(UserAgree::getType, 2)
                .eq(UserAgree::getAgreeId, newHelp.getId()));
        helpMapper.updateById(newHelp);
        if (newHelp.getStatus() == 3) {
            // 保存新地帮助参与者
            Optional.ofNullable(help.getUserList()).orElse(new ArrayList<>()).forEach(item -> {
                Assert.isFalse(StringUtils.isNull(userMapper.selectById(item.getId())),
                        "用户 [" + item.getNickname() + "] 未注册");
                userAgreeMapper.saveCompetitionAudience(newHelp.getId(), item.getId());
            });
            // 帮助完成,发送邮件通知帮助发起者
            constructionEmailWord(newHelp.getId());
            return "帮助完成,正在发送邮件通知帮助发起者";
        }
        if (newHelp.getStatus() == 5) {
            // 帮助取消,发送邮件通知帮助已参与者
            User fromUser = userMapper.selectById(newHelp.getUserId());
            Optional.ofNullable(help.getUserList()).orElse(new ArrayList<>()).forEach(item -> {
                Assert.isFalse(StringUtils.isNull(userMapper.selectById(item.getId())),
                        "用户 [" + item.getNickname() + "] 未注册");
                User toUser = userMapper.selectById(item.getId());
                // 分别给帮助参与用户发送邮件,通知帮助取消
                sendEmail(newHelp, fromUser, toUser);
            });
            userMapper.updateDegree(newHelp.getUserId(), -4 * HELP_SCORE);
            return "帮助取消,正在发送邮件通知帮助已参与者,约起分数减少: " + HELP_SCORE;
        }
        // 保存新地帮助参与者
        Optional.ofNullable(help.getUserList()).orElse(new ArrayList<>()).forEach(
                item -> {
                    Assert.isFalse(StringUtils.isNull(userMapper.selectById(item.getId())),
                            "用户 [" + item.getNickname() + "] 未注册");
                    userAgreeMapper.saveCompetitionAudience(newHelp.getId(), item.getId());
                });
        return "修改帮助成功";
    }

    @Override
    public AgreeVO editHelp(Integer helpId) {
        // 查询帮助信息
        AgreeVO helpInfo = helpMapper.selectHelpInfoById(helpId);
        Assert.notNull(helpInfo, "没有该帮助");
        // 设定帮助参与者
        helpInfo.setUserList(userAgreeMapper.selectUserListByAgreeId(helpId, FOUR, ZERO));
        return helpInfo;
    }

    @Override
    public List<AgreeVO> listHelpHomeVO(String keyword) {
        // 查询首页帮助
        List<AgreeVO> helpList = helpMapper.listHelpHomeVO(keyword);
        helpList.forEach(help -> {
            // 查询浏览量
            Double viewCount = Optional.ofNullable(redisService.getZsetScore(HELP_VIEW_COUNT, help.getId()))
                    .orElse((double) 0);
            help.setViewCount(viewCount.intValue());
        });
        return helpList;
    }

    @Override
    public AgreeVO getHelpAgreementById(Integer helpId) {
        // 查询帮助信息
        AgreeVO help = helpMapper.selectHelpAgreementById(helpId);
        if (StringUtils.isNull(help)) {
            return null;
        }
        // 浏览量+1
        redisService.incrZet(HELP_VIEW_COUNT, helpId, 1D);
        // 查询上一篇帮助
        PaginationVO lastHelp = helpMapper.selectLastHelp(helpId);
        // 查询下一篇帮助
        PaginationVO nextHelp = helpMapper.selectNextHelp(helpId);
        // 查询浏览量
        Double viewCount = Optional.ofNullable(redisService.getZsetScore(HELP_VIEW_COUNT, helpId))
                .orElse((double) 0);
        // 查询帮助参与者
        List<UserIntroVO> userList = userAgreeMapper.selectUserListByAgreeId(helpId, FOUR, ZERO);
        help.setLastAgreement(lastHelp);
        help.setNextAgreement(nextHelp);
        help.setViewCount(viewCount.intValue());
        help.setUserList(userList);
        return help;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String participationHelp(Integer helpId) {
        // 登录用户id
        int userId = StpUtil.getLoginIdAsInt();
        // 帮助与用户关联的id
        int agreementUserId = 0;
        // 查询帮助参与者信息
        List<UserAgree> agreementUsers = userAgreeMapper.selectList(new LambdaQueryWrapper<UserAgree>()
                .select(UserAgree::getId, UserAgree::getUserId)
                .eq(UserAgree::getType, 4)
                .eq(UserAgree::getAgreeId, helpId));
        for (UserAgree item : agreementUsers) {
            if (item.getUserId().equals(userId)) {
                // 当前用户参与了帮助
                agreementUserId = item.getId();
            }
        }
        // 查询之前的帮助信息
        AgreeVO help = editHelp(helpId);
        int peopleNumber = Optional.ofNullable(help.getUserList()).orElse(new ArrayList<>()).toArray().length;
        if (agreementUserId > 0) {
            if (help.getPeopleNumber() == peopleNumber) {
                // 帮助重新发表
                helpMapper.updateById(Help.builder().id(helpId).status(1).build());
                // 活动重置,发送邮件通知活动发起者
                constructionEmailWord(helpId);
            }
            // 取消参与,减少约起分数
            userAgreeMapper.deleteById(agreementUserId);
            userMapper.updateDegree(userId, -2 * HELP_SCORE);
            return "取消成功,约起分数减少: " + HELP_SCORE;
        } else {
            // 参与帮助
            Assert.isTrue(help.getPeopleNumber() > peopleNumber,
                    "帮助参与人数超出限制");
            userAgreeMapper.saveHelpUser(helpId, userId);
            userMapper.updateDegree(userId, HELP_SCORE);
            if (help.getPeopleNumber() == peopleNumber + 1) {
                // 人数已满,帮助完成
                helpMapper.updateById(Help.builder().status(3).build());
                // 帮助完成,发送邮件通知帮助发起者
                constructionEmailWord(helpId);
            }
            return "成功参与,约起分数增加: " + HELP_SCORE;
        }
    }

    /**
     * 构造邮件任务
     *
     * @param helpId 帮助id
     */
    private void constructionEmailWord(Integer helpId) {
        Help help = helpMapper.selectOne(new LambdaQueryWrapper<Help>()
                .select(Help::getTitle, Help::getUserId, Help::getStatus)
                .eq(Help::getId, helpId));
        User toUser = userMapper.selectById(help.getUserId());
        sendEmail(help, toUser);
    }

    /**
     * 获取链接地址
     *
     * @param help 帮助信息
     * @return 链接地址
     */
    private String getUrl(Help help) {
        if (help.getStatus() == 5) {
            return websiteUrl;
        } else {
            String helpId = Optional.ofNullable(help.getId())
                    .map(Object::toString)
                    .orElse("");
            // 构造个人中心链接
            return websiteUrl + ACTIVITY.getPath() + helpId;
        }
    }

    /**
     * 给帮助参与人员发送取消邮件
     *
     * @param help     帮助信息
     * @param fromUser 发送方
     * @param toUser   接收方
     */
    private void sendEmail(Help help, User fromUser, User toUser) {
        MailDTO mailDTO = new MailDTO();
        Map<String, Object> contentMap = new HashMap<>(7);
        String url = getUrl(help);
        mailDTO.setToEmail(toUser.getEmail());
        mailDTO.setSubject(QUIZ_REMIND);
        mailDTO.setTemplate(AND_ACTIVITY_HELP_TEMPLATE);
        // 当前时间
        String createTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        contentMap.put("username", fromUser.getUsername());
        contentMap.put("time", createTime);
        contentMap.put("title", help.getTitle());
        contentMap.put("email", fromUser.getEmail());
        contentMap.put("url", url);
        contentMap.put("message", "非常抱歉,不需要帮忙了,有什么问题请联系");
        contentMap.put("intro", fromUser.getIntro());
        mailDTO.setContentMap(contentMap);
        // 发送HTML邮件
        rabbitTemplate.convertAndSend(EMAIL_EXCHANGE, EMAIL_HTML_KEY, mailDTO);
    }

    /**
     * 发送邮件
     *
     * @param help   帮助信息
     * @param toUser 接收方
     */
    private void sendEmail(Help help, User toUser) {
        MailDTO mailDTO = new MailDTO();
        Map<String, Object> contentMap = new HashMap<>(5);
        String url = getUrl(help);
        mailDTO.setToEmail(toUser.getEmail());
        Integer status = help.getStatus();
        Assert.isTrue(status == 1 || status == 3, "帮助状态错误,终止发送邮件");
        String message = "帮助已改变";
        if (help.getStatus() == 1) {
            mailDTO.setSubject(AGREEMENT_RESET_REMIND);
            message = "帮助已重置";

        } else if (help.getStatus() == 3) {
            mailDTO.setSubject(AGREEMENT_REMIND);
            message = "帮助已完成";
        }
        mailDTO.setTemplate(AGREEMENT_TEMPLATE);
        // 当前时间
        String createTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        contentMap.put("username", toUser.getUsername());
        contentMap.put("message", message);
        contentMap.put("time", createTime);
        contentMap.put("title", help.getTitle());
        contentMap.put("url", url);
        mailDTO.setContentMap(contentMap);
        // 发送HTML邮件
        rabbitTemplate.convertAndSend(EMAIL_EXCHANGE, EMAIL_HTML_KEY, mailDTO);
    }
}
