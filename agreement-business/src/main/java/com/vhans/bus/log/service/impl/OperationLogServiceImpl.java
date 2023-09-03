package com.vhans.bus.log.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.log.domain.OperationLog;
import com.vhans.bus.log.mapper.OperationLogMapper;
import com.vhans.bus.log.service.IOperationLogService;
import com.vhans.core.utils.data.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 操作日志业务接口实现类
 *
 * @author vhans
 */
@Service
public class OperationLogServiceImpl extends ServiceImpl<OperationLogMapper, OperationLog> implements IOperationLogService {

    @Autowired
    private OperationLogMapper operationLogMapper;

    @Override
    public List<OperationLog> listOperationLog(OperationLog.Query query) {
        // 查询操作日志列表
        return operationLogMapper.selectList(new LambdaQueryWrapper<OperationLog>()
                .eq(StringUtils.isNotNull(query.getModule()), OperationLog::getModule, query.getModule())
                .eq(StringUtils.isNotNull(query.getDescription()), OperationLog::getDescription, query.getDescription()));
    }

    @Override
    public void saveOperationLog(OperationLog operationLog) {
        // 保存操作日志
        operationLogMapper.insert(operationLog);
    }

}
