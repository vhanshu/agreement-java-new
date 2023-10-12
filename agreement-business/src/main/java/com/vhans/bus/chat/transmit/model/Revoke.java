package com.vhans.bus.chat.transmit.model;

import lombok.Data;

/**
 * 通讯撤销对象
 *
 * @author vhans
 * @data 2023-09-08 17:19
 */
@Data
public class Revoke {
    /**
     * 撤销者id
     */
    private Integer fromUid;

    /**
     * 接收者id(可以是群聊id)
     */
    private Integer toUid;

    /**
     * 撤销消息id
     */
    private Integer msgId;

    /**
     * 撤销类型(1单聊 2群聊)
     */
    private Integer type;

    /**
     * 撤销者名
     */
    private String name;
}
