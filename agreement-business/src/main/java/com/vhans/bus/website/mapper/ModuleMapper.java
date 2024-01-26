package com.vhans.bus.website.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.website.domain.Module;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 组件Mapper接口
 *
 * @author vhans
 * @date 2024-01-26
 */
@Repository
public interface ModuleMapper extends BaseMapper<Module> {

    /**
     * 查询组件列表
     *
     * @param query 查询条件
     * @return 组件集合
     */
    List<Module> selectModuleList(@Param("query") Module.Query query);

    /**
     * 通过主键查询组件信息
     *
     * @param id 组件ID
     * @return 结果
     */
    Module selectModuleInfoById(Integer id);

}
