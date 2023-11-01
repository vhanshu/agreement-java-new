package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
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
     * 查询题目作答列表
     *
     * @param query 条件
     * @return {@link QuizAnswer} 作答列表
     */
    @ApiOperation(value = "查询题目作答列表")
    @SaCheckPermission("data:answer:list")
    @GetMapping("/list}")
    public TableDataInfo<QuizAnswer> list(QuizAnswer.Query query) {
        startPage();
        List<QuizAnswer> list = quizAnswerService.selectAnswerList(query);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 获取题目作答详细信息
     *
     * @param id 题目作答id
     * @return {@link Result<QuizAnswer>} 题目作答信息
     */
    @ApiOperation(value = "获取题目作答编辑信息")
    @SaCheckPermission("data:answer:query")
    @GetMapping(value = "/info/{id}")
    public Result<QuizAnswer> getInfo(@PathVariable("id") Integer id) {
        return Result.success(quizAnswerService.selectAnswerById(id));
    }

    /**
     * 新增题目作答
     *
     * @param quizAnswer 题目作答信息
     * @return {@link Result<>}
     */
    @ApiOperation(value = "新增题目作答")
    @PostMapping("/add")
    public Result<?> add(@Validated @RequestBody QuizAnswer quizAnswer) {
        return toAjax(quizAnswerService.insertAnswer(quizAnswer));
    }

    /**
     * 修改题目作答(包含审核)
     *
     * @param quizAnswer 题目作答信息
     * @return {@link Result<>}
     */
    @ApiOperation(value = "修改题目作答")
    @SaCheckPermission("data:answer:update")
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
    @ApiOperation(value = "删除题目作答")
    @SaCheckPermission("data:answer:delete")
    @DeleteMapping("/delete/{id}")
    public Result<?> delete(@PathVariable Integer id) {
        return toAjax(quizAnswerService.deleteAnswer(id));
    }
}
