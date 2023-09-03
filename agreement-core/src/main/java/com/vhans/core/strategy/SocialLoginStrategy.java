package com.vhans.core.strategy;

/**
 * 第三方登录策略
 *
 * @author vhans
 */
public interface SocialLoginStrategy {

    /**
     * 登录
     *
     * @param data data
     * @return {@link String} Token
     */
    String login(String data);
}
