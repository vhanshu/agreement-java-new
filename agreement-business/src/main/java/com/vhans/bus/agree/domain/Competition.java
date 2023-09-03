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
 * 【赛事】对象 b_competition
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "赛事对象")
@TableName("a_competition")
public class Competition {
    /**
     * 赛事id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "赛事id")
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
     * 赛事主题
     */
    @ApiModelProperty(value = "赛事主题")
    private String title;

    /**
     * 赛事内容
     */
    @ApiModelProperty(value = "赛事内容")
    private String content;

    /**
     * 参赛队人数
     */
    @ApiModelProperty(value = "参赛队人数")
    private Integer peopleNumber;

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
     * 是否赌注
     */
    @ApiModelProperty(value = "是否赌注")
    private Integer isWager;

    /**
     * 赌注内容
     */
    @ApiModelProperty(value = "赌注内容")
    private String wagerContent;

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
