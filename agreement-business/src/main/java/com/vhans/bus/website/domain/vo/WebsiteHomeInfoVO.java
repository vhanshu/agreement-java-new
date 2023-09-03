package com.vhans.bus.website.domain.vo;

import com.vhans.bus.website.domain.SiteConfig;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 网站信息
 *
 * @author vhans
 **/
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "网站信息")
public class WebsiteHomeInfoVO {

    /**
     * 记录数量
     */
    @ApiModelProperty(value = "记录数量")
    private Long recordCount;

    /**
     * 题目数量
     */
    @ApiModelProperty(value = "题目数量")
    private Long quizCount;

    /**
     * 标签数量
     */
    @ApiModelProperty(value = "标签数量")
    private Long tagCount;

    /**
     * 网站访问量
     */
    @ApiModelProperty(value = "网站访问量")
    private String viewCount;

    /**
     * 网站配置
     */
    @ApiModelProperty(value = "网站配置")
    private SiteConfig siteConfig;

}