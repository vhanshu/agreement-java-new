package com.vhans.bus.chat.transmit.model;

import lombok.Data;

/**
 * 通讯转发对象
 *
 * @author vhans
 * @data 2023-09-08 17:19
 */
@Data
public class Forward {
    /**
     * 转发者id
     */
    private Integer fromUid;

    /**
     * 接收者id
     */
    private Integer toUid;

    /**
     * 转发类型(1:单聊 2:群聊)
     */
    private Integer type;

    /**
     * 转发内容
     */
    private String content;

    /**
     * 转发消息类型(1:文本 2:文件 3:图片 4:视频 5:语音)
     */
    private Integer msgType;
}
