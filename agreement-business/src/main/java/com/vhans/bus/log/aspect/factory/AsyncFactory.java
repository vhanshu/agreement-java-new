package com.vhans.bus.log.aspect.factory;


import com.vhans.bus.log.domain.ExceptionLog;
import com.vhans.bus.log.domain.OperationLog;
import com.vhans.bus.log.domain.VisitLog;
import com.vhans.bus.log.service.IExceptionLogService;
import com.vhans.bus.log.service.IOperationLogService;
import com.vhans.bus.log.service.IVisitLogService;
import com.vhans.core.utils.SpringUtils;

import java.util.TimerTask;

/**
 * 异步工厂（产生任务用）
 *
 * @author vhans
 */
public class AsyncFactory {

    /**
     * 记录操作日志
     *
     * @param operationLog 操作日志信息
     * @return 任务task
     */
    public static TimerTask recordOperation(OperationLog operationLog) {
        return new TimerTask() {
            @Override
            public void run() {
                SpringUtils.getBean(IOperationLogService.class).saveOperationLog(operationLog);
            }
        };
    }

    /**
     * 记录异常日志
     *
     * @param exceptionLog 异常日志信息
     * @return 任务task
     */
    public static TimerTask recordException(ExceptionLog exceptionLog) {
        return new TimerTask() {
            @Override
            public void run() {
                SpringUtils.getBean(IExceptionLogService.class).saveExceptionLog(exceptionLog);
            }
        };
    }

    /**
     * 记录访问日志
     *
     * @param visitLog 访问日志信息
     * @return 任务task
     */
    public static TimerTask recordVisit(VisitLog visitLog) {
        return new TimerTask() {
            @Override
            public void run() {
                SpringUtils.getBean(IVisitLogService.class).saveVisitLog(visitLog);
            }
        };
    }
}