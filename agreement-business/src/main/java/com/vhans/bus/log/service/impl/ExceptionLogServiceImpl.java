package com.vhans.bus.log.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.log.domain.ExceptionLog;
import com.vhans.bus.log.mapper.ExceptionLogMapper;
import com.vhans.bus.log.service.IExceptionLogService;
import com.vhans.core.utils.data.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 异常日志业务接口实现类
 *
 * @author vhans
 */
@Service
public class ExceptionLogServiceImpl extends ServiceImpl<ExceptionLogMapper, ExceptionLog> implements IExceptionLogService {

    @Autowired
    private ExceptionLogMapper exceptionLogMapper;

    @Override
    public List<ExceptionLog> listExceptionLog(ExceptionLog.Query query) {
        // 查询异常日志列表
        return exceptionLogMapper.selectList(new LambdaQueryWrapper<ExceptionLog>()
                .like(StringUtils.isNotNull(query.getModule()), ExceptionLog::getModule, query.getModule())
                .like(StringUtils.isNotNull(query.getDescription()), ExceptionLog::getDescription, query.getDescription())
                .orderByDesc(ExceptionLog::getCreateTime));
    }

    @Override
    public void saveExceptionLog(ExceptionLog exceptionLog) {
        // 保存异常日志
        exceptionLogMapper.insert(exceptionLog);
    }
}




