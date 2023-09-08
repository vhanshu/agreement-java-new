package com.vhans.core.web.model.page;

import lombok.Data;

import java.util.List;

/**
 * 表格分页数据对象
 *
 * @author vhans
 */
@Data
public class TableDataInfo<T> {
    /**
     * 总记录数
     */
    private long total;

    /**
     * 列表数据
     */
    private List<T> rows;

    /**
     * 消息状态码
     */
    private int code;

    /**
     * 消息内容
     */
    private String msg;
}
