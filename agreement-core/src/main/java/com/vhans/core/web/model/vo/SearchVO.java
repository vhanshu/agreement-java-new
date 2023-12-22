package com.vhans.core.web.model.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 搜索VO
 * @author vhans
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "搜索VO")
public class SearchVO {
    /**
     * id
     */
    @ApiModelProperty(value = "id")
    private Integer id;

    /**
     * 标题
     */
    @ApiModelProperty(value = "标题")
    private String title;

    /**
     * 类型
     */
    @ApiModelProperty(value = "类型")
    private Integer type;

    /**
     * 内容
     */
    @ApiModelProperty(value = "内容")
    private String content;
}
