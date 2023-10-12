package com.vhans.core.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 评论类型枚举
 *
 * @author vhans
 */
@Getter
@AllArgsConstructor
public enum CommentTypeEnum {

    /**
     * 记录评论
     */
    RECORD(1, "记录", "record/"),
    /**
     * 题目评论
     */
    QUIZ(2, "题目", "quiz/"),
    /**
     * 评论
     */
    COMMENT(3, "评论", "");

    /**
     * 类型号
     */
    private final Integer type;

    /**
     * 描述
     */
    private final String desc;

    /**
     * 路径
     */
    private final String path;

    /**
     * 获取评论路径
     *
     * @param type 类型
     * @return {@link String}
     */
    public static String getCommentPath(Integer type) {
        for (CommentTypeEnum value : CommentTypeEnum.values()) {
            if (value.getType().equals(type)) {
                return value.getPath();
            }
        }
        return null;
    }

}