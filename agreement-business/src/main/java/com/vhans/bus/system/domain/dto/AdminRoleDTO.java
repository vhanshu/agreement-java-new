package com.vhans.bus.system.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 管理员角色DTO
 * @author vhans
 */
@Data
@ApiModel(description = "管理员角色DTO")
public class AdminRoleDTO {
    /**
     * 管理员id
     */
    @NotNull(message = "管理员id不能为空")
    @ApiModelProperty(value = "管理员id")
    private Integer id;

    /**
     * 昵称
     */
    @NotBlank(message = "昵称不能为空")
    @ApiModelProperty(value = "昵称")
    private String nickname;

    /**
     * 角色id
     */
    @NotNull(message = "角色id不能为空")
    @ApiModelProperty(value = "角色id")
    private List<String> roleIdList;
}
