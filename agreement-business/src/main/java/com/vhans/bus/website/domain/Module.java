package com.vhans.bus.website.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.vhans.core.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * 组件对象 w_module
 *
 * @author vhans
 * @date 2024-01-26
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("w_module")
@ApiModel(description = "组件对象")
public class Module {

    /**
     * 组件id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "组件id")
    private Integer id;

    /**
     * 属于者id
     */
    @ApiModelProperty(value = "属于者id")
    private Integer userId;

    /**
     * 组件类型（1链接 2网页 3代码）
     */
    @NotNull(message = "组件类型不能为空")
    @ApiModelProperty(value = "组件类型（1链接 2网页 3代码）")
    private Integer type;

    /**
     * 组件icon
     */
    @ApiModelProperty(value = "组件icon")
    private String icon;

    /**
     * 组件名称
     */
    @ApiModelProperty(value = "组件名称")
    private String name;

    /**
     * 组件内容（json）
     */
    @ApiModelProperty(value = "组件内容（json）")
    private String content;

    /**
     * 组件排序号
     */
    @ApiModelProperty(value = "组件排序号")
    private Integer sort;

    /**
     * 添加时间
     */
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "添加时间")
    @Excel(name = "添加时间")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.UPDATE)
    @ApiModelProperty(value = "更新时间")
    private LocalDateTime updateTime;

    /* 除数据表的额外字段 */
    /**
     * 用户头像
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "用户头像")
    private String avatar;

    /**
     * 用户昵称
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "用户昵称")
    private String nickname;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 属于者id
         */
        @ApiModelProperty(value = "属于者id")
        private Integer userId;

        /**
         * 组件类型（1链接 2网页 3代码）
         */
        @ApiModelProperty(value = "组件类型（1链接 2网页 3代码）")
        private Integer type;

        /**
         * 组件名称
         */
        @ApiModelProperty(value = "组件名称")
        private String name;
    }
}