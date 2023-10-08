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
     * 接收者id(可以是群聊id)
     */
    private Integer toUid;

    /**
     * 转发类型(1单聊 2群聊)
     */
    private Integer type;

    /**
     * 转发内容
     */
    private String content;

    /**
     * 转发消息类型(1文本 2文件 3图片 4视频 5语音)
     */
    private Integer msgType;
}
