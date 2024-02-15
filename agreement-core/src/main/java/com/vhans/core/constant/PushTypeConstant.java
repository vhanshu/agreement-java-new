package com.vhans.core.constant;

/**
 * 推送类型常量
 *
 * @author vhans
 * @data 2023-11-01 13:17
 */
public class PushTypeConstant {
    /**
     * 通知
     */
    public static final int PUSH_NOTIFY = 0;
    /**
     * 评论
     */
    public static final int PUSH_COMMENT = 1;
    /**
     * 点赞
     */
    public static final int PUSH_LIKE = 2;

    /**
     * 作答
     */
    public static final int PUSH_ANSWER = 3;

    /**
     * 用户上线
     */
    public static final int PUSH_ONLINE = 4;

    /**
     * 实时世界窗(//用户id id: number;//用户称呼 name: string;//用户头像 avatar: string;//窗口数据(富文本) data: string;//发送时间 time: string;)
     */
    public static final int PUSH_WORLD = 10;
}
