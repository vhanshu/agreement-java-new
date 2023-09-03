package com.vhans.core.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 审核状态枚举
 *
 * @author vhans
 */
@Getter
@AllArgsConstructor
public enum CheckStatusEnum {

    /**
     * 未通过
     */
    FILTRATION(0, "未通过"),

    /**
     * 通过
     */
    PASS(1, "通过");

    /**
     * 状态
     */
    private final Integer status;

    /**
     * 描述
     */
    private final String description;
}
