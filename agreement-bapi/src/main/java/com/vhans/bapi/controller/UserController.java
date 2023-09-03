package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.vhans.bus.agree.domain.vo.AgreeVO;
import com.vhans.bus.agree.domain.vo.MyAgree;
import com.vhans.bus.data.domain.AgreeRecord;
import com.vhans.bus.data.domain.Comment;
import com.vhans.bus.data.domain.Quiz;
import com.vhans.bus.subsidiary.model.dto.EmailDTO;
import com.vhans.bus.subsidiary.model.dto.PasswdDTO;
import com.vhans.bus.user.domain.User;
import com.vhans.bus.user.domain.vo.UserInfoVO;
import com.vhans.bus.user.service.IUserService;
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
     * 获取用户登录信息
     *
     * @return {@link UserInfoVO} 用户信息
     */
    @SaCheckLogin
    @ApiOperation(value = "获取用户登录信息")
    @GetMapping("/getUserInfo")
    public Result<UserInfoVO> getUserInfo() {
        return Result.success(userService.getUserInfo());
    }

    /**
     * 修改用户邮箱
     *
     * @param email 邮箱信息
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "修改用户邮箱")
    @PutMapping("/email")
    public Result<?> updateUserEmail(@Validated @RequestBody EmailDTO email) {
        userService.updateUserEmail(email);
        return Result.success();
    }

    /**
     * 修改用户头像
     *
     * @param file 文件
     * @return {@link Result<String>} 头像地址
     */
    @SaCheckLogin
    @ApiOperation(value = "修改用户头像")
    @PostMapping("/avatar")
    public Result<String> updateUserAvatar(@RequestParam(value = "file") MultipartFile file) {
        return Result.success(userService.updateUserAvatar(file));
    }

    /**
     * 修改我的密码
     *
     * @param password 密码
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "修改我的密码")
    @PutMapping("/password")
    public Result<?> updateAdminPassword(@Validated @RequestBody PasswdDTO password) {
        userService.updatePassword(password);
        return Result.success();
    }

    /**
     * 修改用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "修改用户信息")
    @PutMapping("/update")
    public Result<?> updateUserInfo(@Validated @RequestBody User user) {
        userService.updateUser(user);
        return Result.success();
    }

    /**
     * 获取用户发布的约起
     *
     * @param type 约起类型
     * @return 发布的约起
     */
    @SaCheckLogin
    @ApiOperation(value = "获取用户发布的约起")
    @GetMapping("/getAgree/issue/{type}")
    public TableDataInfo getIssueAgreement(@PathVariable Integer type) {
        startPage();
        List<AgreeVO> list = userService.getIssueAgree(type);
        return getDataTable(list);
    }

    /**
     * 获取用户参与的约起
     *
     * @return 参与的约起
     */
    @SaCheckLogin
    @ApiOperation(value = "获取用户参与的约起")
    @GetMapping("/getAgree/take")
    public Result<List<MyAgree>> getTakeAgreement() {
        return Result.success(userService.getTakeAgree());
    }

    /**
     * 获取用户发表的记录
     *
     * @return 发表的记录
     */
    @SaCheckLogin
    @ApiOperation(value = "获取用户发表的记录")
    @GetMapping("/getRecord/issue")
    public TableDataInfo getIssueRecord() {
        startPage();
        List<AgreeRecord> list = userService.getIssueRecord();
        return getDataTable(list);
    }

    /**
     * 获取用户发表的题目
     *
     * @return 发表的题目
     */
    @SaCheckLogin
    @ApiOperation(value = "获取用户发表的题目")
    @GetMapping("/getQuiz/issue")
    public TableDataInfo getIssueQuiz() {
        startPage();
        List<Quiz> list = userService.getIssueQuiz();
        return getDataTable(list);
    }

    /**
     * 获取用户收藏的记录
     *
     * @return 收藏的记录
     */
    @SaCheckLogin
    @ApiOperation(value = "获取用户收藏的记录")
    @GetMapping("/getRecord/collect")
    public Result<List<AgreeRecord>> getCollectRecord() {
        return Result.success(userService.getCollectRecord());
    }

    /**
     * 获取登录用户收藏的题目
     *
     * @return 收藏的题目
     */
    @SaCheckLogin
    @ApiOperation(value = "获取用户收藏的题目")
    @GetMapping("/getQuiz/collect")
    public Result<List<Quiz>> getCollectQuiz() {
        return Result.success(userService.getCollectQuiz());
    }

    /**
     * 获取用户点赞的记录
     *
     * @return 点赞的记录
     */
    @SaCheckLogin
    @ApiOperation(value = "获取用户点赞的记录")
    @GetMapping("/getRecord/like")
    public Result<List<AgreeRecord>> getLikeRecord() {
        return Result.success(userService.getLikeRecord());
    }

    /**
     * 获取用户点赞的题目
     *
     * @return 点赞的题目
     */
    @SaCheckLogin
    @ApiOperation(value = "获取用户点赞的题目")
    @GetMapping("/getQuiz/like")
    public Result<List<Quiz>> getLikeQuiz() {
        return Result.success(userService.getLikeQuiz());
    }

    /**
     * 获取用户点赞的评论
     *
     * @return 点赞的评论
     */
    @SaCheckLogin
    @ApiOperation(value = "获取用户点赞的评论")
    @GetMapping("/getComment/like")
    public Result<List<Comment>> getLikeComment() {
        return Result.success(userService.getLikeComment());
    }
}