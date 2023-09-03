package com.vhans.bus.chat.transmit.model;

import lombok.Data;

/**
 * @author vhans
 */
@Data
public class Extend {

    /**
     * 操作状态(true成功,false失败)
     */
    private boolean status;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 目标用户id
     */
    private Integer toUserId;

    /**
     * 用户称呼
     */
    private String nickName;

    /**
     * 群聊处理类型(quit退出 delete删除)
     */
    private String groupDealType;

    /**
     * 群id
     */
    private Integer groupId;

    /**
     * 转发类别(apply申请 reply回复 offer通知 answer回答 hangup挂起 ice链接)
     */
    private String forwardType;
}
