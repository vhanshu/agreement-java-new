package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.stp.StpUtil;
import com.vhans.bus.subsidiary.model.vo.OnlineVO;
import com.vhans.core.annotation.AccessLimit;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.bus.subsidiary.model.dto.LoginDTO;
import com.vhans.bus.system.domain.dto.UpdatePasswdDTO;
import com.vhans.bus.system.service.IAdminLoginService;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 登录模块
 *
 * @author vhans
 */
@Api(tags = "登录模块")
@RestController
public class LoginController extends BaseController {

    @Autowired
    private IAdminLoginService loginService;

    /**
     * 管理员登录
     *
     * @param login 登录参数
     * @return {@link String} Token
     */
    @ApiOperation(value = "管理员登录")
    @PostMapping("/login")
    public Result<String> login(@Validated @RequestBody LoginDTO login) {
        return Result.success(loginService.loginAdmin(login));
    }

    /**
     * 管理员退出
     */
    @SaCheckLogin
    @ApiOperation(value = "管理员退出")
    @GetMapping("/logout")
    public Result<?> logout() {
        StpUtil.logout();
        return Result.success();
    }

    /**
     * 发送修改密码的验证码
     *
     * @param admin 管理员账号
     * @return 结果
     */
    @AccessLimit(seconds = 60, maxCount = 1)
    @ApiOperation(value = "发送验证码")
    @PostMapping("/email/{admin}")
    public Result<?> sendPasswd(@PathVariable String admin) {
        loginService.sendCode(admin);
        return Result.success();
    }

    /**
     * 根据验证码来更新密码
     *
     * @param passwdDTO 更新信息
     * @return 结果
     */
    @ApiOperation(value = "更新密码")
    @PostMapping("/updatePasswd")
    public Result<?> sendPasswd(@Validated @RequestBody UpdatePasswdDTO passwdDTO) {
        loginService.updatePasswd(passwdDTO);
        return Result.success();
    }

    /**
     * 查看在线人员
     *
     * @param name 名称
     * @param type 类型(1管理员 2用户)
     * @return {@link OnlineVO} 在线人员列表
     */
    @ApiOperation(value = "查看在线人员")
    @SaCheckPermission("monitor:online:list")
    @GetMapping("/online/list")
    public TableDataInfo<OnlineVO> listOnlineAdmin(String name, Integer type) {
        startPage();
        List<OnlineVO> list = loginService.listOnline(name, type);
        clearPage();
        return getDataTable(list);
    }
}
