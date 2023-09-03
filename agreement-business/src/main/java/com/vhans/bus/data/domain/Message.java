package com.vhans.bus.data.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 【请填写功能名称】对象 d_message
 *
 * @author vhans
 * @date 2023-04-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("d_message")
public class Message {
    /**
     * 消息id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 类型 (1系统 2用户)
     */
    private Integer type;

    /**
     * 发出者id(如果是用户)
     */
    private Long userOutId;

    /**
     * 接收者id
     */
    private Long userInId;

    /**
     * 消息内容
     */
    private String content;

    /**
     * 添加时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;
}
