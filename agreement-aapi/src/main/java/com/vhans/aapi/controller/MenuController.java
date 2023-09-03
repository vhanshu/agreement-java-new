package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.vhans.bus.system.domain.vo.MenuTree;
import com.vhans.bus.system.domain.Menu;
import com.vhans.bus.system.service.IMenuService;
import com.vhans.core.annotation.OptLogger;
import com.vhans.core.web.model.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.vhans.core.constant.OptTypeConstant.*;

/**
 * 菜单控制器
 *
 * @author vhans
 **/
@Api(tags = "菜单模块")
@RestController
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private IMenuService menuService;

    /**
     * 查看菜单列表
     *
     * @param query 查询条件
     * @return {@link Menu} 菜单列表
     */
    @ApiOperation(value = "查看菜单列表")
    @SaCheckPermission("system:menu:list")
    @GetMapping("/list")
    public Result<List<Menu>> listMenuVO(Menu.Query query) {
        return Result.success(menuService.listMenu(query));
    }

    /**
     * 添加菜单
     *
     * @return 结果
     */
    @OptLogger(value = ADD)
    @ApiOperation(value = "添加菜单")
    @SaCheckPermission("system:menu:add")
    @PostMapping("/add")
    public Result<?> addMenu(@Validated @RequestBody Menu menu) {
        menuService.addMenu(menu);
        return Result.success();
    }

    /**
     * 删除菜单
     *
     * @param menuId 菜单id
     * @return 结果
     */
    @OptLogger(value = DELETE)
    @ApiOperation(value = "删除菜单")
    @SaCheckPermission("system:menu:delete")
    @DeleteMapping("/delete/{menuId}")
    public Result<?> deleteMenu(@PathVariable("menuId") Integer menuId) {
        menuService.deleteMenu(menuId);
        return Result.success();
    }

    /**
     * 修改菜单
     *
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "修改菜单")
    @SaCheckPermission("system:menu:update")
    @PutMapping("/update")
    public Result<?> updateMenu(@Validated @RequestBody Menu menu) {
        menuService.updateMenu(menu);
        return Result.success();
    }

    /**
     * 获取菜单下拉树
     *
     * @return {@link MenuTree} 菜单树
     */
    @ApiOperation(value = "获取菜单下拉树")
    @SaCheckPermission("system:role:list")
    @GetMapping("/getMenuTree")
    public Result<List<MenuTree>> listMenuTree() {
        return Result.success(menuService.listMenuTree());
    }

    /**
     * 获取菜单选项树
     *
     * @return {@link MenuTree} 菜单下拉树
     */
    @ApiOperation(value = "获取菜单选项树")
    @SaCheckPermission("system:menu:list")
    @GetMapping("/getMenuOptions")
    public Result<List<MenuTree>> listMenuOption() {
        return Result.success(menuService.listMenuOption());
    }

    /**
     * 获取菜单信息
     *
     * @param menuId 菜单id
     * @return {@link Menu} 菜单
     */
    @ApiOperation(value = "获取菜单信息")
    @SaCheckPermission("system:menu:info")
    @GetMapping("/info/{menuId}")
    public Result<Menu> editMenu(@PathVariable("menuId") Integer menuId) {
        return Result.success(menuService.editMenu(menuId));
    }

}