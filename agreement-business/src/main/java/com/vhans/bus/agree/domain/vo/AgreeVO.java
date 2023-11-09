package com.vhans.bus.agree.domain.vo;

import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import com.vhans.bus.user.domain.vo.UserIntroVO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 约起VO
 *
 * @author vhans
 */
@Data
@ApiModel(description = "约起VO")
public class AgreeVO {
    /* 公共字段 */
    /**
     * 约起id
     */
    @ApiModelProperty(value = "约起id")
    private Integer id;

    /**
     * 发起者id
     */
    @ApiModelProperty(value = "发起者id")
    private Integer userId;

    /**
     * 缩略图
     */
    @ApiModelProperty(value = "缩略图")
    private String cover;

    /**
     * 约起主题
     */
    @ApiModelProperty(value = "约起主题")
    private String title;

    /**
     * 约起内容
     */
    @ApiModelProperty(value = "约起内容")
    private String content;

    /**
     * 开始时间
     */
    @ApiModelProperty(value = "开始时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime timeStart;

    /**
     * 结束时间
     */
    @ApiModelProperty(value = "结束时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime timeEnd;

    /**
     * 状态(1发出 2草稿 3完成 4过期 5取消)
     */
    @ApiModelProperty(value = "状态(1发出 2草稿 3完成 4过期 5取消)")
    private Integer status;

    /* 伸缩字段 */
    /**
     * 人数
     */
    @ApiModelProperty(value = "人数")
    private Integer peopleNumber;

    /**
     * 发出类型 (1广播 2指定)
     */
    @ApiModelProperty(value = "发出类型 (1广播 2指定)")
    private Integer type;

    /**
     * 是否赌注 (0否 1是)
     */
    @ApiModelProperty(value = "是否赌注 (0否 1是)")
    private Integer isWager;

    /**
     * 赌注内容
     */
    @ApiModelProperty(value = "赌注内容")
    private String wagerContent;

    /**
     * 添加时间
     */
    @ApiModelProperty(value = "添加时间")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @ApiModelProperty(value = "更新时间")
    private LocalDateTime updateTime;

    /*扩展字段*/
    /**
     * 浏览量
     */
    @ApiModelProperty(value = "浏览量")
    private Integer viewCount;

    /**
     * 头像
     */
    @ApiModelProperty(value = "头像")
    private String avatar;

    /**
     * 发起者昵称
     */
    @ApiModelProperty(value = "发起者昵称")
    private String nickname;

    /**
     * 报酬
     */
    @ApiModelProperty(value = "报酬")
    private String reward;

    /**
     * 相关人ID
     */
    @ApiModelProperty(value = "相关人ID")
    private Integer destinedUserId;

    /**
     * 相关人员列表
     */
    @ApiModelProperty(value = "相关人员列表")
    private List<UserIntroVO> userList;

    /**
     * 上一篇约起
     */
    @ApiModelProperty(value = "上一篇约起")
    private PaginationVO lastAgreement;

    /**
     * 下一篇约起
     */
    @ApiModelProperty(value = "下一篇约起")
    private PaginationVO nextAgreement;
}
