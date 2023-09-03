package com.vhans.bus.system.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 【菜单】对象 s_menu
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("s_menu")
@ApiModel(description = "菜单对象")
public class Menu {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "菜单id")
    private Integer id;

    /**
     * 父菜单id (paren_id为0且type为M则是一级菜单)
     */
    @ApiModelProperty(value = "父级菜单id")
    private Integer parentId;

    /**
     * 菜单类型 (M目录 C菜单 B按钮)
     */
    @NotBlank(message = "类型不能为空")
    @ApiModelProperty(value = "类型（M目录 C菜单 B按钮）")
    private String menuType;

    /**
     * 名称
     */
    @NotBlank(message = "菜单名称不能为空")
    @ApiModelProperty(value = "菜单名称")
    private String menuName;

    /**
     * 路由地址
     */
    @ApiModelProperty(value = "路由地址")
    private String path;

    /**
     * 菜单图标
     */
    @ApiModelProperty(value = "菜单图标")
    private String icon;

    /**
     * 菜单组件
     */
    @ApiModelProperty(value = "菜单组件")
    private String component;

    /**
     * 权限标识
     */
    @ApiModelProperty(value = "权限标识")
    private String perms;

    /**
     * 是否隐藏 (0否 1是)
     */
    @ApiModelProperty(value = "是否隐藏 (0否 1是)")
    private Integer isHidden;

    /**
     * 是否禁用 (0否 1是)
     */
    @ApiModelProperty(value = "是否禁用 (0否 1是)")
    private Integer isDisable;

    /**
     * 排序
     */
    @NotNull(message = "菜单排序不能为空")
    @ApiModelProperty(value = "菜单排序")
    private Integer orderNum;

    /**
     * 添加时间
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

    /* 除数据库字段外的其它字段 */
    /**
     * 子菜单列表
     */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @ApiModelProperty(value = "子菜单列表")
    private List<Menu> children;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 名称
         */
        @ApiModelProperty(value = "菜单名称")
        private String menuName;

        /**
         * 是否禁用 (0否 1是)
         */
        @ApiModelProperty(value = "是否禁用 (0否 1是)")
        private Integer isDisable;
    }
}
