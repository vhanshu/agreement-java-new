package com.vhans.bus.data.domain;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

/**
 * 【标签】对象 d_tag
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("d_tag")
@ApiModel(description = "标签对象")
public class Tag {
    /**
     * 标签id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "标签id")
    private Integer id;

    /**
     * 标签名
     */
    @NotBlank(message = "标签名不能为空")
    @ApiModelProperty(value = "标签名")
    private String tagName;

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

    /* 除数据库外的字段 */
    /**
     * 该类型数量
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "该类型数量")
    private Integer count;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 标签名
         */
        @ApiModelProperty(value = "标签名")
        private String tagName;

        /**
         * 标签类型
         */
        @ApiModelProperty(value = "标签类型")
        private Integer type;
    }
}
