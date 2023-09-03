package com.vhans.bus.chat.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 最近对话Vo
 *
 * @author vhans
 */
@Data
@ApiModel(description = "最近对话Vo")
public class ConversationVO {

    /**
     * id(好友/群聊)
     */
    @ApiModelProperty(value = "id")
    private Integer id;

    /**
     * 会话名称
     */
    @ApiModelProperty(value = "会话名称")
    private String name;

    /**
     * 会话图片
     */
    @ApiModelProperty(value = "会话图片")
    private String img;

    /**
     * 最后一条消息
     */
    @ApiModelProperty(value = "最后一条消息")
    private String lastMsg;

    /**
     * 最后一条消息发送时间
     */
    @ApiModelProperty(value = "最后一条消息发送时间")
    private LocalDateTime time;

    /**
     * 未读消息数
     */
    @ApiModelProperty(value = "未读消息数")
    private Integer unread;

    /**
     * 是否删除
     */
    @ApiModelProperty(value = "是否删除")
    private Integer isDelete;

}
