package com.vhans.core.exception;

import lombok.Getter;

import static com.vhans.core.enums.StatusCodeEnum.FAIL;

/**
 * 业务异常
 *
 * @author vhans
 **/
@Getter
public final class ServiceException extends RuntimeException {

    /**
     * 返回失败状态码
     */
    private final Integer code = FAIL.getCode();

    /**
     * 返回信息
     */
    private final String message;

    public ServiceException(String message) {
        this.message = message;
    }

}