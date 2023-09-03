package com.vhans.bus.chat.transmit.model;

import com.vhans.bus.chat.domain.GroupMsg;
import com.vhans.bus.chat.domain.Msg;
import com.vhans.bus.chat.domain.Request;
import lombok.Data;

/**
 * @author vhans
 */
@Data
public class DataContent {

    /**
     * 动作类型
     */
    private Integer action;

    /**
     * 用户的聊天内容
     */
    private Msg chatMsg;

    /**
     * 群聊天内容
     */
    private GroupMsg chatGroupMsg;

    /**
     * 请求内容
     */
    private Request chatRequest;

    /**
     * 扩展内容
     */
    private Extend extend;
}
