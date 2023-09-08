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
 * 用户请求对象 c_request
 *
 * @author vhans
 * @date 2023-05-21
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "用户请求对象")
@TableName("c_request")
public class Request {

    /**
     * 编号
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "编号")
    private Integer id;

    /**
     * 请求用户id
     */
    @NotNull(message = "请求用户不能为空")
    @ApiModelProperty(value = "请求用户id")
    private Integer fromUid;

    /**
     * 目标用户id
     */
    @NotNull(message = "目标用户不能为空")
    @ApiModelProperty(value = "目标用户id")
    private Integer toUid;

    /**
     * 请求理由
     */
    @NotBlank(message = "请求理由不能为空")
    @ApiModelProperty(value = "请求理由")
    private String reason;

    /**
     * 请求类型(1好友 2群聊)
     */
    @ApiModelProperty(value = "请求类型(1好友 2群聊)")
    private Integer type;

    /**
     * 群id
     */
    @ApiModelProperty(value = "群id")
    private Integer groupId;

    /**
     * 请求状态(1通过 2拒绝 3申请中)
     */
    @ApiModelProperty(value = "请求状态(1通过 2拒绝 3申请中)")
    private Integer status;

    /**
     * 是否查看
     */
    @ApiModelProperty(value = "是否查看")
    private Integer isLook;

    /**
     * 添加时间
     */
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "添加时间")
    private LocalDateTime createTime;

    /**
     * 查看时间
     */
    @TableField(fill = FieldFill.UPDATE)
    @ApiModelProperty(value = "查看时间")
    private LocalDateTime updateTime;

    /* 除数据表的额外字段 */
    /**
     * 头像
     */
    @ApiModelProperty(value = "头像")
    @TableField(exist = false)
    private String avatar;

    /**
     * 昵称
     */
    @ApiModelProperty(value = "昵称")
    @TableField(exist = false)
    private String nickname;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 请求用户id
         */
        @ApiModelProperty(value = "请求用户id")
        private Integer fromUid;

        /**
         * 目标用户id
         */
        @ApiModelProperty(value = "目标用户id")
        private Integer toUid;

        /**
         * 请求类型(1好友 2群聊)
         */
        @ApiModelProperty(value = "请求类型(1好友 2群聊)")
        private Integer type;

        /**
         * 请求状态(1通过 2拒绝 3申请中)
         */
        @ApiModelProperty(value = "请求状态(1通过 2拒绝 3申请中)")
        private Integer status;

        /**
         * 是否查看
         */
        @ApiModelProperty(value = "是否查看")
        private Integer isLook;
    }

}
