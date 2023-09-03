package com.vhans.bus.subsidiary.model.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 上下篇VO
 * @author vhans
 */
@Data
@ApiModel(description = "上下篇VO")
public class PaginationVO {
    /**
     * id
     */
    @ApiModelProperty(value = "id")
    private Integer id;

    /**
     * 图
     */
    @ApiModelProperty(value = "图")
    private String img;

    /**
     * 标题
     */
    @ApiModelProperty(value = "标题")
    private String title;
}
