package com.vhans.core.constant;

/**
 * 消息动作常量
 *
 * @author vhans
 */
public class MsgActionConstant {

    /**
     * 客户端保持心跳
     */
    public static final int KEEPALIVE = 0;

    /**
     * 绑定用户通道
     */
    public static final int CONNECT = 1;

    /**
     * 聊天消息
     */
    public static final int CHAT = 2;

    /**
     * 群消息
     */
    public static final int GROUP_MSG = 3;

    /**
     * 发送请求
     */
    public static final int SEND_REQUEST = 4;

    /**
     * 处理请求
     */
    public static final int DEAL_REQUEST = 5;

    /**
     * 解散群
     */
    public static final int DELETE_GROUP = 6;

    /**
     * 退出群聊
     */
    public static final int QUIT_GROUP = 7;

    /**
     * 处理转发
     */
    public static final int FORWARD = 8;

    /**
     * 撤销消息
     */
    public static final int REVOKE = 9;

    /**
     * 删除好友
     */
    public static final int DELETE_FRIEND = 10;

    /**
     * 用户入群
     */
    public static final int JOIN_GROUP = 11;

    /**
     * 推送消息
     */
    public static final int PUSH = 20;
}
