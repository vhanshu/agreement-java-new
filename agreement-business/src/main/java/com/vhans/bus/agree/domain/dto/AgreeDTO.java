package com.vhans.bus.agree.domain.dto;

import com.vhans.bus.subsidiary.annotation.AgreementType;
import com.vhans.core.utils.data.StringUtils;
import com.vhans.bus.subsidiary.validator.agreement.AgreementProvider;
import com.vhans.bus.subsidiary.validator.agreement.groups.Activity;
import com.vhans.bus.subsidiary.validator.agreement.groups.Appointment;
import com.vhans.bus.subsidiary.validator.agreement.groups.Competition;
import com.vhans.bus.subsidiary.validator.agreement.groups.Help;
import com.vhans.bus.user.domain.vo.UserIntroVO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.group.GroupSequenceProvider;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.List;

import static com.vhans.core.constant.NumberConstant.ONE;
import static com.vhans.core.constant.NumberConstant.TWO;

/**
 * 约起DTO
 *
 * @author vhans
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@GroupSequenceProvider(value = AgreementProvider.class)
@ApiModel(description = "约起DTO")
public class AgreeDTO {
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
    @NotBlank(message = "约起主题不能为空")
    @ApiModelProperty(value = "约起主题")
    private String title;

    /**
     * 约起内容
     */
    @NotBlank(message = "约起内容不能为空")
    @ApiModelProperty(value = "约起内容")
    private String content;

    /**
     * 开始时间
     */
    @NotNull(message = "开始时间不能为空")
    @ApiModelProperty(value = "开始时间")
    private LocalDateTime timeStart;

    /**
     * 结束时间
     */
    @NotNull(message = "结束时间不能为空")
    @ApiModelProperty(value = "结束时间")
    private LocalDateTime timeEnd;

    /**
     * 状态(1发出 2草稿 3完成 4过期 5取消)
     */
    @NotNull(message = "状态不能为空")
    @ApiModelProperty(value = "状态(1发出 2草稿 3完成 4过期 5取消)")
    private Integer status;

    /* 伸缩字段 */
    /**
     * 人数
     */
    @NotNull(message = "活动参与人数不能为空", groups = {Activity.class})
    @NotNull(message = "参赛队伍人数不能为空", groups = {Competition.class})
    @NotNull(message = "帮忙人数不能为空", groups = {Help.class})
    @ApiModelProperty(value = "人数")
    private Integer peopleNumber;

    /**
     * 约起人员
     */
    @ApiModelProperty(value = "约起人员")
    private List<UserIntroVO> userList;

    /**
     * 发出类型 (1广播 2指定)
     */
    @NotNull(message = "发出类型不能为空", groups = {Appointment.class})
    @ApiModelProperty(value = "发出类型 (1广播 2指定)")
    private Integer type;

    /**
     * 是否赌注 (0否 1是)
     */
    @NotNull(message = "赌注情况不能为空", groups = {Competition.class})
    @ApiModelProperty(value = "是否赌注 (0否 1是)")
    private Integer isWager;

    /**
     * 赌注内容
     */
    @ApiModelProperty(value = "赌注内容")
    private String wagerContent;

    /**
     * 报酬
     */
    @NotBlank(message = "报酬不能为空", groups = {Help.class})
    @ApiModelProperty(value = "报酬")
    private String reward;

    /**
     * 约起类型 (1约会 2活动 3赛事 4帮忙 5观众 6指定)
     */
    @AgreementType(values = {1, 2, 3, 4, 5, 6}, message = "约起类型只能是1约会,2活动,3赛事,4帮忙;或者5赛事观众,6约会指定")
    @ApiModelProperty(value = "约起类型(1约会 2活动 3赛事 4帮忙 5观众 6指定)")
    private Integer agreeType;

    @AssertTrue(message = "请指定您的挚爱", groups = {Appointment.class})
    public boolean isUserIntroListValid() {
        if (StringUtils.isNotNull(type) && type == TWO) {
            return StringUtils.isNotEmpty(userList);
        }
        return true;
    }

    @AssertTrue(message = "赌注内容不能为空", groups = {Competition.class})
    public boolean isWagerContentValid() {
        if (StringUtils.isNotNull(isWager) && isWager == ONE) {
            return StringUtils.isNotBlank(wagerContent);
        }
        return true;
    }
}
