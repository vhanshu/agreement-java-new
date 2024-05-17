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
 * 【访问日志】对象 l_visit_log
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("l_visit_log")
@ApiModel(description = "访问日志对象")
public class VisitLog {
    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "访问日志id")
    private Long id;

    /**
     * 访问页面
     */
    @ApiModelProperty(value = "访问页面")
    private String page;

    /**
     * 访问ip
     */
    @ApiModelProperty(value = "访问ip")
    private String ipAddress;

    /**
     * 访问地址
     */
    @ApiModelProperty(value = "访问地址")
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
     * 添加时间
     */
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "添加时间")
    private LocalDateTime createTime;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 访问页面(like)
         */
        @ApiModelProperty(value = "访问页面")
        private String page;
    }
}
