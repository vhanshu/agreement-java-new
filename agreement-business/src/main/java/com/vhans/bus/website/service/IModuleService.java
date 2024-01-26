package com.vhans.bus.website.service;

import com.vhans.bus.website.domain.Module;

import java.util.List;

/**
 * 组件Service接口
 *
 * @author vhans
 * @date 2024-01-26
 */
public interface IModuleService {

    /**
     * 查询组件列表
     *
     * @param query 条件
     * @return 组件集合
     */
    List<Module> selectModuleList(Module.Query query);

    /**
     * 新增组件
     *
     * @param module 组件
     * @return 影响行
     */
    int insertModule(Module module);

    /**
     * 获取组件详细信息
     *
     * @param id 组件主键
     * @return 组件
     */
    Module selectModuleInfoById(Integer id);

    /**
     * 修改组件
     *
     * @param module 组件
     * @return 影响行
     */
    int updateModule(Module module);

    /**
     * 删除组件
     *
     * @param id 需要删除的组件主键
     * @return 影响行
     */
    int deleteModuleById(Integer id);
}