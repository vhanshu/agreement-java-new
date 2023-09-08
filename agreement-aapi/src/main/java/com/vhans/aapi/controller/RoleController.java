package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.annotation.SaMode;
import com.vhans.bus.system.domain.Role;
import com.vhans.core.annotation.OptLogger;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import com.vhans.bus.system.domain.dto.RoleStatusDTO;
import com.vhans.bus.system.service.IRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.vhans.core.constant.OptTypeConstant.*;

/**
 * 角色控制器
 *
 * @author vhans
 **/
@Api(tags = "角色模块")
@RestController
@RequestMapping("/role")
public class RoleController extends BaseController {

    @Autowired
    private IRoleService roleService;

    /**
     * 查看角色列表
     *
     * @param query 查询条件
     * @return {@link Role} 角色列表
     */
    @ApiOperation(value = "查看角色列表")
    @SaCheckPermission("system:role:list")
    @GetMapping("/list")
    public TableDataInfo<Role> listRoleVO(Role.Query query) {
        startPage();
        List<Role> list = roleService.listRoleVO(query);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 添加角色
     *
     * @param role 角色信息
     * @return 结果
     */
    @OptLogger(value = ADD)
    @ApiOperation(value = "添加角色")
    @SaCheckPermission("system:role:add")
    @PostMapping("/add")
    public Result<?> addRole(@Validated @RequestBody Role role) {
        roleService.addRole(role);
        return Result.success();
    }

    /**
     * 删除角色
     *
     * @param roleIdList 角色id集合
     * @return 结果
     */
    @OptLogger(value = DELETE)
    @ApiOperation(value = "删除角色")
    @SaCheckPermission("system:role:delete")
    @DeleteMapping("/delete")
    public Result<?> deleteRole(@RequestBody List<String> roleIdList) {
        roleService.deleteRole(roleIdList);
        return Result.success();
    }

    /**
     * 修改角色
     *
     * @param role 角色信息
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "修改角色")
    @SaCheckPermission("system:role:update")
    @PutMapping("/update")
    public Result<?> updateRole(@Validated @RequestBody Role role, Integer isMenu) {
        roleService.updateRole(role, isMenu);
        return Result.success();
    }

    /**
     * 修改角色状态
     *
     * @param roleStatus 角色状态
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "修改角色状态")
    @SaCheckPermission(value = {"system:role:update", "system:role:status"}, mode = SaMode.OR)
    @PutMapping("/changeStatus")
    public Result<?> updateRoleStatus(@Validated @RequestBody RoleStatusDTO roleStatus) {
        roleService.updateRoleStatus(roleStatus);
        return Result.success();
    }

    /**
     * 查看角色的菜单权限ids
     *
     * @param roleId 角色id
     * @return {@link List<Integer>} 菜单权限ids
     */
    @ApiOperation(value = "查看角色的菜单权限ids")
    @SaCheckPermission("system:role:list")
    @GetMapping("/menu/{roleId}")
    public Result<List<Integer>> listRoleMenuTree(@PathVariable("roleId") String roleId) {
        return Result.success(roleService.listRoleMenuTree(roleId));
    }

}