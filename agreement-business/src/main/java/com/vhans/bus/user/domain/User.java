package com.vhans.bus.user.domain;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

/**
 * 【用户】对象 u_user
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "用户对象")
@TableName("u_user")
public class User {
    /**
     * 用户id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "用户id")
    private Integer id;

    /**
     * 用户昵称
     */
    @NotBlank(message = "用户昵称不能为空")
    @ApiModelProperty(value = "用户昵称")
    private String nickname;

    /**
     * 用户名
     */
    @NotBlank(message = "用户名不能为空")
    @ApiModelProperty(value = "用户名")
    private String username;

    /**
     * 用户密码
     */
    @ApiModelProperty(value = "用户密码")
    private String password;

    /**
     * 头像
     */
    @ApiModelProperty(value = "头像")
    private String avatar;

    /**
     * 个人简介
     */
    @ApiModelProperty(value = "个人简介")
    private String intro;

    /**
     * 邮箱
     */
    @ApiModelProperty(value = "邮箱")
    private String email;

    /**
     * 用户性别(0保密 1男 2女)
     */
    @ApiModelProperty(value = "用户性别(0保密 1男 2女)")
    private Integer sex;

    /**
     * 活动参与度
     */
    @ApiModelProperty(value = "活动参与度")
    private Integer degree;

    /**
     * 解疑等级
     */
    @ApiModelProperty(value = "解疑等级")
    private Integer grade;

    /**
     * 登录ip
     */
    @ApiModelProperty(value = "登录ip")
    private String ipAddress;

    /**
     * 登录地址
     */
    @ApiModelProperty(value = "登录地址")
    private String ipSource;

    /**
     * 登录方式(1邮箱 2QQ 3Gitee 4Github)
     */
    @ApiModelProperty(value = "登录方式(1邮箱 2QQ 3Gitee 4Github)")
    private Integer loginType;

    /**
     * 是否禁用(0否 1是)
     */
    @ApiModelProperty(value = "是否禁用(0否 1是)")
    private Integer isDisable;

    /**
     * 登录时间
     */
    @ApiModelProperty(value = "登录时间")
    private LocalDateTime loginTime;

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

    /* 除数据表的额外字段 */
    /**
     * 好友备注
     */
    @ApiModelProperty(value = "好友备注")
    @TableField(exist = false)
    private String friendRemark;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 用户称呼(姓名或昵称)
         */
        @ApiModelProperty(value = "用户称呼(姓名或昵称)")
        private String name;

        /**
         * 登录方式(1邮箱 2QQ 3Gitee 4Github)
         */
        @ApiModelProperty(value = "登录方式(1邮箱 2QQ 3Gitee 4Github)")
        private Integer loginType;

        /**
         * 是否禁用(0否 1是)
         */
        @ApiModelProperty(value = "是否禁用(0否 1是)")
        private Integer isDisable;
    }
}
