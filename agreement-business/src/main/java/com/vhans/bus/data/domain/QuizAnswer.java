package com.vhans.bus.data.domain;

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
 * 题目作答对象 d_quiz_answer
 *
 * @author vhans
 * @date 2023-11-01
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("d_quiz_answer")
@ApiModel(description = "题目作答对象")
public class QuizAnswer {

    /**
     * 作答id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "作答id")
    private Integer id;

    /**
     * 题目id
     */
    @NotNull(message = "题目id不能为空")
    @ApiModelProperty(value = "题目id")
    private Integer quizId;

    /**
     * 作答者id
     */
    @ApiModelProperty(value = "作答者id")
    private Integer userId;

    /**
     * 作答内容
     */
    @NotBlank(message = "作答内容不能为空")
    @ApiModelProperty(value = "作答内容")
    private String content;

    /**
     * 点赞数
     */
    @ApiModelProperty(value = "点赞数")
    private Integer likeNumber;

    /**
     * 是否通过
     */
    @ApiModelProperty(value = "是否通过")
    private Integer isCheck;

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
     * 题目标题
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "题目标题")
    private String title;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 题目id
         */
        @ApiModelProperty(value = "题目id")
        private Integer quizId;

        /**
         * 作答者id
         */
        @ApiModelProperty(value = "作答者id")
        private Integer userId;

        /**
         * 关键字
         */
        @TableField(exist = false)
        @ApiModelProperty(value = "关键字")
        private String keyword;

        /**
         * 是否通过
         */
        @ApiModelProperty(value = "是否通过")
        private Integer isCheck;
    }
}
