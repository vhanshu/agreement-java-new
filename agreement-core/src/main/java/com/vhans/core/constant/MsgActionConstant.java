package com.vhans.core.constant;

/**
 * 消息动作常量
 *
 * @author vhans
 */
public class MsgActionConstant {

    /**
     * 第一次(或重连)初始化连接
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
     * 消息签收
     */
    public static final int SIGNED = 4;

    /**
     * 发送请求
     */
    public static final int SEND_REQUEST = 5;

    /**
     * 处理请求
     */
    public static final int DEAL_REQUEST = 6;

    /**
     * 客户端保持心跳
     */
    public static final int KEEPALIVE = 7;

    /**
     * 解散群或者退出群聊
     */
    public static final int CLOSE_GROUP = 8;

    /**
     * 处理转发
     */
    public static final int FORWARD = 9;

    /**
     * 转发申请
     */
    public static final int FORWARD_APPLICATION = 10;

    /**
     * 转发回答
     */
    public static final int FORWARD_ANSWER = 11;

    /**
     * 转发ICE
     */
    public static final int FORWARD_ICE = 12;

    /**
     * 转发通知
     */
    public static final int FORWARD_OFFER = 13;

    /**
     * 转发挂起
     */
    public static final int FORWARD_HANGUP = 14;
}
