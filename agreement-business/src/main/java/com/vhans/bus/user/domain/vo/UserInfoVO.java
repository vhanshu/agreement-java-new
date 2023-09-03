package com.vhans.bus.user.domain.vo;

import com.vhans.bus.agree.domain.vo.MyIssueAgree;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.util.List;

/**
 * 用户登录信息
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
     * 活动参与度
     */
    @ApiModelProperty(value = "活动参与度")
    private Integer degree;

    /**
     * 解疑等级
     */
    @ApiModelProperty(value = "解疑等级")
    private Integer grade;

    /**
     * 约起参与ids信息
     */
    @ApiModelProperty(value = "约起参与ids信息")
    private List<MyIssueAgree> agreeIssueSet;

    /**
     * 点赞文章集合
     */
    @ApiModelProperty(value = "点赞记录集合")
    private List<Integer> recordLikeSet;

    /**
     * 点赞题目集合
     */
    @ApiModelProperty(value = "点赞题目集合")
    private List<Integer> quitLikeSet;

    /**
     * 点赞评论集合
     */
    @ApiModelProperty(value = "点赞评论集合")
    private List<Integer> commentLikeSet;

    /**
     * 登录类型
     */
    @ApiModelProperty(value = "登录类型")
    private Integer loginType;
}
