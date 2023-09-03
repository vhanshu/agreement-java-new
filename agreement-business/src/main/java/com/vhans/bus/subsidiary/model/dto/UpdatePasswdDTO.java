package com.vhans.bus.subsidiary.model.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * 密码更新DTO
 *
 * @author vhans
 */
@Data
@ApiModel(description = "密码更新DTO")
public class UpdatePasswdDTO {
    /**
     * 账号(对于前台为邮箱)
     */
    @NotBlank(message = "账号不能为空")
    @ApiModelProperty(value = "账号")
    private String username;

    /**
     * 密码
     */
    @NotBlank(message = "密码不能为空")
    @Size(min = 6, message = "密码不能少于6位")
    @ApiModelProperty(value = "密码")
    private String password;

    /**
     * 验证码
     */
    @NotBlank(message = "验证码不能为空")
    @ApiModelProperty(value = "验证码")
    private String code;
}
