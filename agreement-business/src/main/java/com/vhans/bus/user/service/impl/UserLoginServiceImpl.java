package com.vhans.bus.user.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.captcha.generator.RandomGenerator;
import cn.hutool.core.lang.Assert;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.vhans.bus.subsidiary.model.dto.UpdatePasswdDTO;
import com.vhans.bus.user.domain.User;
import com.vhans.bus.user.domain.dto.GitDTO;
import com.vhans.bus.subsidiary.model.dto.LoginDTO;
import com.vhans.bus.user.domain.dto.QqLoginDTO;
import com.vhans.bus.user.domain.dto.RegisterDTO;
import com.vhans.bus.user.mapper.UserMapper;
import com.vhans.bus.user.service.IUserLoginService;
import com.vhans.bus.website.domain.SiteConfig;
import com.vhans.core.enums.LoginTypeEnum;
import com.vhans.core.redis.RedisService;
import com.vhans.core.strategy.context.SocialLoginStrategyContext;
import com.vhans.core.utils.SecurityUtils;
import com.vhans.core.utils.data.StringUtils;
import com.vhans.core.web.model.dto.MailDTO;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.concurrent.TimeUnit;

import static com.vhans.core.constant.CommonConstant.*;
import static com.vhans.core.constant.MqConstant.EMAIL_EXCHANGE;
import static com.vhans.core.constant.MqConstant.EMAIL_SIMPLE_KEY;
import static com.vhans.core.constant.RedisConstant.*;
import static com.vhans.core.enums.LoginTypeEnum.EMAIL;
import static com.vhans.core.utils.CommonUtils.checkEmail;

/**
 * 登录业务接口实现类
 *
 * @author vhans
 **/
@Service
public class UserLoginServiceImpl implements IUserLoginService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Autowired
    private RedisService redisService;

    @Autowired
    private SocialLoginStrategyContext socialLoginStrategyContext;

    @Override
    public String login(LoginDTO login) {
        User user = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .select(User::getId)
                .eq(User::getUsername, login.getUsername())
                .eq(User::getPassword, SecurityUtils.sha256Encrypt(login.getPassword())));
        Assert.notNull(user, "用户不存在或密码错误");
        // 校验指定账号是否已被封禁，如果被封禁则抛出异常 `DisableServiceException`
        StpUtil.checkDisable(user.getId());
        // 通过校验后，再进行登录
        StpUtil.login(user.getId());
        return StpUtil.getTokenValue();
    }

    @Override
    public void sendCode(String email) {
        Assert.isTrue(checkEmail(email), "邮箱格式不正确,仅支持qq邮箱");
        RandomGenerator randomGenerator = new RandomGenerator("0123456789", 6);
        String code = randomGenerator.generate();
        MailDTO mailDTO = MailDTO.builder()
                .toEmail(email)
                .subject(CAPTCHA)
                .content("您的验证码为 " + code + " 有效期为" + CODE_EXPIRE_TIME + "分钟")
                .build();
        // 验证码存入消息队列
        rabbitTemplate.convertAndSend(EMAIL_EXCHANGE, EMAIL_SIMPLE_KEY, mailDTO);
        // 验证码存入redis
        redisService.setObject(CODE_KEY_USER + email, code, CODE_EXPIRE_TIME, TimeUnit.MINUTES);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void register(RegisterDTO register) {
        verifyCode(register.getEmail(), register.getCode());
        Assert.isFalse(userMapper.exists(new LambdaQueryWrapper<User>()
                .eq(User::getEmail, register.getEmail())), "邮箱已注册!");
        SiteConfig siteConfig = redisService.getObject(SITE_SETTING);
        // 添加用户
        userMapper.insert(User.builder()
                .username(register.getEmail())
                .email(register.getEmail())
                .nickname(USER_NICKNAME + IdWorker.getId())
                .avatar(siteConfig.getUserAvatar())
                .password(SecurityUtils.sha256Encrypt(register.getPassword()))
                .loginType(EMAIL.getLoginType())
                .isDisable(FALSE)
                .build());
    }

    @Override
    public void updatePasswd(UpdatePasswdDTO passwdDTO) {
        verifyCode(passwdDTO.getUsername(), passwdDTO.getCode());
        // 查询用户
        User user = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .select(User::getId)
                .eq(User::getEmail, passwdDTO.getUsername()));
        Assert.isTrue(StringUtils.isNotNull(user), "邮箱尚未注册!");
        // 更新密码
        userMapper.updateById(User.builder()
                .password(SecurityUtils.sha256Encrypt(passwdDTO.getPassword()))
                .id(user.getId()).build());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String giteeLogin(GitDTO data) {
        return socialLoginStrategyContext.executeLoginStrategy(JSON.toJSONString(data), LoginTypeEnum.GITEE);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String githubLogin(GitDTO data) {
        return socialLoginStrategyContext.executeLoginStrategy(JSON.toJSONString(data), LoginTypeEnum.GITHUB);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String qqLogin(QqLoginDTO qqLogin) {
        return socialLoginStrategyContext.executeLoginStrategy(JSON.toJSONString(qqLogin), LoginTypeEnum.QQ);
    }

    /**
     * 校验验证码
     *
     * @param email 邮箱
     * @param code  验证码
     */
    private void verifyCode(String email, String code) {
        String sysCode = redisService.getObject(CODE_KEY_USER + email);
        Assert.notBlank(sysCode, "验证码未发送或已过期！");
        Assert.isTrue(sysCode.equals(code), "验证码错误，请重新输入！");
    }

}