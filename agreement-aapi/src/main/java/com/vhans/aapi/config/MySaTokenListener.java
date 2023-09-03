package com.vhans.aapi.config;

import cn.dev33.satoken.listener.SaTokenListener;
import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.system.domain.Admin;
import com.vhans.core.utils.web.IpUtils;
import com.vhans.core.utils.web.UserAgentUtils;
import com.vhans.bus.system.mapper.AdminMapper;
import com.vhans.bus.subsidiary.model.vo.OnlineVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Map;

import static com.vhans.core.constant.CommonConstant.ONLINE_ADMIN;
import static com.vhans.core.enums.ZoneEnum.SHANGHAI;

/**
 * 自定义侦听器的实现
 *
 * @author vhans
 */
@Component
public class MySaTokenListener implements SaTokenListener {

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private HttpServletRequest request;

    /**
     * 每次登录时触发
     */
    @Override
    public void doLogin(String loginType, Object loginId, String tokenValue, SaLoginModel loginModel) {
        // 查询管理员昵称
        Admin admin = adminMapper.selectOne(new LambdaQueryWrapper<Admin>()
                .select(Admin::getAvatar, Admin::getNickname)
                .eq(Admin::getId, loginId));
        // 解析browser和os
        Map<String, String> adminAgentMap = UserAgentUtils.parseOsAndBrowser(request.getHeader("User-Agent"));
        // 获取登录ip地址
        String ipAddress = IpUtils.getIpAddress(request);
        // 获取登录地址
        String ipSource = IpUtils.getIpSource(ipAddress);
        // 获取登录时间
        LocalDateTime loginTime = LocalDateTime.now(ZoneId.of(SHANGHAI.getZone()));
        // 更新管理员登录信息
        adminMapper.updateById(Admin.builder()
                .id((Integer) loginId)
                .ipAddress(ipAddress)
                .ipSource(ipSource)
                .loginTime(loginTime)
                .build());
        // 管理员在线信息存入tokenSession
        SaSession tokenSession = StpUtil.getTokenSessionByToken(tokenValue);
        tokenSession.set(ONLINE_ADMIN, OnlineVO.builder()
                .id((Integer) loginId)
                .token(tokenValue)
                .avatar(admin.getAvatar())
                .nickname(admin.getNickname())
                .ipAddress(ipAddress)
                .ipSource(ipSource)
                .os(adminAgentMap.get("os"))
                .browser(adminAgentMap.get("browser"))
                .loginTime(loginTime)
                .build());
    }

    /**
     * 每次注销时触发
     */
    @Override
    public void doLogout(String loginType, Object loginId, String tokenValue) {
        // 删除缓存中的管理员信息
        StpUtil.logoutByTokenValue(tokenValue);
    }

    /**
     * 每次被踢下线时触发
     */
    @Override
    public void doKickout(String loginType, Object loginId, String tokenValue) {
    }

    /**
     * 每次被顶下线时触发
     */
    @Override
    public void doReplaced(String loginType, Object loginId, String tokenValue) {

    }

    /**
     * 每次被封禁时触发
     */
    @Override
    public void doDisable(String loginType, Object loginId, String service, int level, long disableTime) {

    }

    /**
     * 每次被解封时触发
     */
    @Override
    public void doUntieDisable(String loginType, Object loginId, String service) {

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
