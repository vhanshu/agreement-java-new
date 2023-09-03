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
 * 【角色】对象 s_role
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("s_role")
@ApiModel(description = "角色对象")
public class Role {
    /**
     * 角色id(标识)
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "角色id(标识)")
    private String id;

    /**
     * 角色名称
     */
    @NotBlank(message = "角色名不能为空")
    @ApiModelProperty(value = "角色名")
    private String roleName;

    /**
     * 角色描述
     */
    @ApiModelProperty(value = "角色描述")
    private String roleDesc;

    /**
     * 是否禁用 (0否 1是)
     */
    @NotNull(message = "角色状态不能为空")
    @ApiModelProperty(value = "是否禁用 (0否 1是)")
    private Integer isDisable;

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
     * 菜单id集合
     */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @ApiModelProperty(value = "菜单id集合")
    private List<Integer> menuIdList;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 角色名称
         */
        @ApiModelProperty(value = "角色名")
        private String roleName;

        /**
         * 是否禁用 (0否 1是)
         */
        @ApiModelProperty(value = "是否禁用 (0否 1是)")
        private Integer isDisable;
    }
}
