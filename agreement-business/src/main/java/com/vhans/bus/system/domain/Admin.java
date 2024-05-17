package com.vhans.bus.system.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.vhans.bus.system.domain.vo.AdminRoleVO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 【管理员对象】 s_admin
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("s_admin")
public class Admin {
    /**
     * 管理员id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "管理员昵称")
    private Integer id;

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
     * 管理员密码
     */
    @ApiModelProperty(value = "管理员密码")
    private String password;

    /**
     * 头像
     */
    @ApiModelProperty(value = "头像")
    private String avatar;

    /**
     * 邮箱
     */
    @ApiModelProperty(value = "邮箱")
    private String email;

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
     * 是否禁用 (0否 1是)
     */
    @ApiModelProperty(value = "是否禁用 (0否 1是)")
    private Integer isDisable;

    /**
     * 登录时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "登录时间")
    private LocalDateTime loginTime;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;

    /* 除数据库字段外的其它字段 */
    /**
     * 管理员角色列表
     */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @ApiModelProperty(value = "管理员角色")
    private List<AdminRoleVO> roleList;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 管理员名
         */
        @ApiModelProperty(value = "管理员名")
        private String adminName;
    }
}
