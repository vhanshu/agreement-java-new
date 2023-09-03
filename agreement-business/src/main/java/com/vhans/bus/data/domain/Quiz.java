package com.vhans.bus.data.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import com.vhans.bus.data.domain.vo.TagOptionVO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 【问题】对象 d_quiz
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("d_quiz")
@ApiModel(description = "问题对象")
public class Quiz {
    /**
     * 提问id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "提问id")
    private Integer id;

    /**
     * 提问者id
     */
    @ApiModelProperty(value = "提问者id")
    private Integer userId;

    /**
     * 提问标题
     */
    @NotBlank(message = "提问标题不能为空")
    @ApiModelProperty(value = "提问标题")
    private String title;

    /**
     * 提问内容
     */
    @NotBlank(message = "提问内容不能为空")
    @ApiModelProperty(value = "提问内容")
    private String content;

    /**
     * 提问图片集
     */
    @ApiModelProperty(value = "提问图片集")
    private String images;

    /**
     * 点赞数
     */
    @ApiModelProperty(value = "点赞数")
    private Integer likeNumber;

    /**
     * 收藏数
     */
    @ApiModelProperty(value = "收藏数")
    private Integer collectNumber;

    /**
     * 是否通过(0否 1是)
     */
    @ApiModelProperty(value = "是否通过(0否 1是)")
    private Integer isCheck;

    /**
     * 是否解答(0否 1是)
     */
    @ApiModelProperty(value = "是否解答(0否 1是)")
    private Integer isSolve;

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
     * 浏览量
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "浏览量")
    private Integer viewCount;

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
     * 标签集
     */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @ApiModelProperty(value = "文章标签集")
    private List<TagOptionVO> tagVOList;

    /**
     * 标签名称集
     */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @ApiModelProperty(value = "文章标签名称集")
    private List<String> tagNameList;

    /**
     * 上一题
     */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @ApiModelProperty(value = "上一题")
    private PaginationVO lastQuiz;

    /**
     * 下一题
     */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @ApiModelProperty(value = "下一题")
    private PaginationVO nextQuiz;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 提问者id(eq)
         */
        @ApiModelProperty(value = "提问者id")
        private Integer userId;

        /**
         * 提问标题(like)
         */
        @ApiModelProperty(value = "提问标题")
        private String title;

        /**
         * 是否通过(0否 1是)(eq)
         */
        @ApiModelProperty(value = "是否通过 (0否 1是)")
        private Integer isCheck;

        /**
         * 是否解答(0否 1是)(eq)
         */
        @ApiModelProperty(value = "是否解答 (0否 1是)")
        private Integer isSolve;
    }
}
