package com.vhans.bus.user.domain.vo;

import com.vhans.bus.user.domain.UserAgree;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 用户登录信息
 *
 * @author vhans
 */
@Data
@Builder
@ApiModel(description = "用户登录信息")
public class UserInfoVO {
    /**
     * 用户id
     */
    @ApiModelProperty(value = "用户id")
    private Integer id;

    /**
     * 用户头像
     */
    @ApiModelProperty(value = "用户头像")
    private String avatar;

    /**
     * 用户昵称
     */
    @ApiModelProperty(value = "用户昵称")
    private String nickname;

    /**
     * 用户名
     */
    @ApiModelProperty(value = "用户名")
    private String username;

    /**
     * 用户邮箱
     */
    @ApiModelProperty(value = "用户邮箱")
    private String email;

    /**
     * 个人简介
     */
    @ApiModelProperty(value = "个人简介")
    private String intro;

    /**
     * 用户性别(0保密 1男 2女)
     */
    @ApiModelProperty(value = "用户性别(0保密 1男 2女)")
    private Integer sex;

    /**
     * 登录方式(1邮箱 2QQ 3Gitee 4Github)
     */
    @ApiModelProperty(value = "登录方式(1邮箱 2QQ 3Gitee 4Github)")
    private Integer loginType;

    /**
     * 登录地址
     */
    @ApiModelProperty(value = "登录地址")
    private String ipSource;

    /**
     * 登录时间
     */
    @ApiModelProperty(value = "登录时间")
    private LocalDateTime loginTime;

    /**
     * 约起参与ids信息
     */
    @ApiModelProperty(value = "约起参与ids信息")
    private List<UserAgree> agreeIssueSet;

    /**
     * 点赞记录集合
     */
    @ApiModelProperty(value = "点赞记录集合")
    private List<Integer> recordLikeSet;

    /**
     * 点赞题目集合
     */
    @ApiModelProperty(value = "点赞题目集合")
    private List<Integer> quizLikeSet;

    /**
     * 点赞作答集合
     */
    @ApiModelProperty(value = "点赞作答集合")
    private List<Integer> answerLikeSet;

    /**
     * 点赞评论集合
     */
    @ApiModelProperty(value = "点赞评论集合")
    private List<Integer> commentLikeSet;

    /**
     * 收藏记录集合
     */
    @ApiModelProperty(value = "收藏记录集合")
    private List<Integer> recordCollectSet;

    /**
     * 收藏题目集合
     */
    @ApiModelProperty(value = "收藏题目集合")
    private List<Integer> quizCollectSet;
}
