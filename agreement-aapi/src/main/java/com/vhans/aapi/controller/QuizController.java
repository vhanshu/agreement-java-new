package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.vhans.bus.data.domain.Quiz;
import com.vhans.bus.data.service.IQuizService;
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

import static com.vhans.core.constant.OptTypeConstant.*;

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

    /**
     * 查看题目列表
     *
     * @param query 条件
     * @return {@link Quiz} 题目列表
     */
    @ApiOperation(value = "查看题目列表")
    @SaCheckPermission("agree:quiz:list")
    @GetMapping("/list")
    public TableDataInfo<Quiz> listQuizVO(Quiz.Query query) {
        startPage();
        List<Quiz> list = quizService.listQuiz(query);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 添加题目
     *
     * @param quiz 题目信息
     * @return 结果
     */
    @OptLogger(value = ADD)
    @ApiOperation(value = "添加题目")
    @SaCheckPermission("agree:quiz:add")
    @PostMapping("/add")
    public Result<?> addQuiz(@Validated @RequestBody Quiz quiz) {
        quizService.addQuiz(quiz);
        return Result.success();
    }

    /**
     * 删除题目
     *
     * @param quizIdList 题目id集合
     * @return 结果
     */
    @OptLogger(value = DELETE)
    @ApiOperation(value = "删除题目")
    @SaCheckPermission("agree:quiz:delete")
    @DeleteMapping("/delete")
    public Result<?> deleteQuiz(@RequestBody List<Integer> quizIdList) {
        quizService.deleteQuiz(quizIdList);
        return Result.success();
    }

    /**
     * 修改题目
     *
     * @param quiz 题目信息
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "修改题目")
    @SaCheckPermission("agree:quiz:update")
    @PutMapping("/update")
    public Result<?> updateQuiz(@Validated @RequestBody Quiz quiz) {
        quizService.updateQuiz(quiz);
        return Result.success();
    }

    /**
     * 获取题目信息
     *
     * @param quizId 题目id
     * @return {@link Result<Quiz>} 题目
     */
    @ApiOperation(value = "获取题目信息")
    @SaCheckPermission("agree:quiz:info")
    @GetMapping("/info/{quizId}")
    public Result<Quiz> editQuiz(@PathVariable("quizId") Integer quizId) {
        return Result.success(quizService.getQuizInfo(quizId));
    }
}