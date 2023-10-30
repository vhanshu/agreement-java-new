package com.vhans.bus.transmit.model;

import lombok.Data;

/**
 * 通讯传输对象
 *
 * @author vhans
 */
@Data
public class DataContent {

    /**
     * 动作类型(0客户端保持心跳 1绑定用户通道 2聊天消息 3群消息 4发送请求 5处理请求 6解散群 7退出群 8处理转发 9撤销消息 10推送 11评论)
     */
    private Integer action;

    /**
     * 返回状态
     */
    private Boolean flag;

    /**
     * 传输数据(对象用json格式)
     * 基本数据
     * {@link com.vhans.bus.chat.domain.Msg} 单聊内容
     * {@link com.vhans.bus.chat.domain.GroupMsg} 群聊内容
     * {@link com.vhans.bus.chat.domain.Request} 请求内容
     * {@link com.vhans.bus.data.domain.Comment} 评论内容
     * {@link Forward} 转发内容
     */
    private String data;

    /**
     * 返回信息
     */
    private String msg;

    public static DataContent success(Integer action) {
        return buildDataContent(action, true, null, "发送成功");
    }

    public static DataContent success(Integer action, String data) {
        return buildDataContent(action, true, data, "发送成功");
    }

    public static DataContent fail() {
        return buildDataContent(null, false, null, "发送失败");
    }

    private static DataContent buildDataContent(Integer action, Boolean flag, String data, String message) {
        DataContent r = new DataContent();
        r.setAction(action);
        r.setFlag(flag);
        r.setData(data);
        r.setMsg(message);
        return r;
    }
}
