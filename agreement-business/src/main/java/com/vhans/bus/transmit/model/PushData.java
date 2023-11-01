package com.vhans.bus.transmit.model;

import lombok.Builder;
import lombok.Data;

/**
 * 推送数据对象
 *
 * @author vhans
 */
@Data
@Builder
public class PushData {
    /**
     * 推送类型(0通知 1评论 2点赞)
     */
    private Integer type;

    /**
     * 推送对象(一段文本或json格式的对象)
     */
    private String data;
}
