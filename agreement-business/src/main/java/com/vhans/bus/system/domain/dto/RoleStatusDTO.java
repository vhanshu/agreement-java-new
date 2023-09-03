package com.vhans.bus.system.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 角色状态
 *
 * @author vhans
 */
@Data
@ApiModel(description = "角色状态")
public class RoleStatusDTO {
    /**
     * 角色id(标识)
     */
    @NotNull(message = "角色id不能为空")
    @ApiModelProperty(value = "角色id(标识)")
    private String id;

    /**
     * 是否禁用 (0否 1是)
     */
    @NotNull(message = "角色状态不能为空")
    @ApiModelProperty(value = "是否禁用 (0否 1是)")
    private Integer isDisable;
}
