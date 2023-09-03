package com.vhans.bus.system.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.util.List;

/**
 * 管理员信息
 * @author vhans
 */
@Data
@Builder
@ApiModel(description = "管理员信息")
public class AdminInfo {
    /**
     * 管理员id
     */
    @ApiModelProperty(value = "管理员id")
    private Integer id;

    /**
     * 头像
     */
    @ApiModelProperty(value = "头像")
    private String avatar;

    /**
     * 管理员邮箱
     */
    @ApiModelProperty(value = "管理员邮箱")
    private String email;

    /**
     * 管理员昵称
     */
    @ApiModelProperty(value = "管理员昵称")
    private String nickname;

    /**
     * 管理员名
     */
    @ApiModelProperty(value = "管理员名")
    private String adminName;

    /**
     * 角色
     */
    @ApiModelProperty(value = "角色")
    private List<String> roleList;

    /**
     * 权限标识
     */
    @ApiModelProperty(value = "权限标识")
    private List<String> permissionList;
}
