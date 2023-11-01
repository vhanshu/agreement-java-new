package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.vhans.bus.data.domain.QuizAnswer;
import com.vhans.bus.data.service.IQuizAnswerService;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 题目作答Controller控制器
 *
 * @author vhans
 * @date 2023-11-01
 */
@Api(tags = "题目作答模块")
@RestController
@RequestMapping("/answer")
public class QuizAnswerController extends BaseController {

    @Autowired
    private IQuizAnswerService quizAnswerService;

    /**
     * 查询前台某个题目的作答列表
     * @param quizId 题目id
     * @return {@link QuizAnswer} 作答列表
     */
    @ApiOperation(value = "查询前台某个题目的作答列表")
    @GetMapping("/list/{quizId}")
    public TableDataInfo<QuizAnswer> list(@PathVariable Integer quizId) {
        startPage();
        List<QuizAnswer> list = quizAnswerService.selectAnswerHomeList(quizId);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 新增题目作答
     *
     * @param quizAnswer 题目作答信息
     * @return {@link Result<>}
     */
    @SaCheckLogin
    @ApiOperation(value = "新增题目作答")
    @PostMapping("/add")
    public Result<?> add(@Validated @RequestBody QuizAnswer quizAnswer) {
        return toAjax(quizAnswerService.insertAnswer(quizAnswer));
    }

    /**
     * 修改题目作答
     *
     * @param quizAnswer 题目作答信息
     * @return {@link Result<>}
     */
    @SaCheckLogin
    @ApiOperation(value = "修改题目作答")
    @PutMapping("/update")
    public Result<?> update(@Validated @RequestBody QuizAnswer quizAnswer) {
        return toAjax(quizAnswerService.updateAnswer(quizAnswer));
    }

    /**
     * 删除题目作答
     *
     * @param id 需要删除的题目作答主键
     * @return {@link Result<>}
     */
    @SaCheckLogin
    @ApiOperation(value = "删除题目作答")
    @DeleteMapping("/delete/{id}")
    public Result<?> delete(@PathVariable Integer id) {
        return toAjax(quizAnswerService.deleteAnswer(id));
    }

}
