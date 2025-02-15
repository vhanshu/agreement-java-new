package com.vhans.bus.website.domain;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * 【任务】对象 w_task
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("w_task")
@ApiModel(description = "定时任务对象")
public class Task {
    /**
     * 任务id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "任务id")
    private Integer id;

    /**
     * 任务名称
     */
    @NotBlank(message = "任务名称不能为空")
    @ApiModelProperty(value = "任务名称")
    private String taskName;

    /**
     * 任务组名
     */
    @NotBlank(message = "任务组名不能为空")
    @ApiModelProperty(value = "任务组名")
    private String taskGroup;

    /**
     * 调用目标
     */
    @NotBlank(message = "调用目标不能为空")
    @ApiModelProperty(value = "调用目标")
    private String invokeTarget;

    /**
     * cron执行表达式
     */
    @ApiModelProperty(value = "cron执行表达式")
    private String cronExpression;

    /**
     * 计划执行错误策略 (1立即执行 2执行一次 3放弃执行)
     */
    @ApiModelProperty(value = "计划执行错误策略 (1立即执行 2执行一次 3放弃执行)")
    private Integer misfirePolicy;

    /**
     * 是否并发执行 (0否 1是)
     */
    @ApiModelProperty(value = "是否并发执行 (0否 1是)")
    private Integer concurrent;

    /**
     * 任务状态 (0运行 1暂停)
     */
    @ApiModelProperty(value = "任务状态 (0运行 1暂停)")
    private Integer status;

    /**
     * 任务备注信息
     */
    @ApiModelProperty(value = "任务备注信息")
    private String remark;

    /**
     * 添加时间
     */
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "添加时间")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.UPDATE)
    @ApiModelProperty(value = "更新时间")
    private LocalDateTime updateTime;

    /* 除数据表的额外字段 */
    /**
     * 下次执行时间
     */
    @ApiModelProperty(value = "下次执行时间")
    @TableField(exist = false)
    private Date nextValidTime;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
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
         * 任务状态 (0运行 1暂停)
         */
        @ApiModelProperty(value = "任务状态 (0运行 1暂停)")
        private Integer status;
    }
}
