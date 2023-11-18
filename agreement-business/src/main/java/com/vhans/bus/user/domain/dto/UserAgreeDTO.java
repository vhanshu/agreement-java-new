package com.vhans.bus.user.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author vhans
 * @data 2023-11-18
 */
@Data
@ApiModel(description = "用户约起数据")
public class UserAgreeDTO {
    /**
     * 搜索关键字
     */
    @ApiModelProperty(value = "搜索关键字")
    private String keyword;

    /**
     * 类别(0全部 1约会 2活动 3赛事 4帮忙)(0全部 1记录 2题目)(自由变化)
     */
    @ApiModelProperty(value = "类别")
    private Integer type;

    /**
     * 是否请求缓存数据的标记
     */
    @ApiModelProperty(value = "是否请求缓存数据的标记")
    private Boolean flag;
}
