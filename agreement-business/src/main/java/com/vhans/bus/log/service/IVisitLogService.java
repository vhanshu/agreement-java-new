package com.vhans.bus.log.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.log.domain.VisitLog;

import java.util.List;

/**
 * 访问业务接口
 *
 * @author vhans
 */
public interface IVisitLogService extends IService<VisitLog> {

    /**
     * 查看访问日志列表
     *
     * @param query 条件
     * @return 日志列表
     */
    List<VisitLog> listVisitLog(VisitLog.Query query);

    /**
     * 保存访问日志
     *
     * @param visitLog 访问日志信息
     */
    void saveVisitLog(VisitLog visitLog);
}
