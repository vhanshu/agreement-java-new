package com.vhans.bus.chat.transmit.model;

import lombok.Data;

/**
 * 通讯传输对象
 *
 * @author vhans
 */
@Data
public class DataContent {

    /**
     * 动作类型
     */
    private Integer action;

    /**
     * 返回状态
     */
    private Boolean flag;

    /**
     * 传输数据(对象用json格式)
     * {@link com.vhans.bus.chat.domain.Msg} 单聊内容
     * {@link com.vhans.bus.chat.domain.GroupMsg} 群聊内容
     * {@link com.vhans.bus.chat.domain.Request} 请求内容
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
