package com.vhans.bus.chat.domain;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * 群聊天信息对象 c_group_msg
 *
 * @author vhans
 * @date 2023-05-21
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "群聊天信息对象")
@TableName("c_group_msg")
public class GroupMsg {

    /**
     * 编号
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "编号")
    private Integer id;

    /**
     * 群id
     */
    @NotBlank(message = "群id不能为空")
    @ApiModelProperty(value = "群id")
    private Integer groupId;

    /**
     * 用户id
     */
    @NotNull(message = "用户不能为空")
    @ApiModelProperty(value = "用户id")
    private Integer userId;

    /**
     * 类型(0系统 1文本 2文件 3图片 4视频 5语音)
     */
    @ApiModelProperty(value = "类型(0系统 1文本 2文件 3图片 4视频 5语音)")
    private Integer msgType;

    /**
     * 消息内容
     */
    @NotBlank(message = "消息内容不能为空")
    @ApiModelProperty(value = "消息内容")
    private String content;

    /**
     * 发送时间
     */
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "发送时间")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.UPDATE)
    @ApiModelProperty(value = "更新时间")
    private LocalDateTime updateTime;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 群id
         */
        @ApiModelProperty(value = "群id")
        private Integer groupId;

        /**
         * 用户id
         */
        @ApiModelProperty(value = "用户id")
        private Integer userId;

        /**
         * 类型(0系统 1文本 2文件 3图片 4视频 5语音)
         */
        @ApiModelProperty(value = "类型(0系统 1文本 2文件 3图片 4视频 5语音)")
        private Integer msgType;

        /**
         * 消息内容
         */
        @ApiModelProperty(value = "消息内容")
        private String content;

        /**
         * 开始时间
         */
        @ApiModelProperty(value = "开始时间")
        @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
        private LocalDateTime startTime;

        /**
         * 结束时间
         */
        @ApiModelProperty(value = "结束时间")
        @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
        private LocalDateTime endTime;
    }

}
