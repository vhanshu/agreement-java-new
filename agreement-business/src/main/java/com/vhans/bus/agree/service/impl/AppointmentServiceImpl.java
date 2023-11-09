package com.vhans.bus.agree.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.agree.domain.Appointment;
import com.vhans.bus.agree.mapper.AppointmentMapper;
import com.vhans.bus.agree.service.IAppointmentService;
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
import static com.vhans.core.constant.NumberConstant.ONE;
import static com.vhans.core.constant.NumberConstant.TWO;
import static com.vhans.core.constant.RedisConstant.APPOINTMENT_VIEW_COUNT;
import static com.vhans.core.constant.RedisConstant.SITE_SETTING;
import static com.vhans.core.constant.ScoreConstant.APPOINTMENT_SCORE;
import static com.vhans.core.constant.ThymeleafConstant.*;
import static com.vhans.core.enums.AgreementTypeEnum.APPOINTMENT;
import static com.vhans.core.enums.AgreementTypeEnum.APPOINTMENT_SPECIFY;

/**
 * 约会业务处理
 *
 * @author vhans
 */
@Service("appointmentServiceImpl")
public class AppointmentServiceImpl extends ServiceImpl<AppointmentMapper, Appointment> implements IAppointmentService {

    @Value("${agreement.url}")
    private String websiteUrl;

    @Autowired
    private AppointmentMapper appointmentMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserAgreeMapper userAgreeMapper;

    @Autowired
    private RedisService redisService;

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Override
    public List<AgreeVO> listAppointmentVO(AgreeQueryDTO query) {
        // 查询约会信息
        List<AgreeVO> appointmentVOS = appointmentMapper.selectAppointmentVO(query);
        // 封装约会信息
        appointmentVOS.forEach(item -> {
            if (item.getStatus() == 3) {
                // 查询约会应约者
                UserAgree destinedUser = userAgreeMapper.selectAppointmentUser(item.getId());
                item.setDestinedUserId(destinedUser.getUserId());
            }
            // 查询浏览量
            Double viewCount = Optional.ofNullable(redisService.getZsetScore(APPOINTMENT_VIEW_COUNT, item.getId()))
                    .orElse((double) 0);
            item.setViewCount(viewCount.intValue());
        });
        return appointmentVOS;
    }

    @Override
    public void addAppointment(AgreeDTO appointment) {
        // 用户id
        int userId = StpUtil.getLoginIdAsInt();
        // 添加约会
        Appointment newAppointment = BeanUtils.copyBean(appointment, Appointment.class);
        if (StringUtils.isBlank(newAppointment.getCover())) {
            SiteConfig siteConfig = redisService.getObject(SITE_SETTING);
            newAppointment.setCover(siteConfig.getCover());
        }
        newAppointment.setUserId(userId);
        appointmentMapper.insert(newAppointment);
        userMapper.updateDegree(userId, 2 * APPOINTMENT_SCORE);
        // 保存指定的约会人员
        if (newAppointment.getType() == 2) {
            Assert.isTrue(StringUtils.isNotEmpty(appointment.getUserList()), "未指定约会人员");
            appointment.getUserList().forEach(item ->
                    userAgreeMapper.saveAppointmentDestinedUser(appointment.getId(), item.getId()));
            if (newAppointment.getStatus() == 1) {
                // 查询用户信息
                User fromUser = userMapper.selectById(userId);
                // 要发送的用户列表
                List<User> toUserList = appointment.getUserList().stream()
                        .map(item -> userMapper.selectById(item.getId())).toList();
                // 分别发送邮件
                toUserList.forEach(toUser -> sendEmail(newAppointment, fromUser, toUser));
            }
        }
    }

    @Override
    @Transactional
    public void deleteAppointment(Integer appointmentId) {
        // 删除约会参与者
        userAgreeMapper.delete(new LambdaQueryWrapper<UserAgree>()
                .eq(UserAgree::getAgreeId, appointmentId));
        // 删除约会
        appointmentMapper.deleteById(appointmentId);
    }

    @Override
    public String updateAppointment(AgreeDTO appointment) {
        // 用户id
        int userId = appointment.getUserId();
        // 修改约会
        Appointment newAppointment = BeanUtils.copyBean(appointment, Appointment.class);
        Assert.isFalse(editAppointment(appointment.getId()).getStatus() == 1 && appointment.getStatus() == 2,
                "约会已发出,不允许保存为草稿");
        appointmentMapper.updateById(newAppointment);
        if (appointment.getStatus() == 3) {
            return "手动设置约会为完成状态,忽略平台继续寻找约会人员";
        }
        // 删除之前指定的约会人员
        userAgreeMapper.delete(new LambdaQueryWrapper<UserAgree>()
                .eq(UserAgree::getType, 1)
                .eq(UserAgree::getLimitType, 2)
                .eq(UserAgree::getAgreeId, appointment.getId()));
        if (appointment.getStatus() == 5 && newAppointment.getType() == 2) {
            // 查询用户信息
            User fromUser = userMapper.selectById(userId);
            // 要发送的用户列表
            List<User> toUserList = appointment.getUserList().stream()
                    .map(item -> userMapper.selectById(item.getId())).toList();
            // 分别发送邮件,提醒约会取消
            toUserList.forEach(toUser -> sendEmail(newAppointment, fromUser, toUser));
            userMapper.updateDegree(userId, -4 * APPOINTMENT_SCORE);
            return "取消成功,发送邮件通知指定约会人员,约起分数减少 " + -2 * APPOINTMENT_SCORE;
        }
        if (newAppointment.getType() == 2) {
            // 保存指定的约会人员
            Optional.ofNullable(appointment.getUserList()).orElse(new ArrayList<>()).forEach(
                    item -> {
                        Assert.isFalse(StringUtils.isNull(userMapper.selectById(item.getId())),
                                "用户 [" + item.getNickname() + "] 未注册");
                        userAgreeMapper.saveAppointmentDestinedUser(newAppointment.getId(), item.getId());
                    });
            if (newAppointment.getStatus() == 1) {
                // 查询用户信息
                User fromUser = userMapper.selectById(userId);
                // 要发送的用户列表
                List<User> toUserList = appointment.getUserList().stream()
                        .map(item -> userMapper.selectById(item.getId())).toList();
                // 分别发送邮件,提醒邀请应约
                toUserList.forEach(toUser -> sendEmail(newAppointment, fromUser, toUser));
                return "更新成功,正在发送邮件提醒指定约会人员";
            }
            return "更新约会和指定应约者成功";
        }
        return "更新约会成功";
    }

    @Override
    public AgreeVO editAppointment(Integer appointmentId) {
        // 查询约会信息
        AgreeVO appointmentInfo = appointmentMapper.selectAppointmentInfoById(appointmentId);
        Assert.notNull(appointmentInfo, "没有该约会");
        if (appointmentInfo.getStatus() == 3) {
            // 查询约会应约者
            UserAgree destinedUser = userAgreeMapper.selectAppointmentUser(appointmentId);
            appointmentInfo.setDestinedUserId(destinedUser.getUserId());
        }
        return appointmentInfo;
    }

    @Override
    public List<AgreeVO> listAppointmentHomeVO(String keyword) {
        // 查询约会
        List<AgreeVO> appointmentList = appointmentMapper.listAppointmentHomeVO(keyword);
        appointmentList.forEach(appointment -> {
            // 查询浏览量
            Double viewCount = Optional.ofNullable(redisService.getZsetScore(APPOINTMENT_VIEW_COUNT, appointment.getId()))
                    .orElse((double) 0);
            appointment.setViewCount(viewCount.intValue());
        });
        return appointmentList;
    }

    @Override
    public AgreeVO getAppointmentAgreementById(Integer appointmentId) {
        // 查询约会信息
        AgreeVO appointment = appointmentMapper.selectAppointmentAgreementById(appointmentId, ONE);
        if (StringUtils.isNull(appointment)) {
            return null;
        }
        // 浏览量+1
        redisService.incrZet(APPOINTMENT_VIEW_COUNT, appointmentId, 1D);
        // 查询上一篇约会
        PaginationVO lastAppointment = appointmentMapper.selectLastAppointment(appointmentId);
        // 查询下一篇约会
        PaginationVO nextAppointment = appointmentMapper.selectNextAppointment(appointmentId);
        appointment.setLastAgreement(lastAppointment);
        appointment.setNextAgreement(nextAppointment);
        // 查询浏览量
        Double viewCount = Optional.ofNullable(redisService.getZsetScore(APPOINTMENT_VIEW_COUNT, appointmentId))
                .orElse((double) 0);
        appointment.setViewCount(viewCount.intValue());
        return appointment;
    }

    @Override
    public AgreeVO getSpecifyAppointmentAgreementById(Integer appointmentId) {
        // 查询指定约会信息
        AgreeVO appointment = appointmentMapper.selectAppointmentAgreementById(appointmentId, TWO);
        if (StringUtils.isNull(appointment)) {
            return null;
        }
        // 浏览量+1
        redisService.incrZet(APPOINTMENT_VIEW_COUNT, appointmentId, 1D);
        // 查询浏览量
        Double viewCount = Optional.ofNullable(redisService.getZsetScore(APPOINTMENT_VIEW_COUNT, appointmentId))
                .orElse((double) 0);
        appointment.setViewCount(viewCount.intValue());
        return appointment;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String answerAppointment(Integer appointmentId) {
        // 登录用户id
        int userId = StpUtil.getLoginIdAsInt();
        // 查询约会应约者信息
        UserAgree agreementUser = userAgreeMapper.selectOne(new LambdaQueryWrapper<UserAgree>()
                .select(UserAgree::getId, UserAgree::getUserId)
                .eq(UserAgree::getType, 1)
                .eq(UserAgree::getLimitType, 1)
                .eq(UserAgree::getAgreeId, appointmentId));
        if (StringUtils.isNull(agreementUser)) {
            // 应约
            appointmentMapper.updateById(Appointment.builder().id(appointmentId).status(3).build());
            userAgreeMapper.saveAppointmentUser(appointmentId, userId);
            userMapper.updateDegree(userId, APPOINTMENT_SCORE);
            // 发送邮件,提示约会完成信息
            constructionEmailWord(appointmentId);
            return "应约成功,约起分数增加: " + APPOINTMENT_SCORE;
        } else if (agreementUser.getUserId().equals(userId)) {
            // 取消参与,减少约起分数
            userAgreeMapper.deleteById(agreementUser.getId());
            userMapper.updateDegree(userId, -2 * APPOINTMENT_SCORE);
            appointmentMapper.updateById(Appointment.builder().id(appointmentId).status(1).build());
            //  给约起发起者发送邮件,提示约会重置信息
            constructionEmailWord(appointmentId);
            return "成功取消,约起分数减少: " + APPOINTMENT_SCORE;
        } else {
            // 已有应约者
            return "已被捷足先登";
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String uniqueAppointment(Integer appointmentId) {
        // 登录用户id
        int userId = StpUtil.getLoginIdAsInt();
        int agreementUserId = 0;
        // 查询约会指定约会人员信息
        List<UserAgree> agreementUsers = userAgreeMapper.selectList(new LambdaQueryWrapper<UserAgree>()
                .select(UserAgree::getId, UserAgree::getUserId, UserAgree::getStatus)
                .eq(UserAgree::getType, 1)
                .eq(UserAgree::getLimitType, 2)
                .eq(UserAgree::getAgreeId, appointmentId));
        Assert.isTrue(StringUtils.isNotEmpty(agreementUsers), "未指定约会人员");
        for (UserAgree item : agreementUsers) {
            if (item.getStatus().equals(2)) {
                // 已有用户应约
                return "已被捷足先登";
            }
            if (item.getUserId().equals(userId)) {
                // 当前用户是指定约会人员
                agreementUserId = item.getId();
            }
        }
        if (agreementUserId > 0) {
            // 约会重新开放
            appointmentMapper.updateById(Appointment.builder().id(appointmentId).status(1).build());
            // 取消参与,减少约起分数
            userAgreeMapper.updateById(UserAgree.builder().id(agreementUserId).status(3).build());
            userMapper.updateDegree(userId, -2 * APPOINTMENT_SCORE);
            // 发送邮件,提示约会重置信息
            constructionEmailWord(appointmentId);
            return "取消成功,约起分数减少: " + APPOINTMENT_SCORE;
        } else {
            // 约会完成
            appointmentMapper.updateById(Appointment.builder().id(appointmentId).status(3).build());
            // 应约,增加约起分数
            userAgreeMapper.updateById(UserAgree.builder().id(agreementUserId).status(2).build());
            userMapper.updateDegree(userId, APPOINTMENT_SCORE);
            // 发送邮件,提示约会完成信息
            constructionEmailWord(appointmentId);
            return "成功参与,约起分数增加: " + APPOINTMENT_SCORE;
        }
    }

    /**
     * 构造邮件任务
     *
     * @param appointmentId 约会id
     */
    private void constructionEmailWord(Integer appointmentId) {
        Appointment appointment = appointmentMapper.selectOne(new LambdaQueryWrapper<Appointment>()
                .select(Appointment::getTitle, Appointment::getUserId,
                        Appointment::getStatus, Appointment::getType)
                .eq(Appointment::getId, appointmentId));
        User toUser = userMapper.selectById(appointment.getUserId());
        sendEmail(appointment, toUser);
    }

    /**
     * 获取链接地址
     *
     * @param appointment 约会信息
     * @return 链接地址
     */
    private String getUrl(Appointment appointment) {
        String appointmentId = Optional.ofNullable(appointment.getId())
                .map(Object::toString)
                .orElse("");
        if (appointment.getType() == 2) {
            // 构造应约链接
            return websiteUrl + APPOINTMENT_SPECIFY.getPath() + appointmentId;
        } else {
            // 构造个人中心链接
            return websiteUrl + APPOINTMENT.getPath() + appointmentId;
        }
    }

    /**
     * 给指定约会人员发送邮件
     *
     * @param appointment 约会信息
     * @param fromUser    发送方
     * @param toUser      接收方
     */
    private void sendEmail(Appointment appointment, User fromUser, User toUser) {
        MailDTO mailDTO = new MailDTO();
        Map<String, Object> contentMap = new HashMap<>(6);
        String url = getUrl(appointment);
        mailDTO.setToEmail(toUser.getEmail());
        mailDTO.setSubject(APPOINTMENT_REMIND);
        mailDTO.setTemplate(APPOINTMENT_TEMPLATE);
        String createTime = DateUtil.formatLocalDateTime(appointment.getCreateTime());
        contentMap.put("username", fromUser.getUsername());
        contentMap.put("time", createTime);
        contentMap.put("email", fromUser.getEmail());
        contentMap.put("title", appointment.getTitle());
        contentMap.put("url", url);
        contentMap.put("intro", fromUser.getIntro());
        mailDTO.setContentMap(contentMap);
        // 发送HTML邮件
        rabbitTemplate.convertAndSend(EMAIL_EXCHANGE, EMAIL_HTML_KEY, mailDTO);
    }

    /**
     * 发送邮件
     *
     * @param appointment 约会信息
     * @param toUser      接收方
     */
    private void sendEmail(Appointment appointment, User toUser) {
        MailDTO mailDTO = new MailDTO();
        Map<String, Object> contentMap = new HashMap<>(5);
        String url = getUrl(appointment);
        mailDTO.setToEmail(toUser.getEmail());
        Integer status = appointment.getStatus();
        Assert.isTrue(status == 1 || status == 3, "约会状态错误,终止发送邮件");
        String message = "约会已改变";
        if (appointment.getStatus() == 1) {
            mailDTO.setSubject(AGREEMENT_RESET_REMIND);
            message = "约会已重置";
        } else if (appointment.getStatus() == 3) {
            mailDTO.setSubject(AGREEMENT_REMIND);
            message = "约会已完成";
        }
        mailDTO.setTemplate(AGREEMENT_TEMPLATE);
        // 当前时间
        String createTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        contentMap.put("username", toUser.getUsername());
        contentMap.put("message", message);
        contentMap.put("time", createTime);
        contentMap.put("title", appointment.getTitle());
        contentMap.put("url", url);
        mailDTO.setContentMap(contentMap);
        // 发送HTML邮件
        rabbitTemplate.convertAndSend(EMAIL_EXCHANGE, EMAIL_HTML_KEY, mailDTO);
    }
}
