package com.vhans.bus.user.domain.vo;

import lombok.Data;

/**
 * QQ用户信息
 *
 * @author vhans
 **/
@Data
public class QqUserInfoVO {

    /**
     * QQ头像
     */
    private String figureurl_qq_1;

    /**
     * 昵称
     */
    private String nickname;
}