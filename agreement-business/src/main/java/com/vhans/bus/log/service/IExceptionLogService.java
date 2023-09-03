package com.vhans.bus.log.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.log.domain.ExceptionLog;

import java.util.List;

/**
 * 异常日志业务接口
 *
 * @author vhans
 */
public interface IExceptionLogService extends IService<ExceptionLog> {

    /**
     * 查看异常日志列表
     *
     * @param query 条件
     * @return 日志列表
     */
    List<ExceptionLog> listExceptionLog(ExceptionLog.Query query);

    /**
     * 保存异常日志
     *
     * @param exceptionLog 异常日志信息
     */
    void saveExceptionLog(ExceptionLog exceptionLog);
}
