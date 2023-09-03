package com.vhans.bus.agree.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 我参与的约起ID集合
 *
 * @author vhans
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "我参与的约起ID集合")
public class MyIssueAgree {

    /**
     * 约起类型
     */
    @ApiModelProperty(value = "约起类型")
    private Integer type;

    /**
     * 约起Id列表
     */
    @ApiModelProperty(value = "约起Id列表")
    private List<Integer> ids;
}
