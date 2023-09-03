package com.vhans.core.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 记录状态枚举
 *
 * @author vhans
 */
@Getter
@AllArgsConstructor
public enum RecordStatusEnum {

    /**
     * 公开
     */
    PUBLIC(1, "公开"),

    /**
     * 私密
     */
    SECRET(2, "私密"),

    /**
     * 草稿
     */
    DRAFT(3, "草稿");

    /**
     * 状态
     */
    private final Integer status;

    /**
     * 描述
     */
    private final String description;
}
