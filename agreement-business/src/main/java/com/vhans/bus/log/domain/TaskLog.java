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
 * 【任务日志】对象 l_task_log
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("l_task_log")
@ApiModel(description = "任务日志对象")
public class TaskLog {
    /**
     * 任务日志id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "任务日志id")
    private Long id;

    /**
     * 任务名称
     */
    @ApiModelProperty(value = "任务名称")
    private String taskName;

    /**
     * 任务组名
     */
    @ApiModelProperty(value = "任务组名")
    private String taskGroup;

    /**
     * 调用目标字符串
     */
    @ApiModelProperty(value = "调用目标字符串")
    private String invokeTarget;

    /**
     * 日志信息
     */
    @ApiModelProperty(value = "日志信息")
    private String taskMessage;

    /**
     * 执行状态 (0失败 1正常)
     */
    @ApiModelProperty(value = "执行状态 (0失败 1正常)")
    private Integer status;

    /**
     * 错误信息
     */
    @ApiModelProperty(value = "错误信息")
    private String errorInfo;

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
         * 任务名称(like)
         */
        @ApiModelProperty(value = "任务名称")
        private String taskName;

        /**
         * 任务组名(like)
         */
        @ApiModelProperty(value = "任务组名")
        private String taskGroup;

        /**
         * 执行状态 (0失败 1正常)
         */
        @ApiModelProperty(value = "执行状态 (0失败 1正常)")
        private Integer status;
    }
}
