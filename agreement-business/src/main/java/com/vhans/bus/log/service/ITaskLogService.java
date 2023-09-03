package com.vhans.bus.log.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.log.domain.TaskLog;

import java.util.List;

/**
 * 定时任务日志业务接口
 *
 * @author vhans
 */
public interface ITaskLogService extends IService<TaskLog> {

    /**
     * 查看后台定时任务日志
     *
     * @param query 条件
     * @return 后台定时任务日志
     */
    List<TaskLog> listTaskLog(TaskLog.Query query);

    /**
     * 清空定时任务日志
     */
    void clearTaskLog();
}
