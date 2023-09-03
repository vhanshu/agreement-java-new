package com.vhans.bus.user.strategy;

import com.alibaba.fastjson2.JSON;
import com.vhans.core.enums.LoginTypeEnum;
import com.vhans.core.exception.ServiceException;
import com.vhans.core.utils.CommonUtils;
import com.vhans.bus.user.domain.dto.QqLoginDTO;
import com.vhans.bus.user.domain.vo.QqTokenVO;
import com.vhans.bus.user.domain.vo.QqUserInfoVO;
import com.vhans.bus.user.domain.vo.SocialIDInfoVO;
import com.vhans.bus.user.domain.vo.SocialTokenVO;
import com.vhans.core.config.properties.QqProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import static com.vhans.core.constant.SocialLoginConstant.*;

/**
 * Qq登录策略
 *
 * @author vhans
 **/
@Service("qqLoginStrategyImpl")
public class QqLoginStrategyImpl extends AbstractLoginStrategyImpl {

    @Autowired
    private QqProperties qqProperties;

    @Autowired
    private RestTemplate restTemplate;

    @Override
    public SocialTokenVO getSocialToken(String data) {
        QqLoginDTO qqLoginVO = JSON.parseObject(data, QqLoginDTO.class);
        // 校验QQ token信息
        checkQqToken(qqLoginVO);
        // 返回token信息
        return SocialTokenVO.builder()
                .openId(qqLoginVO.getOpenId())
                .accessToken(qqLoginVO.getAccessToken())
                .loginType(LoginTypeEnum.QQ.getLoginType())
                .build();
    }

    @Override
    public SocialIDInfoVO getSocialUserInfo(SocialTokenVO socialToken) {
        // 定义请求参数
        Map<String, String> formData = new HashMap<>(3);
        formData.put(QQ_OPEN_ID, socialToken.getOpenId());
        formData.put(ACCESS_TOKEN, socialToken.getAccessToken());
        formData.put(OAUTH_CONSUMER_KEY, qqProperties.getAppId());
        // 获取QQ返回的用户信息
        QqUserInfoVO qqUserInfo = JSON.parseObject(restTemplate.getForObject(qqProperties.getUserInfoUrl(), String.class, formData), QqUserInfoVO.class);
        // 返回用户信息
        return SocialIDInfoVO.builder()
                .nickname(Objects.requireNonNull(qqUserInfo).getNickname())
                .avatar(qqUserInfo.getFigureurl_qq_1())
                .build();
    }

    /**
     * 校验qq token信息
     *
     * @param qqLogin qq登录信息
     */
    private void checkQqToken(QqLoginDTO qqLogin) {
        // 根据token获取qq openId信息
        Map<String, String> qqData = new HashMap<>(1);
        qqData.put(ACCESS_TOKEN, qqLogin.getAccessToken());
        try {
            String result = restTemplate.getForObject(qqProperties.getCheckTokenUrl(), String.class, qqData);
            QqTokenVO qqTokenVO = JSON.parseObject(CommonUtils.getBracketsContent(Objects.requireNonNull(result)), QqTokenVO.class);
            // 判断openId是否一致
            if (!qqLogin.getOpenId().equals(qqTokenVO.getOpenid())) {
                throw new ServiceException("qq登录错误");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException("qq登录错误");
        }
    }
}