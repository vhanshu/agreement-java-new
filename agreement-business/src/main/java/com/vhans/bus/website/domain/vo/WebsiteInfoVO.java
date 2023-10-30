package com.vhans.bus.website.domain.vo;

import com.vhans.bus.log.domain.vo.UserViewVO;
import com.vhans.bus.data.domain.vo.RankVO;
import com.vhans.bus.data.domain.vo.StatisticsVO;
import com.vhans.bus.data.domain.vo.TagOptionVO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.util.List;

/**
 * 网站信息VO
 *
 * @author vhans
 **/
@Data
@Builder
@ApiModel(description = "网站信息VO")
public class WebsiteInfoVO {

    /**
     * 访问量
     */
    @ApiModelProperty(value = "访问量")
    private Integer viewCount;

    /**
     * 用户量
     */
    @ApiModelProperty(value = "用户量")
    private Long userCount;

    /**
     * 记录量
     */
    @ApiModelProperty(value = "记录量")
    private Long recordCount;

    /**
     * 题目量
     */
    @ApiModelProperty(value = "题目量")
    private Long quizCount;

    /**
     * 正在进行的约起量(类型->数量)
     */
    @ApiModelProperty(value = "正在进行的约起量(类型->数量)")
    private List<AgreeCount> agreeCount;

    /**
     * 标签列表
     */
    @ApiModelProperty(value = "标签列表")
    private List<TagOptionVO> tagList;

    /**
     * 记录贡献统计
     */
    @ApiModelProperty(value = "记录贡献统计")
    private List<StatisticsVO> recordStatisticsList;

    /**
     * 题目贡献统计
     */
    @ApiModelProperty(value = "题目贡献统计")
    private List<StatisticsVO> quizStatisticsList;

    /**
     * 记录浏览量排行
     */
    @ApiModelProperty(value = "记录浏览量排行")
    private List<RankVO> recordRankList;

    /**
     * 题目浏览量排行
     */
    @ApiModelProperty(value = "题目浏览量排行")
    private List<RankVO> quizRankList;

    /**
     * 一周访问量
     */
    @ApiModelProperty(value = "一周访问量")
    private List<UserViewVO> userViewList;

    @Data
    public static class AgreeCount {
        private String type;
        private Long count;

        public AgreeCount(String type, Long count) {
            this.type = type;
            this.count = count;
        }
    }
}