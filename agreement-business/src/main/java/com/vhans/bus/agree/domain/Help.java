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
 * 【帮助】对象 b_help
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "帮助对象")
@TableName("a_help")
public class Help {
    /**
     * 帮忙id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "帮忙id")
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
     * 帮忙主题
     */
    @ApiModelProperty(value = "帮忙主题")
    private String title;

    /**
     * 帮忙内容
     */
    @ApiModelProperty(value = "帮忙内容")
    private String content;

    /**
     * 需要人数
     */
    @ApiModelProperty(value = "需要人数")
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
     * 报酬
     */
    @ApiModelProperty(value = "报酬")
    private String reward;

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
