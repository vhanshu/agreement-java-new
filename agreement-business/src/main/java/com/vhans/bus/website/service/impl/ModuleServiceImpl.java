package com.vhans.bus.website.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.website.domain.Module;
import com.vhans.bus.website.mapper.ModuleMapper;
import com.vhans.bus.website.service.IModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 组件Service业务层处理
 *
 * @author vhans
 * @date 2024-01-26
 */
@Service
public class ModuleServiceImpl extends ServiceImpl<ModuleMapper, Module> implements IModuleService {

    @Autowired
    private ModuleMapper moduleMapper;

    @Override
    public List<Module> selectModuleList(Module.Query query) {
        return moduleMapper.selectModuleList(query);
    }

    @Override
    public int insertModule(Module module) {
        int userId = StpUtil.getLoginIdAsInt();
        module.setUserId(userId);
        return moduleMapper.insert(module);
    }

    @Override
    public Module selectModuleInfoById(Integer id) {
        return moduleMapper.selectModuleInfoById(id);
    }

    @Override
    public int updateModule(Module module) {
        return moduleMapper.updateById(module);
    }

    @Override
    public int deleteModuleById(Integer id) {
        return moduleMapper.deleteById(id);
    }
}
