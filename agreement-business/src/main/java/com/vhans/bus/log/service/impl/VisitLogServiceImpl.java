package com.vhans.bus.log.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.log.domain.VisitLog;
import com.vhans.bus.log.mapper.VisitLogMapper;
import com.vhans.bus.log.service.IVisitLogService;
import com.vhans.core.utils.data.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 访问业务接口实现类
 *
 * @author vhans
 */
@Service
public class VisitLogServiceImpl extends ServiceImpl<VisitLogMapper, VisitLog> implements IVisitLogService {

    @Autowired
    private VisitLogMapper visitLogMapper;

    @Override
    public List<VisitLog> listVisitLog(VisitLog.Query query) {
        // 查询访问日志列表
        return visitLogMapper.selectList(new LambdaQueryWrapper<VisitLog>()
                .eq(StringUtils.isNotNull(query.getPage()), VisitLog::getPage, query.getPage()));
    }

    @Override
    public void saveVisitLog(VisitLog visitLog) {
        // 保存访问日志
        visitLogMapper.insert(visitLog);
    }
}




