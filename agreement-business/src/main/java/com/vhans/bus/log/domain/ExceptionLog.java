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
 * 【异常日志】对象 l_exception_log
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("l_exception_log")
@ApiModel(description = "异常日志对象")
public class ExceptionLog {
    /**
     * 异常id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "异常id")
    private Integer id;

    /**
     * 异常模块
     */
    @ApiModelProperty(value = "异常模块")
    private String module;

    /**
     * 异常uri
     */
    @ApiModelProperty(value = "异常uri")
    private String uri;

    /**
     * 异常名称
     */
    @ApiModelProperty(value = "异常名称")
    private String name;

    /**
     * 操作描述
     */
    @ApiModelProperty(value = "操作描述")
    private String description;

    /**
     * 异常方法
     */
    @ApiModelProperty(value = "异常方法")
    private String errorMethod;

    /**
     * 异常信息
     */
    @ApiModelProperty(value = "异常信息")
    private String message;

    /**
     * 请求参数
     */
    @ApiModelProperty(value = "请求参数")
    private String params;

    /**
     * 请求方式
     */
    @ApiModelProperty(value = "请求方式")
    private String requestMethod;

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
     * 操作系统
     */
    @ApiModelProperty(value = "操作系统")
    private String os;

    /**
     * 浏览器
     */
    @ApiModelProperty(value = "浏览器")
    private String browser;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.UPDATE)
    @ApiModelProperty(value = "更新时间")
    private LocalDateTime updateTime;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 异常模块(like)
         */
        @ApiModelProperty(value = "异常模块")
        private String module;

        /**
         * 操作描述(like)
         */
        @ApiModelProperty(value = "操作描述")
        private String description;
    }
}
