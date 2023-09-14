package com.vhans.bus.subsidiary.model.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * 登录信息
 *
 * @author vhans
 **/
@Data
@ApiModel(description = "登录信息")
public class LoginDTO {

    /**
     * 账号或者邮箱
     */
    @NotBlank(message = "账号不能为空")
    @ApiModelProperty(value = "账号或者邮箱")
    private String username;

    /**
     * 用户密码
     */
    @NotBlank(message = "密码不能为空")
    @Size(min = 6, message = "密码不能少于6位")
    @ApiModelProperty(value = "用户密码")
    private String password;

}
