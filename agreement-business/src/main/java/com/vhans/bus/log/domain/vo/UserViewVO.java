package com.vhans.bus.log.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 用户浏览
 *
 * @author vhans
 **/
@Data
@ApiModel(description = "用户浏览")
public class UserViewVO {

    /**
     * 日期
     */
    @ApiModelProperty(value = "日期")
    private String date;

    /**
     * 总访问量
     */
    @ApiModelProperty(value = "总访问量")
    private Integer pv;

    /**
     * 访问IP量
     */
    @ApiModelProperty(value = "访问IP量")
    private Integer uv;
}