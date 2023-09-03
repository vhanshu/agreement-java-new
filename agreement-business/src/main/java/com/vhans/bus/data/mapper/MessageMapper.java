package com.vhans.bus.data.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.data.domain.Message;
import org.springframework.stereotype.Repository;

/**
 * 【消息】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface MessageMapper extends BaseMapper<Message> {

}
