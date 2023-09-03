package com.vhans.bus.log.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.log.domain.TaskLog;
import com.vhans.bus.log.mapper.TaskLogMapper;
import com.vhans.bus.log.service.ITaskLogService;
import com.vhans.core.utils.data.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 定时任务日志业务接口实现类
 *
 * @author vhans
 */
@Service
public class TaskLogServiceImpl extends ServiceImpl<TaskLogMapper, TaskLog> implements ITaskLogService {

    @Autowired
    private TaskLogMapper taskLogMapper;

    @Override
    public List<TaskLog> listTaskLog(TaskLog.Query query) {
        return taskLogMapper.selectList(new LambdaQueryWrapper<TaskLog>()
                .eq(StringUtils.isNotNull(query.getStatus()), TaskLog::getStatus, query.getStatus())
                .like(StringUtils.isNotNull(query.getTaskName()), TaskLog::getTaskName, query.getTaskName())
                .like(StringUtils.isNotNull(query.getTaskGroup()), TaskLog::getTaskGroup, query.getTaskGroup())
                .orderByDesc(TaskLog::getCreateTime));
    }

    @Override
    public void clearTaskLog() {
        taskLogMapper.delete(null);
    }
}




