package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.vhans.bus.subsidiary.model.dto.DisableDTO;
import com.vhans.bus.user.domain.User;
import com.vhans.bus.user.service.IUserService;
import com.vhans.core.annotation.OptLogger;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.vhans.core.constant.OptTypeConstant.KICK;
import static com.vhans.core.constant.OptTypeConstant.UPDATE;

/**
 * 用户控制器
 *
 * @author vhans
 **/
@Api(tags = "用户模块")
@RestController
@RequestMapping("/user")
public class UserController extends BaseController {

    @Autowired
    private IUserService userService;

    /**
     * 查看用户列表
     *
     * @param query 条件
     * @return {@link User} 用户列表
     */
    @ApiOperation(value = "查看用户列表")
    @SaCheckPermission("web:user:list")
    @GetMapping("/list")
    public TableDataInfo listUserBackVO(User.Query query) {
        startPage();
        List<User> list = userService.listUser(query);
        return getDataTable(list);
    }


    /**
     * 修改用户
     *
     * @param user 用户信息
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "修改用户")
    @SaCheckPermission("web:user:update")
    @PutMapping("/update")
    public Result<?> updateUser(@Validated @RequestBody User user) {
        userService.updateUser(user);
        return Result.success();
    }

    /**
     * 修改用户状态
     *
     * @param disable 禁用信息
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "修改用户状态")
    @SaCheckPermission("web:user:status")
    @PutMapping("/status")
    public Result<?> updateUserStatus(@Validated @RequestBody DisableDTO disable) {
        userService.updateUserStatus(disable);
        return Result.success();
    }

    /**
     * 下线用户
     *
     * @param token 在线token
     * @return 结果
     */
    @OptLogger(value = KICK)
    @ApiOperation(value = "下线用户")
    @SaCheckPermission("monitor:online:kick")
    @GetMapping("/kick/{token}")
    public Result<?> kickOutUser(@PathVariable("token") String token) {
        userService.kickOutUser(token);
        return Result.success();
    }

    /**
     * 重置用户密码=>123456
     *
     * @param userId 用户id
     * @return 结果
     */
    @ApiOperation(value = "重置用户密码")
    @SaCheckPermission("web:user:password")
    @PutMapping("/passwd/{userId}")
    public Result<?> updateUserPasswd(@PathVariable("userId") Integer userId) {
        userService.resetPassword(userId);
        return Result.success();
    }
}