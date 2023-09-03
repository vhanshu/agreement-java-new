package com.vhans.bus.user.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 约起id
     */
    private Integer agreeId;

    /**
     * 约起类型(1约会 2活动 3赛事 4帮忙)
     */
    private Integer type;

    /**
     * 限定类型(0普通 1唯一 2观众)
     */
    private Integer limitType;

    /**
     * 状态(0无 1应约 2拒绝)
     */
    private Integer status;
}
