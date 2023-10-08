package com.vhans.core.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 文件路径枚举
 *
 * @author vhans
 */
@Getter
@AllArgsConstructor
public enum FilePathEnum {
    /**
     * 头像路径
     */
    AVATAR(1, "/avatar/", "/avatar"),

    /**
     * 约起文件路径
     */
    AGREE(2, "/agree/", "/agree"),

    /**
     * 记录文件路径
     */
    RECORD(3, "/record/", "/record"),

    /**
     * 题目文件路径
     */
    QUIZ(4, "/quiz/", "/quiz"),

    /**
     * 配置文件路径
     */
    CONFIG(5, "/config/", "/config"),
    /**
     * 临时文件路径
     */
    TEMP(6, "/temp/", "/temp"),
    /**
     * 通讯文件路径
     */
    MSG(7, "/msg/", "/msg");

    /**
     * 上传类型
     */
    private final Integer type;


    /**
     * 路径
     */
    private final String path;

    /**
     * 文件路径
     */
    private final String filePath;

    /**
     * 获取文件上传路径
     *
     * @param type 类型
     * @return 上传路径
     */
    public static String getUploadPath(Integer type) {
        for (FilePathEnum value : FilePathEnum.values()) {
            if (value.getType().equals(type)) {
                return value.getPath();
            }
        }
        return "/";
    }
}
