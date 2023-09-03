package com.vhans.bus.data.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * 标签DTO
 *
 * @author vhans
 */
@Data
@ApiModel(description = "标签DTO")
public class TagDTO {
    /**
     * 标签类型(1:记录,2:题目)
     */
    @ApiModelProperty(value = "标签类型(1:记录,2:题目)")
    private Integer type;

    /**
     * 标签ids
     */
    @ApiModelProperty(value = "标签ids")
    private List<Integer> tagIds;
}
