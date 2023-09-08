package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.annotation.SaMode;
import com.vhans.bus.subsidiary.model.dto.StatusDTO;
import com.vhans.bus.website.domain.Task;
import com.vhans.bus.website.domain.dto.TaskRunDTO;
import com.vhans.bus.website.service.ITaskService;
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
 * 定时任务控制器
 *
 * @author ican
 */
@Api(tags = "定时任务模块")
@RestController
@RequestMapping("/task")
public class TaskController extends BaseController {

    @Autowired
    private ITaskService taskService;

    /**
     * 查看定时任务列表
     *
     * @param query 条件
     * @return {@link Task} 定时任务列表
     */
    @ApiOperation("查看定时任务列表")
    @SaCheckPermission("monitor:task:list")
    @GetMapping("/list")
    public TableDataInfo<Task> listTask(Task.Query query) {
        startPage();
        List<Task> list = taskService.listTask(query);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 添加定时任务
     *
     * @param task 定时任务信息
     * @return 结果
     */
    @OptLogger(value = ADD)
    @ApiOperation("添加定时任务")
    @SaCheckPermission("monitor:task:add")
    @PostMapping("/add")
    public Result<?> addTask(@Validated @RequestBody Task task) {
        taskService.addTask(task);
        return Result.success();
    }

    /**
     * 修改定时任务
     *
     * @param task 定时任务信息
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation("修改定时任务")
    @SaCheckPermission(value = "monitor:task:update")
    @PutMapping("/update")
    public Result<?> updateTask(@Validated @RequestBody Task task) {
        taskService.updateTask(task);
        return Result.success();
    }

    /**
     * 删除定时任务
     *
     * @param taskIdList 定时任务id集合
     * @return 结果
     */
    @OptLogger(value = DELETE)
    @ApiOperation("删除定时任务")
    @SaCheckPermission("monitor:task:delete")
    @DeleteMapping("/delete")
    public Result<?> deleteTask(@RequestBody List<Integer> taskIdList) {
        taskService.deleteTask(taskIdList);
        return Result.success();
    }

    /**
     * 修改定时任务状态
     *
     * @param taskStatus 定时任务状态
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation("修改定时任务状态")
    @SaCheckPermission(value = {"monitor:task:update", "monitor:task:status"}, mode = SaMode.OR)
    @PutMapping("/changeStatus")
    public Result<?> updateTaskStatus(@Validated @RequestBody StatusDTO taskStatus) {
        taskService.updateTaskStatus(taskStatus);
        return Result.success();
    }

    /**
     * 执行定时任务
     *
     * @param taskRun 运行定时任务
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation("执行定时任务")
    @SaCheckPermission("monitor:task:run")
    @PutMapping("/run")
    public Result<?> runTask(@RequestBody TaskRunDTO taskRun) {
        taskService.runTask(taskRun);
        return Result.success();
    }
}
