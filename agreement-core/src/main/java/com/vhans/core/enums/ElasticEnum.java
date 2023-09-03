package com.vhans.core.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * es搜索类型枚举
 *
 * @author vhans
 */
@Getter
@AllArgsConstructor
public enum ElasticEnum {

    /**
     * 记录
     */
    APPOINTMENT(1, "record", "recordTitle", "recordContent"),
    /**
     * 题目
     */
    ACTIVITY(2, "quiz", "quizTitle", "quizContent");

    /**
     * 类型
     */
    private final Integer type;

    /**
     * 索引
     */
    private final String index;

    /**
     * 标题
     */
    private final String title;

    /**
     * 内容
     */
    private final String content;

    /**
     * 获取索引
     *
     * @param type 类型
     * @return {@link String}
     */
    public static String getIndex(Integer type) {
        for (ElasticEnum value : ElasticEnum.values()) {
            if (value.getType().equals(type)) {
                return value.getIndex();
            }
        }
        return null;
    }

    /**
     * 获取标题
     *
     * @param type 类型
     * @return {@link String}
     */
    public static String getTitle(Integer type) {
        for (ElasticEnum value : ElasticEnum.values()) {
            if (value.getType().equals(type)) {
                return value.getTitle();
            }
        }
        return null;
    }

    /**
     * 获取内容
     */
    public static String getContent(Integer type) {
        for (ElasticEnum value : ElasticEnum.values()) {
            if (value.getType().equals(type)) {
                return value.getContent();
            }
        }
        return null;
    }
}
