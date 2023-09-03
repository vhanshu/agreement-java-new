package com.vhans.bus.user.strategy;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.core.strategy.SocialLoginStrategy;
import com.vhans.bus.user.domain.User;
import com.vhans.bus.user.mapper.UserMapper;
import com.vhans.bus.user.domain.vo.SocialIDInfoVO;
import com.vhans.bus.user.domain.vo.SocialTokenVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * 抽象登录模板
 *
 * @author vhans
 */
@Service
public abstract class AbstractLoginStrategyImpl implements SocialLoginStrategy {

    @Autowired
    private UserMapper userMapper;

    @Override
    public String login(String data) {
        User user;
        // 获取token
        SocialTokenVO socialToken = getSocialToken(data);
        // 获取用户信息
        SocialIDInfoVO socialIDInfoVO = getSocialUserInfo(socialToken);
        // 判断是否已注册
        User existUser = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .select(User::getId)
                .eq(User::getUsername, socialIDInfoVO.getId())
                .eq(User::getLoginType, socialToken.getLoginType()));
        if (Objects.isNull(existUser)) {
            // 用户未登录过
            user = saveLoginUser(socialToken, socialIDInfoVO);
        } else {
            user = existUser;
        }
        // 校验指定账号是否已被封禁，如果被封禁则抛出异常 `DisableServiceException`
        StpUtil.checkDisable(user.getId());
        // 通过校验后，再进行登录
        StpUtil.login(user.getId());
        return StpUtil.getTokenValue();
    }

    /**
     * 获取第三方Token
     *
     * @param data data
     * @return {@link SocialTokenVO} 第三方token
     */
    public abstract SocialTokenVO getSocialToken(String data);

    /**
     * 获取第三方账户信息
     *
     * @param socialToken 第三方token
     * @return {@link SocialIDInfoVO} 第三方用户信息
     */
    public abstract SocialIDInfoVO getSocialUserInfo(SocialTokenVO socialToken);

    /**
     * 新增用户账号
     *
     * @param socialToken 第三方Token
     * @return {@link User} 用户
     */
    private User saveLoginUser(SocialTokenVO socialToken, SocialIDInfoVO socialIDInfoVO) {
        // 新增用户信息
        User newUser = User.builder()
                .avatar(socialIDInfoVO.getAvatar())
                .nickname(socialIDInfoVO.getNickname())
                .username(socialIDInfoVO.getId())
                .password(socialToken.getAccessToken())
                .loginType(socialToken.getLoginType())
                .build();
        userMapper.insert(newUser);
        return newUser;
    }

}
