package com.vhans.bus.data.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 标签统计VO
 *
 * @author vhans
 */
@Data
@ApiModel(description = "标签统计VO")
public class TagStatisticsVO {
    /**
     * 标签id
     */
    @ApiModelProperty(value = "标签id")
    private Integer id;

    /**
     * 标签名
     */
    @ApiModelProperty(value = "标签名")
    private String tagName;

    /**
     * 使用数量
     */
    @ApiModelProperty(value = "使用数量")
    private Integer count;
}
