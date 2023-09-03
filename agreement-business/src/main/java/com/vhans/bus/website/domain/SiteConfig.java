package com.vhans.bus.website.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 网站配置 w_site_config
 *
 * @author vhans
 * @date 2023-04-14
 */
@Data
@TableName("w_site_config")
@ApiModel(description = "网站配置")
public class SiteConfig {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "主键")
    private Integer id;

    /**
     * 用户头像
     */
    @ApiModelProperty(value = "用户头像")
    private String userAvatar;

    /**
     * 游客头像
     */
    @ApiModelProperty(value = "游客头像")
    private String touristAvatar;

    /**
     * 网站名称
     */
    @ApiModelProperty(value = "网站名称")
    private String siteName;

    /**
     * 网站地址
     */
    @ApiModelProperty(value = "网站地址")
    private String siteAddress;

    /**
     * 网站简介
     */
    @ApiModelProperty(value = "网站简介")
    private String siteIntro;

    /**
     * 网站公告
     */
    @ApiModelProperty(value = "网站公告")
    private String siteNotice;

    /**
     * 建站日期
     */
    @ApiModelProperty(value = "建站日期")
    private String createSiteTime;

    /**
     * 备案号
     */
    @ApiModelProperty(value = "备案号")
    private String recordNumber;

    /**
     * 开发者头像
     */
    @ApiModelProperty(value = "开发者头像")
    private String authorAvatar;

    /**
     * 开发者
     */
    @ApiModelProperty(value = "开发者")
    private String siteAuthor;

    /**
     * 默认缩略图
     */
    @ApiModelProperty(value = "默认缩略图")
    private String cover;

    /**
     * 关于我
     */
    @ApiModelProperty(value = "关于我")
    private String aboutMe;

    /**
     * Github
     */
    @ApiModelProperty(value = "Github")
    private String github;

    /**
     * Gitee
     */
    @ApiModelProperty(value = "Gitee")
    private String gitee;

    /**
     * 哔哩哔哩
     */
    @ApiModelProperty(value = "哔哩哔哩")
    private String bilibili;

    /**
     * QQ
     */
    @ApiModelProperty(value = "QQ")
    private String qq;

    /**
     * 是否评论审核 (0否 1是)
     */
    @ApiModelProperty(value = "是否评论审核")
    private Integer commentCheck;

    /**
     * 是否题目审核 (0否 1是)
     */
    @ApiModelProperty(value = "是否题目审核")
    private Integer quizCheck;

    /**
     * 是否开启打赏 (0否 1是)
     */
    @ApiModelProperty(value = "是否开启打赏")
    private Integer isReward;

    /**
     * 微信二维码
     */
    @ApiModelProperty(value = "微信二维码")
    private String weiXinCode;

    /**
     * 支付宝二维码
     */
    @ApiModelProperty(value = "支付宝二维码")
    private String aliCode;

    /**
     * 是否邮箱通知 (0否 1是)
     */
    @ApiModelProperty(value = "是否邮箱通知")
    private Integer emailNotice;

    /**
     * 社交列表
     */
    @ApiModelProperty(value = "社交列表")
    private String socialList;

    /**
     * 登录方式
     */
    @ApiModelProperty(value = "登录方式")
    private String loginList;

    /**
     * 是否开启音乐播放器 (0否 1是)
     */
    @ApiModelProperty(value = "是否开启音乐播放器")
    private Integer isMusic;

    /**
     * 网易云歌单id
     */
    @ApiModelProperty(value = "网易云歌单id")
    private String musicId;

    /**
     * 创建时间
     */
    @JsonIgnore
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @JsonIgnore
    @TableField(fill = FieldFill.UPDATE)
    @ApiModelProperty(value = "更新时间")
    private LocalDateTime updateTime;

}