package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.stp.StpUtil;
import com.vhans.bus.subsidiary.model.dto.LoginDTO;
import com.vhans.bus.user.domain.dto.GitDTO;
import com.vhans.bus.user.domain.dto.QqLoginDTO;
import com.vhans.bus.user.domain.dto.RegisterDTO;
import com.vhans.bus.user.service.IUserLoginService;
import com.vhans.core.annotation.AccessLimit;
import com.vhans.core.web.model.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 登录控制器
 *
 * @author vhans
 */
@Api(tags = "登录模块")
@RestController
public class LoginController {

    @Autowired
    private IUserLoginService loginService;

    /**
     * 用户登录
     *
     * @param login 登录参数
     * @return {@link String} Token
     */
    @ApiOperation(value = "用户登录")
    @PostMapping("/login")
    public Result<String> login(@Validated @RequestBody LoginDTO login) {
        return Result.success(loginService.login(login));
    }

    /**
     * 用户退出
     */
    @SaCheckLogin
    @ApiOperation(value = "用户退出")
    @GetMapping("/logout")
    public Result<?> logout() {
        StpUtil.logout();
        return Result.success();
    }

    /**
     * 发送邮箱验证码
     *
     * @param email 邮箱
     * @return 结果
     */
    @AccessLimit(seconds = 60, maxCount = 1)
    @ApiOperation(value = "发送邮箱验证码")
    @GetMapping("/code/{email}")
    public Result<?> sendCode(@PathVariable String email) {
        loginService.sendCode(email);
        return Result.success();
    }

    /**
     * 用户邮箱注册
     *
     * @param register 注册信息
     * @return 结果
     */
    @ApiOperation(value = "用户邮箱注册")
    @PostMapping("/register")
    public Result<?> register(@Validated @RequestBody RegisterDTO register) {
        loginService.register(register);
        return Result.success();
    }

    /**
     * 忘记密码时修改用户密码
     *
     * @param password 验证对象
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "修改用户密码")
    @PutMapping("/password")
    public Result<?> updatePassword(@Validated @RequestBody RegisterDTO password) {
        loginService.updatePasswd(password);
        return Result.success();
    }

    /**
     * Gitee登录
     *
     * @param data 第三方code
     * @return {@link Result<String>} Token
     */
    @ApiOperation(value = "Gitee登录")
    @PostMapping("/oauth/gitee")
    public Result<String> giteeLogin(@RequestBody GitDTO data) {
        return Result.success(loginService.giteeLogin(data));
    }

    /**
     * Github登录
     *
     * @param data 第三方code
     * @return {@link Result<String>} Token
     */
    @ApiOperation(value = "Github登录")
    @PostMapping("/oauth/github")
    public Result<String> githubLogin(@RequestBody GitDTO data) {
        return Result.success(loginService.githubLogin(data));
    }

    /**
     * QQ登录
     *
     * @param qqLogin QQ登录信息
     * @return {@link Result<String>} Token
     */
    @ApiOperation(value = "QQ登录")
    @PostMapping("/oauth/qq")
    public Result<String> qqLogin(@Validated @RequestBody QqLoginDTO qqLogin) {
        return Result.success(loginService.qqLogin(qqLogin));
    }
}

