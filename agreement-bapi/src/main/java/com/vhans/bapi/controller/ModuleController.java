package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.vhans.bus.website.domain.Module;
import com.vhans.bus.website.service.IModuleService;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 组件Controller控制器
 *
 * @author vhans
 * @date 2024-01-26
 */
@Api(tags = "组件模块")
@RestController
@RequestMapping("/module")
public class ModuleController extends BaseController {

    @Autowired
    private IModuleService moduleService;

    /**
     * 查询组件列表
     *
     * @param query 条件
     * @return {@link Module} 组件列表
     */
    @ApiOperation(value = "查询组件列表")
    @GetMapping("/list")
    public TableDataInfo<Module> list(Module.Query query) {
        startPage();
        List<Module> list = moduleService.selectModuleList(query);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 新增组件
     *
     * @param module 组件信息
     * @return 结果
     */
    @ApiOperation(value = "新增组件")
    @SaCheckLogin
    @PostMapping("/add")
    public Result<?> add(@Validated @RequestBody Module module) {
        return toAjax(moduleService.insertModule(module));
    }

    /**
     * 修改组件
     *
     * @param module 组件信息
     * @return 结果
     */
    @ApiOperation(value = "修改组件")
    @SaCheckLogin
    @PutMapping("/update")
    public Result<?> update(@Validated @RequestBody Module module) {
        return toAjax(moduleService.updateModule(module));
    }

    /**
     * 删除组件
     *
     * @param id 需要删除的组件主键
     * @return {@link Result<>}
     */
    @ApiOperation(value = "删除组件")
    @SaCheckLogin
    @DeleteMapping("/delete")
    public Result<?> delete(@RequestBody Integer id) {
        return toAjax(moduleService.deleteModuleById(id));
    }
}
