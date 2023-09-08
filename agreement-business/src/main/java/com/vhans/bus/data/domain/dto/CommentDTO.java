package com.vhans.bus.data.domain.dto;

import com.vhans.bus.subsidiary.annotation.CommentType;
import com.vhans.bus.subsidiary.validator.comment.CommentProvider;
import com.vhans.bus.subsidiary.validator.comment.groups.ParentIdNotNull;
import com.vhans.bus.subsidiary.validator.comment.groups.ParentIdNull;
import com.vhans.bus.subsidiary.validator.comment.groups.Quiz;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.group.GroupSequenceProvider;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

/**
 * 评论DTO
 *
 * @author vhans
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@GroupSequenceProvider(value = CommentProvider.class)
@ApiModel(description = "评论DTO")
public class CommentDTO {

    /**
     * 类型id
     */
    @NotNull(message = "记录id不能为空", groups = {Record.class})
    @NotNull(message = "题目id不能为空", groups = {Quiz.class})
    @ApiModelProperty(value = "类型id")
    private Integer typeId;

    /**
     * 评论类型(1记录 2题目)
     */
    @CommentType(values = {1, 2}, message = "评论类型只能为1记录、2题目")
    @NotNull(message = "评论类型不能为空")
    @ApiModelProperty(value = "评论类型 (1记录 2题目)")
    private Integer type;

    /**
     * 父评论id
     */
    @Null(groups = {ParentIdNull.class})
    @NotNull(groups = {ParentIdNotNull.class})
    @ApiModelProperty(value = "父评论id")
    private Integer parentId;

    /**
     * 被回复评论id
     */
    @Null(message = "reply_id、to_uid必须都为空", groups = {ParentIdNull.class})
    @NotNull(message = "回复评论id和回复用户id不能为空", groups = {ParentIdNotNull.class})
    @ApiModelProperty(value = "被回复评论id")
    private Integer replyId;

    /**
     * 被回复用户id
     */
    @Null(message = "reply_id、to_uid必须都为空", groups = {ParentIdNull.class})
    @NotNull(message = "回复评论id和回复用户id不能为空", groups = {ParentIdNotNull.class})
    @ApiModelProperty(value = "被回复用户id")
    private Integer toUid;

    /**
     * 评论内容
     */
    @NotBlank(message = "评论内容不能为空")
    @ApiModelProperty(value = "评论内容")
    private String content;

}
