package com.vhans.bus.user.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 【用户与约起关联】对象 u_user_agree
 *
 * @author vhans
 * @date 2023-04-16
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("u_user_agree")
public class UserAgree {
    /**
     * 主键
     */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 用户id
     */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private Integer userId;

    /**
     * 约起id
     */
    private Integer agreeId;

    /**
     * 约起类型(1约会 2活动 3赛事 4帮忙 5观众 6约会指定)
     */
    private Integer type;

    /**
     * 约会指定状态(0等待确认 1成功 2拒绝)
     */
    private Integer status;
}
