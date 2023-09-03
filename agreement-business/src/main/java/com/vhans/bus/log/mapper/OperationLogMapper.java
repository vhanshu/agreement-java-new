package com.vhans.bus.log.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.log.domain.OperationLog;
import org.springframework.stereotype.Repository;

/**
 * 【操作日志】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface OperationLogMapper extends BaseMapper<OperationLog> {

}
