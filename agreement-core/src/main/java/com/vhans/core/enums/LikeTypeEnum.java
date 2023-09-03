package com.vhans.core.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 点赞类型枚举
 *
 * @author vhans
 */
@Getter
@AllArgsConstructor
public enum LikeTypeEnum {

    /**
     * 记录
     */
    RECORD("记录", "recordLikeStrategyImpl"),

    /**
     * 题目
     */
    QUIZ("题目", "quizLikeStrategyImpl"),

    /**
     * 评论
     */
    COMMENT("评论", "commentLikeStrategyImpl");

    /**
     * 点赞类型
     */
    private final String likeType;

    /**
     * 策略
     */
    private final String strategy;

}
