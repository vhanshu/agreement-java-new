package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.vhans.bus.log.domain.ExceptionLog;
import com.vhans.bus.log.domain.OperationLog;
import com.vhans.bus.log.domain.TaskLog;
import com.vhans.bus.log.domain.VisitLog;
import com.vhans.bus.log.service.IExceptionLogService;
import com.vhans.bus.log.service.IOperationLogService;
import com.vhans.bus.log.service.ITaskLogService;
import com.vhans.bus.log.service.IVisitLogService;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 日志控制器
 *
 * @author vhans.db
 */
@Api(tags = "日志模块")
@RestController
@RequestMapping("/log")
public class LogController extends BaseController {

    @Autowired
    private IOperationLogService operationLogService;

    @Autowired
    private IExceptionLogService exceptionLogService;

    @Autowired
    private IVisitLogService visitLogService;

    @Autowired
    private ITaskLogService taskLogService;

    /**
     * 查看操作日志
     *
     * @param query 条件
     * @return {@link OperationLog} 操作日志
     */
    @ApiOperation(value = "查看操作日志")
    @SaCheckPermission("log:operation:list")
    @GetMapping("/operation/list")
    public TableDataInfo listOperationLogVO(OperationLog.Query query) {
        startPage();
        List<OperationLog> list = operationLogService.listOperationLog(query);
        return getDataTable(list);
    }

    /**
     * 删除操作日志
     *
     * @param logIdList 日志id集合
     * @return 结果
     */
    @ApiOperation(value = "删除操作日志")
    @SaCheckPermission("log:operation:delete")
    @DeleteMapping("/operation/delete")
    public Result<?> deleteOperationLog(@RequestBody List<Integer> logIdList) {
        operationLogService.removeByIds(logIdList);
        return Result.success();
    }

    /**
     * 查看异常日志
     *
     * @param query 条件
     * @return {@link OperationLog} 异常日志列表
     */
    @ApiOperation(value = "查看异常日志")
    @SaCheckPermission("log:exception:list")
    @GetMapping("/exception/list")
    public TableDataInfo listExceptionLog(ExceptionLog.Query query) {
        startPage();
        List<ExceptionLog> list = exceptionLogService.listExceptionLog(query);
        return getDataTable(list);
    }

    /**
     * 删除异常日志
     *
     * @param logIdList 日志id集合
     * @return 结果
     */
    @ApiOperation(value = "删除异常日志")
    @SaCheckPermission("log:exception:delete")
    @DeleteMapping("/exception/delete")
    public Result<?> deleteExceptionLog(@RequestBody List<Integer> logIdList) {
        exceptionLogService.removeByIds(logIdList);
        return Result.success();
    }

    /**
     * 查看访问日志
     *
     * @param query 条件
     * @return {@link VisitLog} 访问日志列表
     */
    @ApiOperation(value = "查看访问日志")
    @SaCheckPermission("log:visit:list")
    @GetMapping("/visit/list")
    public TableDataInfo listVisitLog(VisitLog.Query query) {
        startPage();
        List<VisitLog> list = visitLogService.listVisitLog(query);
        return getDataTable(list);
    }

    /**
     * 删除访问日志
     *
     * @param logIdList 日志id集合
     * @return 结果
     */
    @ApiOperation(value = "删除访问日志")
    @SaCheckPermission("log:visit:delete")
    @DeleteMapping("/visit/delete")
    public Result<?> deleteVisitLog(@RequestBody List<Integer> logIdList) {
        visitLogService.removeByIds(logIdList);
        return Result.success();
    }

    /**
     * 查看定时任务日志
     *
     * @param query 条件
     * @return {@link TaskLog} 定时任务日志
     */
    @ApiOperation("查看定时任务日志")
    @SaCheckPermission("log:task:list")
    @GetMapping("/taskLog/list")
    public TableDataInfo listTaskLog(TaskLog.Query query) {
        startPage();
        List<TaskLog> list = taskLogService.listTaskLog(query);
        return getDataTable(list);
    }

    /**
     * 删除定时任务日志
     *
     * @param logIdList 日志id集合
     * @return 结果
     */
    @ApiOperation("删除定时任务的日志")
    @SaCheckPermission("log:task:delete")
    @DeleteMapping("/taskLog/delete")
    public Result<?> deleteTaskLog(@RequestBody List<Integer> logIdList) {
        taskLogService.removeByIds(logIdList);
        return Result.success();
    }

    /**
     * 清空定时任务日志
     *
     * @return 结果
     */
    @ApiOperation("清空定时任务日志")
    @SaCheckPermission("log:task:clear")
    @DeleteMapping("/taskLog/clear")
    public Result<?> clearTaskLog() {
        taskLogService.clearTaskLog();
        return Result.success();
    }
}
