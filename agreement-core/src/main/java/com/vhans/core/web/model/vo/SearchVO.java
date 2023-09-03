package com.vhans.core.web.model.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 记录搜索VO
 * @author vhans
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "记录搜索VO")
public class SearchVO {
    /**
     * 记录id
     */
    @ApiModelProperty(value = "记录id")
    private Integer id;

    /**
     * 记录标题
     */
    @ApiModelProperty(value = "记录标题")
    private String title;

    /**
     * 记录类型 (0题目 1约会 2活动 3赛事 4帮忙)
     */
    @ApiModelProperty(value = "记录类型 (0题目 1约会 2活动 3赛事 4帮忙)")
    private Integer type;

    /**
     * 记录内容
     */
    @ApiModelProperty(value = "记录内容")
    private String content;
}
