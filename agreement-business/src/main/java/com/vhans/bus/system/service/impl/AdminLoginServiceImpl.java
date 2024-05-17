package com.vhans.bus.system.service.impl;

import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.captcha.generator.RandomGenerator;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.subsidiary.model.dto.LoginDTO;
import com.vhans.bus.system.domain.dto.UpdatePasswdDTO;
import com.vhans.bus.subsidiary.model.vo.OnlineVO;
import com.vhans.bus.system.domain.Admin;
import com.vhans.bus.system.mapper.AdminMapper;
import com.vhans.bus.system.service.IAdminLoginService;
import com.vhans.core.redis.RedisService;
import com.vhans.core.utils.SecurityUtils;
import com.vhans.core.utils.data.StringUtils;
import com.vhans.core.web.model.dto.MailDTO;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.TimeUnit;

import static com.vhans.core.constant.CommonConstant.*;
import static com.vhans.core.constant.MqConstant.EMAIL_EXCHANGE;
import static com.vhans.core.constant.MqConstant.EMAIL_SIMPLE_KEY;
import static com.vhans.core.constant.NumberConstant.ONE;
import static com.vhans.core.constant.RedisConstant.CODE_EXPIRE_TIME;
import static com.vhans.core.constant.RedisConstant.CODE_KEY_ADMIN;

/**
 * 后台登录业务接口实现类
 *
 * @author vhans
 **/
@Service
public class AdminLoginServiceImpl implements IAdminLoginService {

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Autowired
    private RedisService redisService;

    @Override
    public String loginAdmin(LoginDTO login) {
        Admin admin = adminMapper.selectOne(new LambdaQueryWrapper<Admin>()
                .select(Admin::getId)
                .eq(Admin::getAdminName, login.getUsername())
                .eq(Admin::getPassword, SecurityUtils.sha256Encrypt(login.getPassword())));
        Assert.notNull(admin, "管理员不存在或密码错误");
        // 校验指定账号是否已被封禁，如果被封禁则抛出异常 `DisableServiceException`
        StpUtil.checkDisable(admin.getId());
        // 通过校验后，再进行登录
        StpUtil.login(admin.getId());
        return StpUtil.getTokenValue();
    }

    @Override
    public void sendCode(String admin) {
        Admin adminInfo = adminMapper.selectOne(new LambdaQueryWrapper<Admin>()
                .select(Admin::getEmail)
                .eq(Admin::getAdminName, admin));
        Assert.isFalse(StringUtils.isNull(adminInfo), "不存在管理员信息: " + admin);
        RandomGenerator randomGenerator = new RandomGenerator("0123456789", 6);
        String code = randomGenerator.generate();
        MailDTO mailDTO = MailDTO.builder()
                .toEmail(adminInfo.getEmail())
                .subject(CAPTCHA)
                .content("您的验证码为 " + code + " 有效期为" + CODE_EXPIRE_TIME + "分钟")
                .build();
        // 验证码存入消息队列
        rabbitTemplate.convertAndSend(EMAIL_EXCHANGE, EMAIL_SIMPLE_KEY, mailDTO);
        // 验证码存入redis
        redisService.setObject(CODE_KEY_ADMIN + admin, code, CODE_EXPIRE_TIME, TimeUnit.MINUTES);
    }

    @Override
    public void updatePasswd(UpdatePasswdDTO passwdDTO) {
        verifyCode(passwdDTO.getUsername(), passwdDTO.getCode());
        // 查询管理员
        Admin admin = adminMapper.selectOne(new LambdaQueryWrapper<Admin>()
                .select(Admin::getId)
                .eq(Admin::getAdminName, passwdDTO.getUsername()));
        Assert.isTrue(StringUtils.isNotNull(admin), "不存在管理员信息!");
        // 更新密码
        adminMapper.updateById(Admin.builder()
                .password(SecurityUtils.sha256Encrypt(passwdDTO.getPassword()))
                .id(admin.getId()).build());
    }

    @Override
    public List<OnlineVO> listOnline(String name, Integer type) {
        Assert.notNull(type, "未指定人员类型");
        // 查询所有会话token
        List<String> tokenList = StpUtil.searchTokenSessionId("", 0, -1, false);
        List<OnlineVO> list = tokenList.stream()
                .map(token -> {
                    // 获取tokenSession
                    SaSession sessionBySessionId = StpUtil.getSessionBySessionId(token);
                    return (OnlineVO) sessionBySessionId.get(type == ONE ? ONLINE_USER : ONLINE_ADMIN);
                }).filter(onlineVO -> StringUtils.isEmpty(name) || StringUtils.isNotNull(onlineVO) && onlineVO.getNickname().contains(name))
                .sorted(Comparator.comparing(OnlineVO::getLoginTime).reversed())
                .toList();
        return StringUtils.isNotEmpty(list) && list.get(0) != null ? list : new ArrayList<>();
    }

    /**
     * 校验密码更新验证码
     *
     * @param adminName 账号
     * @param code      验证码
     */
    private void verifyCode(String adminName, String code) {
        String sysCode = redisService.getObject(CODE_KEY_ADMIN + adminName);
        Assert.notBlank(sysCode, "验证码未发送或已过期!");
        Assert.isTrue(sysCode.equals(code), "验证码错误，请重新输入!");
    }
}