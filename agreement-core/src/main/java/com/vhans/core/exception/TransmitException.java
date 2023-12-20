package com.vhans.core.exception;

import lombok.Getter;

import static com.vhans.core.enums.StatusCodeEnum.FAIL_CHAT;

/**
 * 通讯异常
 *
 * @author vhans
 **/
@Getter
public final class TransmitException extends RuntimeException {

    /**
     * 返回失败状态码
     */
    private final Integer code = FAIL_CHAT.getCode();

    /**
     * 返回信息
     */
    private final String message;

    public TransmitException(String message) {
        this.message = message;
    }

}