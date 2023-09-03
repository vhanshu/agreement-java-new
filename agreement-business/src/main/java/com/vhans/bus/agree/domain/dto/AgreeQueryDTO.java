package com.vhans.bus.agree.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 约起查询条件
 *
 * @author vhans
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "约起查询条件")
public class AgreeQueryDTO {
    /* 公共条件 */
    /**
     * 发起者id
     */
    @ApiModelProperty(value = "发起者id")
    private Integer userId;

    /**
     * 约起主题
     */
    @ApiModelProperty(value = "约起主题")
    private String title;

    /**
     * 状态(1发出 2草稿 3完成 4过期 5取消)
     */
    @ApiModelProperty(value = "状态(1发出 2草稿 3完成 4过期 5取消)")
    private Integer status;

    /* 对于约会扩展的 */
    /**
     * 发出类型(1广播 2指定)
     */
    @ApiModelProperty(value = "发出类型(1广播 2指定)")
    private Integer issuingType;

    /* 扩展条件 */
    /**
     * 约起类型(1约会 2活动 3赛事 4帮忙 5观众 6指定)
     */
    @ApiModelProperty(value = "约起类型(1约会 2活动 3赛事 4帮忙 5观众 6指定)")
    private Integer type;
}
