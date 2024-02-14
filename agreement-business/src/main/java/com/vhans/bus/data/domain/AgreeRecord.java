package com.vhans.bus.data.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.vhans.bus.data.domain.vo.TagStatisticsVO;
import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import com.vhans.core.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 【记录】对象 d_agree_record
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("d_agree_record")
@ApiModel(description = "记录对象")
public class AgreeRecord {
    /**
     * 记录id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "记录id")
    private Integer id;

    /**
     * 记录者id
     */
    @ApiModelProperty(value = "记录者id")
    @Excel(name = "记录者id", cellType = Excel.ColumnType.NUMERIC)
    private Integer userId;

    /**
     * 缩略图
     */
    @ApiModelProperty(value = "缩略图")
    @Excel(name = "缩略图")
    private String cover;

    /**
     * 记录标题
     */
    @NotBlank(message = "记录标题不能为空")
    @ApiModelProperty(value = "记录标题")
    @Excel(name = "记录标题")
    private String title;

    /**
     * 记录类型(1约会 2活动 3赛事 4帮忙)
     */
    @NotNull(message = "记录类型不能为空")
    @ApiModelProperty(value = "记录类型(1约会 2活动 3赛事 4帮忙)")
    @Excel(name = "记录类型", readConverterExp = "1=约会,2=活动,3=赛事,4=帮忙")
    private Integer type;

    /**
     * 记录内容
     */
    @NotBlank(message = "记录内容不能为空")
    @ApiModelProperty(value = "记录内容")
    @Excel(name = "记录内容")
    private String content;

    /**
     * 记录图片集
     */
    @ApiModelProperty(value = "记录图片集")
    @Excel(name = "记录图片集")
    private String images;

    /**
     * 记录视频
     */
    @ApiModelProperty(value = "记录视频")
    @Excel(name = "记录视频")
    private String video;

    /**
     * 点赞数
     */
    @ApiModelProperty(value = "点赞数")
    @Excel(name = "点赞数", cellType = Excel.ColumnType.NUMERIC)
    private Integer likeNumber;

    /**
     * 收藏数
     */
    @ApiModelProperty(value = "收藏数")
    @Excel(name = "收藏数", cellType = Excel.ColumnType.NUMERIC)
    private Integer collectNumber;

    /**
     * 状态(1公开 2私密 3草稿)
     */
    @ApiModelProperty(value = "状态(1公开 2私密 3草稿)")
    @Excel(name = "状态", readConverterExp = "1=公开,2=私密,3=草稿")
    private Integer status;

    /**
     * 是否通过(0否 1是)
     */
    @ApiModelProperty(value = "是否通过(0否 1是)")
    @Excel(name = "是否通过", readConverterExp = "0=否,1=是")
    private Integer isCheck;

    /**
     * 是否推荐(0否 1是)
     */
    @ApiModelProperty(value = "是否推荐(0否 1是)")
    @Excel(name = "是否推荐", readConverterExp = "0=否,1=是")
    private Integer isRecommend;

    /**
     * 是否删除
     */
    @ApiModelProperty(value = "是否删除(0否 1是)")
    private Integer isDelete;

    /**
     * 是否置顶(0否 1是)
     */
    @ApiModelProperty(value = "是否置顶(0否 1是)")
    @Excel(name = "是否置顶", readConverterExp = "0=否,1=是")
    private Integer isTop;

    /**
     * 添加时间
     */
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "添加时间")
    @Excel(name = "添加时间")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.UPDATE)
    @ApiModelProperty(value = "更新时间")
    private LocalDateTime updateTime;

    /* 除数据表的额外字段 */
    /**
     * 浏览量
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "浏览量")
    private Integer viewCount;

    /**
     * 用户头像
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "用户头像")
    private String avatar;

    /**
     * 用户昵称
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "用户昵称")
    private String nickname;

    /**
     * 标签集
     */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @ApiModelProperty(value = "标签集")
    private List<TagStatisticsVO> tagList;

    /**
     * 标签名称集
     */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @ApiModelProperty(value = "标签名称集")
    private List<String> tagNameList;

    /**
     * 上一篇记录
     */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @ApiModelProperty(value = "上一篇记录")
    private PaginationVO lastRecord;

    /**
     * 下一篇记录
     */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @ApiModelProperty(value = "下一篇记录")
    private PaginationVO nextRecord;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {

        /**
         * 记录标题
         */
        @ApiModelProperty(value = "记录标题")
        private String title;

        /**
         * 记录者id
         */
        @ApiModelProperty(value = "记录者id")
        private Integer userId;

        /**
         * 记录类型 (1约会 2活动 3赛事 4帮忙)
         */
        @ApiModelProperty(value = "记录类型 (1约会 2活动 3赛事 4帮忙)")
        private Integer type;

        /**
         * 状态(1公开 2私密 3草稿)
         */
        @ApiModelProperty(value = "状态(1公开 2私密 3草稿)")
        private Integer status;

        /**
         * 是否删除
         */
        @ApiModelProperty(value = "是否删除")
        private Integer isDelete;

        /**
         * 是否通过
         */
        @ApiModelProperty(value = "是否通过")
        private Integer isCheck;

        /**
         * 收藏者id
         */
        @ApiModelProperty(value = "收藏者id")
        private Integer collectUid;

        /**
         * 点赞者id
         */
        @ApiModelProperty(value = "点赞者id")
        private Integer likeUid;
    }
}
