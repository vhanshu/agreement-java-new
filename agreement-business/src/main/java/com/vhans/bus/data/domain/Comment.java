package com.vhans.bus.data.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.vhans.bus.data.domain.vo.ReplyVO;
import com.vhans.bus.subsidiary.annotation.CommentType;
import com.vhans.bus.subsidiary.validator.comment.CommentProvider;
import com.vhans.bus.subsidiary.validator.comment.groups.ParentIdNotNull;
import com.vhans.bus.subsidiary.validator.comment.groups.ParentIdNull;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.group.GroupSequenceProvider;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 【评论】对象 d_comment
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@GroupSequenceProvider(value = CommentProvider.class)
@ApiModel(description = "评论对象")
@TableName("d_comment")
public class Comment {
    /**
     * 评论id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty("评论id")
    private Integer id;

    /**
     * 类型(1记录 2提问)
     */
    @CommentType(values = {1, 2}, message = "评论类型只能为1记录、2题目")
    @NotNull(message = "评论类型不能为空")
    @ApiModelProperty("类型")
    private Integer type;

    /**
     * 类型id
     */
    @NotNull(message = "记录id不能为空", groups = {Record.class})
    @NotNull(message = "题目id不能为空", groups = {com.vhans.bus.subsidiary.validator.comment.groups.Quiz.class})
    @ApiModelProperty("类型id")
    private Integer typeId;

    /**
     * 父评论id
     */
    @ApiModelProperty("父评论id")
    private Integer parentId;

    /**
     * 回复评论id
     */
    @Null(message = "reply_id、to_uid必须都为空", groups = {ParentIdNull.class})
    @NotNull(message = "回复评论id和回复用户id不能为空", groups = {ParentIdNotNull.class})
    @ApiModelProperty("回复评论id")
    private Integer replyId;

    /**
     * 评论内容
     */
    @NotBlank(message = "评论内容不能为空")
    @ApiModelProperty("评论内容")
    private String content;

    /**
     * 评论用户id
     */
    @ApiModelProperty("评论用户id")
    private Integer fromUid;

    /**
     * 回复用户id
     */
    @Null(message = "reply_id、to_uid必须都为空", groups = {ParentIdNull.class})
    @NotNull(message = "回复评论id和回复用户id不能为空", groups = {ParentIdNotNull.class})
    @ApiModelProperty("回复用户id")
    private Integer toUid;

    /**
     * 点赞数
     */
    @ApiModelProperty("点赞数")
    private Integer likeNumber;

    /**
     * 是否通过(0否 1是)
     */
    @ApiModelProperty("是否通过")
    private Integer isCheck;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.UPDATE)
    @ApiModelProperty("更新时间")
    private LocalDateTime updateTime;

    /* 除数据表的额外字段 */
    /**
     * 评论文本标题
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "评论文本标题")
    private String title;

    /**
     * 头像
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "头像")
    private String avatar;

    /**
     * 评论用户昵称
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "评论用户昵称")
    private String fromNickname;

    /**
     * 被回复用户昵称
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "被回复用户昵称")
    private String toNickname;

    /**
     * 回复量
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "回复量")
    private Integer replyNumber;

    /**
     * 回复列表
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "回复列表")
    private List<ReplyVO> replyList;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 评论用户昵称(like)
         */
        @ApiModelProperty(value = "评论用户昵称")
        private String fromNickname;

        /**
         * 类型(1记录 2提问)
         */
        @ApiModelProperty("类型(1记录 2提问)")
        private Integer type;

        /**
         * 类型id
         */
        @ApiModelProperty("类型id")
        private Integer typeId;

        /**
         * 评论文本标题(like)
         */
        @ApiModelProperty(value = "评论文本标题")
        private String title;

        /**
         * 是否通过(0否 1是)
         */
        @ApiModelProperty("是否通过")
        private Integer isCheck;
    }
}
