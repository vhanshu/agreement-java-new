package com.vhans.bus.user.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 【用户与点赞关联】对象 u_user_like
 *
 * @author vhans
 * @date 2023-04-15
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("u_user_like")
public class UserLike {
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
     * 点赞类型(1记录 2题目 3评论)
     */
    private Integer type;

    /**
     * 类型id
     */
    private Integer typeId;
}
