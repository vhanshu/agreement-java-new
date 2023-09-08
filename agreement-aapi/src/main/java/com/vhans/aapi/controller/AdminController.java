package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import com.vhans.bus.subsidiary.model.dto.DisableDTO;
import com.vhans.bus.subsidiary.model.dto.EmailDTO;
import com.vhans.bus.subsidiary.model.dto.PasswdDTO;
import com.vhans.bus.system.domain.Admin;
import com.vhans.bus.system.domain.vo.AdminInfo;
import com.vhans.bus.system.domain.vo.AdminRoleVO;
import com.vhans.bus.system.domain.vo.RouterVO;
import com.vhans.bus.system.service.IAdminService;
import com.vhans.core.annotation.OptLogger;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import static com.vhans.core.constant.OptTypeConstant.KICK;
import static com.vhans.core.constant.OptTypeConstant.UPDATE;

/**
 * 管理员控制器
 *
 * @author vhans
 **/
@Api(tags = "管理员模块")
@RestController
@RequestMapping("/admin")
public class AdminController extends BaseController {

    @Autowired
    private IAdminService adminService;

    /**
     * 获取后台登录管理员信息
     *
     * @return {@link AdminInfo} 登录管理员信息
     */
    @SaCheckLogin
    @ApiOperation(value = "获取后台登录管理员信息")
    @GetMapping("/getAdminInfo")
    public Result<AdminInfo> getAdminInfo() {
        return Result.success(adminService.getAdminInfo());
    }

    /**
     * 获取登录管理员菜单
     *
     * @return {@link RouterVO} 登录管理员菜单
     */
    @ApiOperation(value = "获取登录管理员菜单")
    @GetMapping("/getAdminMenu")
    public Result<List<RouterVO>> getAdminMenu() {
        return Result.success(adminService.getAdminMenu());
    }

    /**
     * 查看管理员列表
     *
     * @param query 条件
     * @return {@link Admin} 管理员列表
     */
    @ApiOperation(value = "查看管理员列表")
    @SaCheckPermission("system:admin:list")
    @GetMapping("/list")
    public TableDataInfo<Admin> listAdminVO(Admin.Query query) {
        startPage();
        List<Admin> list = adminService.listAdmin(query);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 查看管理员角色选项
     *
     * @return {@link AdminRoleVO} 管理员角色选项
     */
    @ApiOperation(value = "查看管理员角色选项")
    @SaCheckPermission("system:admin:list")
    @GetMapping("/role")
    public Result<List<AdminRoleVO>> listAdminRoleDTO() {
        return Result.success(adminService.listAdminRoleDTO());
    }

    /**
     * 修改管理员
     *
     * @param admin 管理员信息
     * @param isRole 是否修改角色信息
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "修改管理员")
    @SaCheckPermission("system:admin:update")
    @PutMapping("/update")
    public Result<?> updateAdmin(@Validated @RequestBody Admin admin, Integer isRole) {
        adminService.updateAdmin(admin, isRole);
        return Result.success();
    }

    /**
     * 修改管理员状态
     *
     * @param disable 禁用信息
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "修改管理员状态")
    @SaCheckPermission("system:admin:status")
    @PutMapping("/changeStatus")
    public Result<?> updateAdminStatus(@Validated @RequestBody DisableDTO disable) {
        adminService.updateAdminStatus(disable);
        return Result.success();
    }

    /**
     * 下线管理员
     *
     * @param token 在线token
     * @return 结果
     */
    @OptLogger(value = KICK)
    @ApiOperation(value = "下线管理员")
    @SaCheckPermission("monitor:online:kick")
    @GetMapping("/kick/{token}")
    public Result<?> kickOutAdmin(@PathVariable("token") String token) {
        adminService.kickOutAdmin(token);
        return Result.success();
    }

    /**
     * 修改我的密码
     *
     * @param passwd 密码
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "修改管理员密码")
    @PutMapping("/passwd")
    public Result<?> updateAdminPasswd(@Validated @RequestBody PasswdDTO passwd) {
        adminService.updateAdminPassword(passwd);
        return Result.success();
    }

    /**
     * 修改管理员邮箱
     *
     * @param email 邮箱信息
     * @return 结果
     */
    @ApiOperation(value = "修改管理员邮箱")
    @SaCheckPermission(value = "admin:email:update")
    @PutMapping("/email")
    public Result<?> updateUserEmail(@Validated @RequestBody EmailDTO email) {
        adminService.updateAdminEmail(email);
        return Result.success();
    }

    /**
     * 修改管理员头像
     *
     * @param file 文件
     * @return {@link Result<String>} 头像地址
     */
    @ApiOperation(value = "修改管理员头像")
    @SaCheckPermission(value = "admin:avatar:update")
    @PostMapping("/avatar")
    public Result<String> updateUserAvatar(@RequestParam(value = "file") MultipartFile file) {
        return Result.success(adminService.updateAdminAvatar(file));
    }
}