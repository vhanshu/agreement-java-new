package com.vhans.bus.chat.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 【群组与用户关联】对象 c_group_user
 *
 * @author vhans
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("c_group_user")
public class GroupUser {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 群组id
     */
    private Integer groupId;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 群用户称呼(默认用户昵称)
     */
    private String username;

    /**
     * 最近访问时间
     */
    private LocalDateTime viewTime;

}
