package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.vhans.bus.data.domain.Quiz;
import com.vhans.bus.data.service.IQuizService;
import com.vhans.bus.data.domain.vo.OverviewVO;
import com.vhans.core.annotation.AccessLimit;
import com.vhans.core.annotation.VisitLogger;
import com.vhans.core.enums.LikeTypeEnum;
import com.vhans.core.strategy.context.LikeStrategyContext;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import com.vhans.core.web.model.vo.SearchVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * 题目控制器
 *
 * @author vhans
 **/
@Api(tags = "题目模块")
@RestController
@RequestMapping("/quiz")
public class QuizController extends BaseController {

    @Autowired
    private IQuizService quizService;

    @Autowired
    private LikeStrategyContext likeStrategyContext;

    /**
     * 添加题目
     *
     * @param quiz 题目信息
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "添加题目")
    @PostMapping("/add")
    public Result<?> addQuiz(@Validated @RequestBody Quiz quiz) {
        quizService.addQuiz(quiz);
        return Result.success();
    }

    /**
     * 修改题目
     *
     * @param quiz 题目信息
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "修改题目")
    @PutMapping("/update")
    public Result<?> updateQuiz(@Validated @RequestBody Quiz quiz) {
        quizService.updateQuiz(quiz);
        return Result.success();
    }

    /**
     * 获取题目信息
     *
     * @param quizId 题目id
     * @return {@link Result<Quiz>} 题目信息
     */
    @SaCheckLogin
    @ApiOperation(value = "获取题目信息")
    @GetMapping("/info/{quizId}")
    public Result<Quiz> editQuiz(@PathVariable("quizId") Integer quizId) {
        return Result.success(quizService.getQuizInfo(quizId));
    }

    /**
     * 点赞题目
     *
     * @param quizId 题目id
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "点赞题目")
    @AccessLimit(seconds = 60, maxCount = 3)
    @PostMapping("/like/{quizId}")
    public Result<?> likeQuiz(@PathVariable("quizId") Integer quizId) {
        likeStrategyContext.executeLikeStrategy(LikeTypeEnum.QUIZ, quizId);
        return Result.success();
    }

    /**
     * 收藏题目
     *
     * @param quizId 题目id
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "收藏题目")
    @PostMapping("/collect/{quizId}")
    public Result<?> collectQuiz(@PathVariable("quizId") Integer quizId) {
        quizService.collectQuiz(quizId);
        return Result.success();
    }

    /**
     * 搜索题目
     *
     * @param keyword 关键字
     * @return {@link Result<SearchVO>} 题目搜索内容列表
     */
    @ApiOperation(value = "搜索题目")
    @GetMapping("/search/{keyword}")
    public Result<List<SearchVO>> searchQuiz(@PathVariable String keyword) {
        return Result.success(quizService.listQuizBySearch(keyword));
    }

    /**
     * 查看前台题目列表
     *
     * @return {@link Quiz}
     */
    @VisitLogger(value = "学习中心")
    @ApiOperation(value = "查看前台题目列表")
    @GetMapping("/list")
    public TableDataInfo<Quiz> listQuizStudyVO() {
        startPage();
        List<Quiz> list = quizService.listQuizHome();
        clearPage();
        return getDataTable(list);
    }

    /**
     * 查看题目
     *
     * @param quizId 题目id
     * @return {@link Result<Quiz>} 首页题目
     */
    @ApiOperation(value = "查看题目")
    @GetMapping("/look/{quizId}")
    public Result<Quiz> lookQuiz(@PathVariable("quizId") Integer quizId) {
        return Result.success(quizService.getQuizHomeById(quizId));
    }

    /**
     * 获取推荐题目
     *
     * @return {@link Result<Quiz>} 推荐题目
     */
    @ApiOperation(value = "查看推荐题目")
    @GetMapping("/recommend")
    public Result<List<Quiz>> listQuizRecommendVO() {
        return Result.success(quizService.listQuizRecommendVO());
    }

    /**
     * 查看题目总览
     *
     * @return {@link OverviewVO} 题目总览列表
     */
    @VisitLogger(value = "总览")
    @ApiOperation(value = "查看题目总览")
    @GetMapping("/overview")
    public TableDataInfo<OverviewVO> listQuizOverviewVO() {
        startPage();
        List<OverviewVO> list = quizService.listQuizOverviewVO();
        clearPage();
        return getDataTable(list);
    }

    /**
     * 删除题目
     * @param quizIds 题目ids
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "删除题目")
    @DeleteMapping("/delete")
    public Result<?> deleteQuiz(@RequestBody List<Integer> quizIds) {
        quizService.deleteQuiz(quizIds);
        return Result.success();
    }
}