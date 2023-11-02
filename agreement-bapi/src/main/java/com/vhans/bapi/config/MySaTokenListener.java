package com.vhans.bapi.config;

import cn.dev33.satoken.listener.SaTokenListener;
import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.subsidiary.model.vo.OnlineVO;
import com.vhans.bus.transmit.config.NettyWsChannelInboundHandler;
import com.vhans.bus.user.domain.User;
import com.vhans.core.utils.web.IpUtils;
import com.vhans.core.utils.web.UserAgentUtils;
import com.vhans.bus.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Map;

import static com.vhans.core.constant.CommonConstant.ONLINE_USER;
import static com.vhans.core.constant.PushTypeConstant.PUSH_NOTIFY;
import static com.vhans.core.enums.ZoneEnum.SHANGHAI;

/**
 * 自定义侦听器的实现
 *
 * @author vhans
 */
@Component
public class MySaTokenListener implements SaTokenListener {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private HttpServletRequest request;

    /**
     * 每次登录时触发
     */
    @Override
    public void doLogin(String loginType, Object loginId, String tokenValue, SaLoginModel loginModel) {
        // 查询用户昵称
        User user = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .select(User::getAvatar, User::getNickname)
                .eq(User::getId, loginId));
        // 解析browser和os
        Map<String, String> userAgentMap = UserAgentUtils.parseOsAndBrowser(request.getHeader("User-Agent"));
        // 获取登录ip地址
        String ipAddress = IpUtils.getIpAddress(request);
        // 获取登录地址
        String ipSource = IpUtils.getIpSource(ipAddress);
        // 获取登录时间
        LocalDateTime loginTime = LocalDateTime.now(ZoneId.of(SHANGHAI.getZone()));
        // 更新用户登录信息
        userMapper.updateById(User.builder()
                .id((Integer) loginId)
                .ipAddress(ipAddress)
                .ipSource(ipSource)
                .loginTime(loginTime)
                .build());
        // 用户在线信息存入tokenSession
        SaSession tokenSession = StpUtil.getTokenSessionByToken(tokenValue);
        tokenSession.set(ONLINE_USER, OnlineVO.builder()
                .id((Integer) loginId)
                .token(tokenValue)
                .avatar(user.getAvatar())
                .nickname(user.getNickname())
                .ipAddress(ipAddress)
                .ipSource(ipSource)
                .os(userAgentMap.get("os"))
                .browser(userAgentMap.get("browser"))
                .loginTime(loginTime)
                .build());
    }

    /**
     * 每次注销时触发
     */
    @Override
    public void doLogout(String loginType, Object loginId, String tokenValue) {
        // 删除缓存中的用户信息
        StpUtil.logoutByTokenValue(tokenValue);
        NettyWsChannelInboundHandler.pushInfo(PUSH_NOTIFY, "您已注销登录", (Integer) loginId);
    }

    /**
     * 每次被踢下线时触发
     */
    @Override
    public void doKickout(String loginType, Object loginId, String tokenValue) {
        NettyWsChannelInboundHandler.pushInfo(PUSH_NOTIFY, "您已被踢下线", (Integer) loginId);
    }

    /**
     * 每次被顶下线时触发
     */
    @Override
    public void doReplaced(String loginType, Object loginId, String tokenValue) {
        NettyWsChannelInboundHandler.pushInfo(PUSH_NOTIFY, "您已被顶下线", (Integer) loginId);

    }

    /**
     * 每次被封禁时触发
     */
    @Override
    public void doDisable(String loginType, Object loginId, String service, int level, long disableTime) {
        NettyWsChannelInboundHandler.pushInfo(PUSH_NOTIFY, "您已被封禁", (Integer) loginId);
    }

    /**
     * 每次被解封时触发
     */
    @Override
    public void doUntieDisable(String loginType, Object loginId, String service) {
        NettyWsChannelInboundHandler.pushInfo(PUSH_NOTIFY, "您已被解封", (Integer) loginId);
    }

    /**
     * 每次二级认证时触发
     */
    @Override
    public void doOpenSafe(String loginType, String tokenValue, String service, long safeTime) {

    }

    /**
     * 每次退出二级认证时触发
     */
    @Override
    public void doCloseSafe(String loginType, String tokenValue, String service) {

    }

    /**
     * 每次创建Session时触发
     */
    @Override
    public void doCreateSession(String id) {
    }

    /**
     * 每次注销Session时触发
     */
    @Override
    public void doLogoutSession(String id) {

    }

    /**
     * 每次Token续期时触发
     */
    @Override
    public void doRenewTimeout(String tokenValue, Object loginId, long timeout) {

    }
}
