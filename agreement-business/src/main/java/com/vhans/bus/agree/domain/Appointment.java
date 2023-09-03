package com.vhans.bus.agree.domain;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 【约会】对象 b_appointment
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "约会对象")
@TableName("a_appointment")
public class Appointment {
    /**
     * 约会id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "约会id")
    private Integer id;

    /**
     * 发起者id
     */
    @ApiModelProperty(value = "发起者id")
    private Integer userId;

    /**
     * 缩略图
     */
    @ApiModelProperty(value = "缩略图")
    private String cover;

    /**
     * 约会主题
     */
    @ApiModelProperty(value = "约会主题")
    private String title;

    /**
     * 约会内容
     */
    @ApiModelProperty(value = "约会内容")
    private String content;

    /**
     * 发出类型 (1广播 2指定)
     */
    @ApiModelProperty(value = "发出类型 (1广播 2指定)")
    private Integer type;

    /**
     * 开始时间
     */
    @ApiModelProperty(value = "开始时间")
    private LocalDateTime timeStart;

    /**
     * 结束时间
     */
    @ApiModelProperty(value = "结束时间")
    private LocalDateTime timeEnd;

    /**
     * 状态(1发出 2草稿 3完成 4过期 5取消)
     */
    @ApiModelProperty(value = "状态(1发出 2草稿 3完成 4过期 5取消)")
    private Integer status;

    /**
     * 添加时间
     */
    @ApiModelProperty(value = "添加时间")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;
}
