package com.vhans.bus.agree.domain;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

/**
 * 【活动】对象 b_activity
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "活动对象")
@TableName("a_activity")
public class Activity {
    /**
     * 活动id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "活动id")
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
     * 活动主题
     */
    @ApiModelProperty(value = "活动主题")
    private String title;

    /**
     * 活动内容
     */
    @ApiModelProperty(value = "活动内容")
    private String content;

    /**
     * 与会人数
     */
    @ApiModelProperty(value = "与会人数")
    private Integer peopleNumber;

    /**
     * 开始时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "开始时间")
    private LocalDateTime timeStart;

    /**
     * 结束时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
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
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "添加时间")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.UPDATE)
    @ApiModelProperty(value = "更新时间")
    private LocalDateTime updateTime;
}
