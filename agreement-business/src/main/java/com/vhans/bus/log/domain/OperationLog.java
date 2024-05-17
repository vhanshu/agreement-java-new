package com.vhans.bus.log.domain;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 【操作日志】对象 l_operation_log
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "操作日志对象")
@TableName("l_operation_log")
public class OperationLog {
    /**
     * 操作id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "操作日志id")
    private Integer id;

    /**
     * 操作模块
     */
    @ApiModelProperty(value = "操作模块")
    private String module;

    /**
     * 操作类型
     */
    @ApiModelProperty(value = "操作类型")
    private String type;

    /**
     * 操作uri
     */
    @ApiModelProperty(value = "操作uri")
    private String uri;

    /**
     * 方法名称
     */
    @ApiModelProperty(value = "操作方法")
    private String name;

    /**
     * 操作描述
     */
    @ApiModelProperty(value = "操作描述")
    private String description;

    /**
     * 请求参数
     */
    @ApiModelProperty(value = "请求参数")
    private String params;

    /**
     * 请求方式
     */
    @ApiModelProperty(value = "请求方式")
    private String method;

    /**
     * 返回数据
     */
    @ApiModelProperty(value = "返回数据")
    private String data;

    /**
     * 用户id
     */
    @ApiModelProperty(value = "用户id")
    private Integer userId;

    /**
     * 用户昵称
     */
    @ApiModelProperty(value = "用户昵称")
    private String nickname;

    /**
     * 操作ip
     */
    @ApiModelProperty(value = "操作ip")
    private String ipAddress;

    /**
     * 操作地址
     */
    @ApiModelProperty(value = "操作地址")
    private String ipSource;

    /**
     * 操作耗时 (毫秒)
     */
    @ApiModelProperty(value = "操作耗时 (毫秒)")
    private long times;

    /**
     * 添加时间
     */
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "添加时间")
    private LocalDateTime createTime;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 操作模块
         */
        @ApiModelProperty(value = "操作模块")
        private String module;

        /**
         * 操作描述
         */
        @ApiModelProperty(value = "操作描述")
        private String description;
    }
}
