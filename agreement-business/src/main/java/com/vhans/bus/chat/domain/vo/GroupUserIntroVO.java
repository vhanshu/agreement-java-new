package com.vhans.bus.chat.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

/**
 * 群用户简略信息
 *
 * @author vhans
 */
@Data
@Builder
@ApiModel(description = "群用户简略信息")
public class GroupUserIntroVO {
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
     * 个人简介
     */
    @ApiModelProperty(value = "个人简介")
    private String intro;

    /**
     * 类型(1普通 2好友 3自己)
     */
    @ApiModelProperty(value = "类型(1普通 2好友 3自己)")
    private Integer type;
}
