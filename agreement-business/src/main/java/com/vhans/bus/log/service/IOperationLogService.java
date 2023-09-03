package com.vhans.bus.log.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.log.domain.OperationLog;

import java.util.List;

/**
 * 操作日志业务接口
 *
 * @author vhnas
 */
public interface IOperationLogService extends IService<OperationLog> {

    /**
     * 查看操作日志列表
     *
     * @param query 条件
     * @return 日志列表
     */
    List<OperationLog> listOperationLog(OperationLog.Query query);

    /**
     * 保存操作日志
     *
     * @param operationLog 操作日志信息
     */
    void saveOperationLog(OperationLog operationLog);
}
