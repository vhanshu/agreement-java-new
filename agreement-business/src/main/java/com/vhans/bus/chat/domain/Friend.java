package com.vhans.bus.chat.domain;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * 好友对象 c_friend
 *
 * @author vhans
 * @date 2023-05-21
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "好友对象")
@TableName("c_friend")
public class Friend {

    /**
     * 编号
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "编号")
    private Integer id;

    /**
     * 用户id
     */
    @NotNull(message = "用户不能为空")
    @ApiModelProperty(value = "用户id")
    private Integer userId;

    /**
     * 好友id
     */
    @NotNull(message = "好友不能为空")
    @ApiModelProperty(value = "好友id")
    private Integer friendId;

    /**
     * 好友备注
     */
    @NotBlank(message = "好友备注不能为空")
    @ApiModelProperty(value = "好友备注")
    private String friendRemark;

    /**
     * 是否删除(0否 1是)
     */
    @ApiModelProperty(value = "是否删除(0否 1是)")
    private Integer isDelete;

    /**
     * 添加时间
     */
    @ApiModelProperty(value = "添加时间")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;

    /* 除数据表的额外字段 */
    /**
     * 好友头像
     */
    @ApiModelProperty(value = "好友头像")
    @TableField(exist = false)
    private String avatar;

    /**
     * 最近登录时间
     */
    @ApiModelProperty(value = "最近登录时间")
    @TableField(exist = false)
    private LocalDateTime loginTime;

    /* 定义需要查询的字段对象 */
    @Data
    @ApiModel(description = "好友查询条件")
    public static class Query {
        /**
         * 好友备注
         */
        @ApiModelProperty(value = "好友备注")
        private String friendRemark;

        /**
         * 用户id
         */
        @ApiModelProperty(value = "用户id")
        private Integer userId;

        /**
         * 是否删除(0否 1是)
         */
        @ApiModelProperty(value = "是否删除(0否 1是)")
        private Integer isDelete;
    }
}
