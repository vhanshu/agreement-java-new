package com.vhans.bus.data.domain;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.vhans.bus.data.domain.vo.TagOptionVO;
import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import com.vhans.core.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * 商品对象 d_product
 *
 * @author vhans
 * @date 2023-12-22
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("d_product")
@ApiModel(description = "商品对象")
public class Product {

    /**
     * 商品id
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "商品id")
    private Integer id;

    /**
     * 拥有者id
     */
    @ApiModelProperty(value = "拥有者id")
    @Excel(name = "拥有者id", cellType = Excel.ColumnType.NUMERIC)
    private Integer userId;

    /**
     * 商品缩略图
     */
    @ApiModelProperty(value = "商品缩略图")
    @Excel(name = "缩略图")
    private String cover;

    /**
     * 商品标题
     */
    @NotBlank(message = "商品标题不能为空")
    @ApiModelProperty(value = "商品标题")
    @Excel(name = "商品标题")
    private String title;

    /**
     * 商品价格
     */
    @NotNull(message = "商品价格不能为空")
    @ApiModelProperty(value = "商品价格")
    private BigDecimal price;

    /**
     * 商品类型(1电子 2服饰 3装扮 4日用 5工具 6虚拟 7其它)
     */
    @NotNull(message = "商品类型不能为空")
    @ApiModelProperty(value = "商品类型(1电子 2服饰 3装扮 4日用 5工具 6虚拟 7其它)")
    @Excel(name = "商品类型", readConverterExp = "1=电子,2=服饰,3=装扮,4=日用,5=工具,6=虚拟,7=其它")
    private Integer type;

    /**
     * 商品介绍
     */
    @NotBlank(message = "商品介绍不能为空")
    @ApiModelProperty(value = "商品介绍")
    @Excel(name = "商品介绍")
    private String content;

    /**
     * 商品图片集
     */
    @ApiModelProperty(value = "商品图片集")
    @Excel(name = "商品图片集")
    private String images;

    /**
     * 商品视频
     */
    @ApiModelProperty(value = "商品视频")
    @Excel(name = "商品视频")
    private String video;

    /**
     * 收藏数
     */
    @ApiModelProperty(value = "收藏数")
    @Excel(name = "收藏数", cellType = Excel.ColumnType.NUMERIC)
    private Integer collectNumber;

    /**
     * 状态(1上架 2预定 3完成)
     */
    @ApiModelProperty(value = "状态(1上架 2预定 3完成)")
    @Excel(name = "状态", readConverterExp = "1=上架,2=预定,3=完成")
    private Integer status;

    /**
     * 是否租赁
     */
    @ApiModelProperty(value = "是否租赁")
    @Excel(name = "是否租赁", readConverterExp = "0=否,1=是")
    private Integer isLease;

    /**
     * 是否通过
     */
    @ApiModelProperty(value = "是否通过")
    @Excel(name = "是否通过", readConverterExp = "0=否,1=是")
    private Integer isCheck;

    /**
     * 是否置顶
     */
    @ApiModelProperty(value = "是否置顶")
    @Excel(name = "是否置顶", readConverterExp = "0=否,1=是")
    private Integer isTop;

    /**
     * 是否推荐
     */
    @ApiModelProperty(value = "是否推荐")
    @Excel(name = "是否推荐", readConverterExp = "0=否,1=是")
    private Integer isRecommend;

    /**
     * 是否删除
     */
    @ApiModelProperty(value = "是否删除")
    private Integer isDelete;

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
    private List<TagOptionVO> tagList;

    /**
     * 标签名称集
     */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @ApiModelProperty(value = "标签名称集")
    private List<String> tagNameList;

    /**
     * 上一件商品
     */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @ApiModelProperty(value = "上一件商品")
    private PaginationVO lastProduct;

    /**
     * 下一件商品
     */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @ApiModelProperty(value = "下一件商品")
    private PaginationVO nextProduct;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {

        /**
         * 商品标题
         */
        @ApiModelProperty(value = "商品标题")
        private String title;

        /**
         * 拥有者id
         */
        @ApiModelProperty(value = "拥有者id")
        private Integer userId;

        /**
         * 商品类型(1电子 2服饰 3装扮 4日用 5工具 6虚拟 7其它)
         */
        @ApiModelProperty(value = "商品类型(1电子 2服饰 3装扮 4日用 5工具 6虚拟 7其它)")
        private Integer type;

        /**
         * 状态(1上架 2预定 3完成)
         */
        @ApiModelProperty(value = "状态(1上架 2预定 3完成)")
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
    }
}
