package com.vhans.bus.website.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.website.domain.Task;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【任务】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface TaskMapper extends BaseMapper<Task> {
    /**
     * 查询定时任务列表
     *
     * @param query 条件
     * @return 定时任务列表
     */
    List<Task> selectTask(@Param("query") Task.Query query);
}
