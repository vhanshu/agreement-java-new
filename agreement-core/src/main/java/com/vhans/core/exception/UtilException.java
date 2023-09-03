package com.vhans.core.exception;

import lombok.Getter;

import static com.vhans.core.enums.StatusCodeEnum.FAIL;

/**
 * 工具类异常
 *
 * @author vhans
 */
@Getter
public class UtilException extends RuntimeException {
    /**
     * 返回失败状态码
     */
    private final Integer code = FAIL.getCode();

    /**
     * 返回信息
     */
    private final String message;

    public UtilException(String message) {
        this.message = message;
    }
}
