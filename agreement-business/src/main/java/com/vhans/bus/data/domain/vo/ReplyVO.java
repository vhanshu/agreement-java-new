package com.vhans.bus.data.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 回复VO
 *
 * @author vhans
 */
@Data
@ApiModel(description = "回复VO")
public class ReplyVO {
    /**
     * 评论id
     */
    @ApiModelProperty(value = "评论id")
    private Integer id;

    /**
     * 父级评论id
     */
    @ApiModelProperty(value = "父级评论id")
    private Integer parentId;

    /**
     * 评论用户id
     */
    @ApiModelProperty("评论用户id")
    private Integer fromUid;

    /**
     * 头像
     */
    @ApiModelProperty(value = "头像")
    private String avatar;

    /**
     * 评论用户昵称
     */
    @ApiModelProperty(value = "评论用户昵称")
    private String fromNickname;

    /**
     * 被评论用户id
     */
    @ApiModelProperty(value = "被评论用户id")
    private Integer toUid;

    /**
     * 被回复用户昵称
     */
    @ApiModelProperty(value = "被回复用户昵称")
    private String toNickname;

    /**
     * 评论内容
     */
    @ApiModelProperty(value = "评论内容")
    private String content;

    /**
     * 点赞数
     */
    @ApiModelProperty(value = "点赞数")
    private Integer likeNumber;

    /**
     * 评论时间
     */
    @ApiModelProperty(value = "评论时间")
    private LocalDateTime createTime;
}
