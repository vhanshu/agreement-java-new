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
 * 用户聊天信息对象 c_msg
 *
 * @author vhans
 * @date 2023-05-21
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "用户聊天信息对象")
@TableName("c_msg")
public class Msg {

    /**
     * 编号
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "编号")
    private Integer id;

    /**
     * 发出用户id
     */
    @NotNull(message = "发出用户不能为空")
    @ApiModelProperty(value = "发出用户id")
    private Integer fromUid;

    /**
     * 目标用户id
     */
    @NotNull(message = "目标用户不能为空")
    @ApiModelProperty(value = "目标用户id")
    private Integer toUid;

    /**
     * 文件id
     */
    @ApiModelProperty(value = "文件id")
    private Integer fileId;

    /**
     * 内容(可以是文件名)
     */
    @NotBlank(message = "消息内容不能为空")
    @ApiModelProperty(value = "内容(可以是文件名)")
    private String content;

    /**
     * 类型(0系统 1文本 2文件 3图片 4视频 5语音)
     */
    @ApiModelProperty(value = "类型(0系统 1文本 2文件 3图片 4视频 5语音)")
    private Integer msgType;

    /**
     * 是否读取
     */
    @ApiModelProperty(value = "是否读取")
    private Integer isRead;

    /**
     * 发送时间
     */
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "发送时间")
    private LocalDateTime createTime;

    /**
     * 查看时间
     */
    @TableField(fill = FieldFill.UPDATE)
    @ApiModelProperty(value = "查看时间")
    private LocalDateTime updateTime;

    /* 除数据表的额外字段 */
    /**
     * 用户头像
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "用户头像")
    private String avatar;

    /**
     * 用户昵称
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "用户昵称")
    private String nickname;

    /**
     * 文件url
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "文件url")
    private String fileUrl;

    /**
     * 文件大小
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "文件大小")
    private Integer fileSize;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 类型(0系统 1文本 2文件 3图片 4视频 5语音)
         */
        @ApiModelProperty(value = "类型(0系统 1文本 2文件 3图片 4视频 5语音)")
        private Integer msgType;

        /**
         * 内容(like)
         */
        @ApiModelProperty(value = "内容")
        private String content;

        /**
         * 是否读取
         */
        @ApiModelProperty(value = "是否读取")
        private Integer isRead;

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
