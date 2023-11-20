package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.hutool.core.lang.Assert;
import com.vhans.bus.agree.domain.vo.AgreeVO;
import com.vhans.bus.data.domain.AgreeRecord;
import com.vhans.bus.data.domain.Comment;
import com.vhans.bus.data.domain.Quiz;
import com.vhans.bus.data.domain.QuizAnswer;
import com.vhans.bus.subsidiary.model.dto.EmailDTO;
import com.vhans.bus.subsidiary.model.dto.PasswdDTO;
import com.vhans.bus.user.domain.User;
import com.vhans.bus.user.domain.dto.UserAgreeDTO;
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
    @GetMapping("/loginInfo")
    public Result<UserInfoVO> getLoginInfo() {
        return Result.success(userService.getLoginInfo());
    }

    /**
     * 获取用户基本信息
     *
     * @param userId 用户id
     * @return {@link User} 用户基本信息
     */
    @SaCheckLogin
    @ApiOperation(value = "获取用户基本信息")
    @GetMapping("/getInfo/{userId}")
    public Result<User> getInfo(@PathVariable Integer userId) {
        return Result.success(userService.getUserById(userId));
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
     * 获取用户发布的约起(type1~4)
     *
     * @return {@link AgreeVO} 发布的约起
     */
    @SaCheckLogin
    @ApiOperation(value = "发布的约起(type1~4)")
    @GetMapping("/getAgree/issue/{userId}")
    public TableDataInfo<AgreeVO> getIssueAgreement(@PathVariable("userId") Integer userId, UserAgreeDTO userAgree) {
        startPage();
        List<AgreeVO> list = userService.getIssueAgree(userId, userAgree);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 获取用户参与的约起(type1~6)
     *
     * @return 参与的约起
     */
    @SaCheckLogin
    @ApiOperation(value = "参与的约起(type1~4)")
    @GetMapping("/getAgree/take/{userId}")
    public TableDataInfo<AgreeVO> getTakeAgreement(@PathVariable("userId") Integer userId, UserAgreeDTO userAgree) {
        startPage();
        List<AgreeVO> list = userService.getTakeAgree(userId, userAgree);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 获取用户发表的记录(type0~4)
     *
     * @return {@link AgreeRecord} 发表的记录
     */
    @SaCheckLogin
    @ApiOperation(value = "发表的记录(type0~4)")
    @GetMapping("/getRecord/issue/{userId}")
    public TableDataInfo<AgreeRecord> getIssueRecord(@PathVariable("userId") Integer userId, UserAgreeDTO userAgree) {
        startPage();
        List<AgreeRecord> list = userService.getIssueRecord(userId, userAgree);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 获取用户发表的题目(type无)
     *
     * @return {@link Quiz} 发表的题目
     */
    @SaCheckLogin
    @ApiOperation(value = "发表的题目(type无)")
    @GetMapping("/getQuiz/issue/{userId}")
    public TableDataInfo<Quiz> getIssueQuiz(@PathVariable("userId") Integer userId, UserAgreeDTO userAgree) {
        startPage();
        List<Quiz> list = userService.getIssueQuiz(userId, userAgree);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 获取用户发表的题目作答(type无)
     *
     * @return {@link QuizAnswer} 发表的题目作答
     */
    @SaCheckLogin
    @ApiOperation(value = "发表的题目作答(type无)")
    @GetMapping("/getAnswer/issue/{userId}")
    public TableDataInfo<QuizAnswer> getIssueAnswer(@PathVariable("userId") Integer userId, UserAgreeDTO userAgree) {
        startPage();
        List<QuizAnswer> list = userService.getIssueAnswer(userId, userAgree);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 获取用户发表的评论(type0~2)
     *
     * @return {@link Comment} 用户发表的评论
     */
    @SaCheckLogin
    @ApiOperation(value = "发表的评论(type0~2)")
    @GetMapping("/getComment/issue/{userId}")
    public TableDataInfo<Comment> getIssueComment(@PathVariable("userId") Integer userId, UserAgreeDTO userAgree) {
        startPage();
        List<Comment> list = userService.getIssueComment(userId, userAgree);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 获取用户收藏的记录(type0~4)
     *
     * @return 收藏的记录
     */
    @SaCheckLogin
    @ApiOperation(value = "收藏的记录(type0~4)")
    @GetMapping("/getRecord/collect/{userId}")
    public TableDataInfo<AgreeRecord> getCollectRecord(@PathVariable("userId") Integer userId, UserAgreeDTO userAgree) {
        startPage();
        List<AgreeRecord> list = userService.getCollectRecord(userId, userAgree);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 获取登录用户收藏的题目(type无)
     *
     * @return 收藏的题目
     */
    @SaCheckLogin
    @ApiOperation(value = "收藏的题目(type无)")
    @GetMapping("/getQuiz/collect/{userId}")
    public TableDataInfo<Quiz> getCollectQuiz(@PathVariable("userId") Integer userId, UserAgreeDTO userAgree) {
        startPage();
        List<Quiz> list = userService.getCollectQuiz(userId, userAgree);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 获取用户点赞的记录(type0~4)
     *
     * @return 点赞的记录
     */
    @SaCheckLogin
    @ApiOperation(value = "点赞的记录(type0~4)")
    @GetMapping("/getRecord/like/{userId}")
    public TableDataInfo<AgreeRecord> getLikeRecord(@PathVariable("userId") Integer userId, UserAgreeDTO userAgree) {
        Assert.notNull(userAgree.getFlag(), "缓存请求标记是必须的");
        if (!userAgree.getFlag()) {
            startPage();
        }
        List<AgreeRecord> list = userService.getLikeRecord(userId, userAgree);
        clearPage();
        return userAgree.getFlag() ? getDataTable(list, -1) : getDataTable(list);
    }

    /**
     * 获取用户点赞的题目(type无)
     *
     * @return 点赞的题目
     */
    @SaCheckLogin
    @ApiOperation(value = "点赞的题目(type无)")
    @GetMapping("/getQuiz/like/{userId}")
    public TableDataInfo<Quiz> getLikeQuiz(@PathVariable("userId") Integer userId, UserAgreeDTO userAgree) {
        Assert.notNull(userAgree.getFlag(), "缓存请求标记是必须的");
        if (!userAgree.getFlag()) {
            startPage();
        }
        List<Quiz> list = userService.getLikeQuiz(userId, userAgree);
        clearPage();
        return userAgree.getFlag() ? getDataTable(list, -1) : getDataTable(list);
    }

    /**
     * 获取用户点赞的题目作答(type无)
     *
     * @return 点赞的题目
     */
    @SaCheckLogin
    @ApiOperation(value = "点赞的题目作答(type无)")
    @GetMapping("/getAnswer/like/{userId}")
    public TableDataInfo<QuizAnswer> getLikeAnsWer(@PathVariable("userId") Integer userId, UserAgreeDTO userAgree) {
        Assert.notNull(userAgree.getFlag(), "缓存请求标记是必须的");
        if (!userAgree.getFlag()) {
            startPage();
        }
        List<QuizAnswer> list = userService.getLikeAnswer(userId, userAgree);
        clearPage();
        return userAgree.getFlag() ? getDataTable(list, -1) : getDataTable(list);
    }

    /**
     * 获取用户点赞的评论(type0~2)
     *
     * @return 点赞的评论
     */
    @SaCheckLogin
    @ApiOperation(value = "点赞的评论(type0~2)")
    @GetMapping("/getComment/like/{userId}")
    public TableDataInfo<Comment> getLikeComment(@PathVariable("userId") Integer userId, UserAgreeDTO userAgree) {
        Assert.notNull(userAgree.getFlag(), "缓存请求标记是必须的");
        if (!userAgree.getFlag()) {
            startPage();
        }
        List<Comment> list = userService.getLikeComment(userId, userAgree);
        clearPage();
        return userAgree.getFlag() ? getDataTable(list, -1) : getDataTable(list);
    }
}