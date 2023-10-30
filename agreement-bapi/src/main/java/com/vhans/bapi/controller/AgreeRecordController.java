package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.vhans.bus.data.domain.AgreeRecord;
import com.vhans.bus.data.service.IAgreeRecordService;
import com.vhans.bus.subsidiary.model.dto.DeleteDTO;
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

import java.util.List;

/**
 * 记录控制器
 *
 * @author vhans
 **/
@Api(tags = "记录模块")
@RestController
@RequestMapping("/record")
public class AgreeRecordController extends BaseController {

    @Autowired
    private IAgreeRecordService recordService;

    @Autowired
    private LikeStrategyContext likeStrategyContext;

    /**
     * 添加记录
     *
     * @param record 记录信息
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "添加记录")
    @PostMapping("/add")
    public Result<?> addRecord(@Validated @RequestBody AgreeRecord record) {
        recordService.addRecord(record);
        return Result.success();
    }

    /**
     * 回收或恢复记录
     *
     * @param delete 逻辑删除
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "回收或恢复记录")
    @PutMapping("/recycle")
    public Result<?> updateRecordDelete(@Validated @RequestBody DeleteDTO delete) {
        recordService.updateRecordDelete(delete);
        return Result.success();
    }

    /**
     * 修改记录
     *
     * @param record 记录信息
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "修改记录")
    @PutMapping("/update")
    public Result<?> updateRecord(@Validated @RequestBody AgreeRecord record) {
        recordService.updateRecord(record);
        return Result.success();
    }

    /**
     * 获取记录信息
     *
     * @param recordId 记录id
     * @return {@link Result<AgreeRecord>} 记录信息
     */
    @SaCheckLogin
    @ApiOperation(value = "获取记录信息")
    @GetMapping("/info/{recordId}")
    public Result<AgreeRecord> editRecord(@PathVariable("recordId") Integer recordId) {
        return Result.success(recordService.getRecordInfo(recordId));
    }

    /**
     * 点赞记录
     *
     * @param recordId 记录id
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "点赞记录")
    @AccessLimit(seconds = 60, maxCount = 3)
    @PostMapping("/like/{recordId}")
    public Result<?> likeRecord(@PathVariable("recordId") Integer recordId) {
        likeStrategyContext.executeLikeStrategy(LikeTypeEnum.RECORD, recordId);
        return Result.success();
    }

    /**
     * 收藏记录
     *
     * @param recordId 记录id
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "收藏记录")
    @PostMapping("/collect/{recordId}")
    public Result<?> collectRecord(@PathVariable("recordId") Integer recordId) {
        recordService.collectRecord(recordId);
        return Result.success();
    }

    /**
     * 搜索记录
     *
     * @param keyword 关键字
     * @return {@link Result<SearchVO>} 记录搜索内容列表
     */
    @ApiOperation(value = "搜索记录")
    @GetMapping("/search/{keyword}")
    public Result<List<SearchVO>> listRecordsBySearch(@PathVariable String keyword) {
        return Result.success(recordService.listRecordsBySearch(keyword));
    }

    /**
     * 查看前台记录列表
     *
     * @param query 标题或者发起人昵称及文本类型
     * @return {@link AgreeRecord} 记录列表
     */
    @VisitLogger(value = "记录中心")
    @ApiOperation(value = "查看前台记录列表")
    @GetMapping("/list")
    public TableDataInfo<AgreeRecord> listAgreeRecord(AgreeRecord.Query query) {
        startPage();
        List<AgreeRecord> list = recordService.listHomeAgreeRecord(query);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 查看记录
     *
     * @param recordId 记录id
     * @return {@link Result<AgreeRecord>} 记录信息
     */
    @ApiOperation(value = "查看记录")
    @GetMapping("/look/{recordId}")
    public Result<AgreeRecord> lookRecord(@PathVariable("recordId") Integer recordId) {
        return Result.success(recordService.getRecordHomeById(recordId));
    }

    /**
     * 获取推荐记录
     *
     * @return {@link Result<AgreeRecord>} 推荐记录
     */
    @ApiOperation(value = "查看推荐记录")
    @GetMapping("/recommend")
    public TableDataInfo<AgreeRecord> listAgreeRecord() {
        startPage();
        List<AgreeRecord> list = recordService.listAgreeRecord();
        clearPage();
        return getDataTable(list);
    }

    /**
     * 查看记录总览
     *
     * @return {@link OverviewVO} 记录总览列表
     */
    @VisitLogger(value = "总览")
    @ApiOperation(value = "查看记录总览")
    @GetMapping("/overview")
    public TableDataInfo<OverviewVO> listRecordOverviewVO() {
        startPage();
        List<OverviewVO> list = recordService.listRecordOverviewVO();
        clearPage();
        return getDataTable(list);
    }

}