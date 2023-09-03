package com.vhans.bus.user.domain.vo;

import lombok.Data;

/**
 * QQ token信息
 *
 * @author vhans
 **/
@Data
public class QqTokenVO {

    /**
     * openid
     */
    private String openid;

    /**
     * 客户端id
     */
    private String client_id;
}