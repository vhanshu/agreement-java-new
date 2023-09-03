package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.vhans.bus.data.domain.AgreeRecord;
import com.vhans.bus.data.service.IAgreeRecordService;
import com.vhans.bus.subsidiary.model.dto.DeleteDTO;
import com.vhans.bus.subsidiary.model.dto.RecommendDTO;
import com.vhans.bus.subsidiary.model.dto.TopDTO;
import com.vhans.core.annotation.OptLogger;
import com.vhans.core.utils.excel.ExcelUtil;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

import static com.vhans.core.constant.OptTypeConstant.*;

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

    /**
     * 查看记录列表
     *
     * @param query 条件
     * @return {@link List<AgreeRecord>} 记录列表
     */
    @ApiOperation(value = "查看记录列表")
    @SaCheckPermission("agree:record:list")
    @GetMapping("/list")
    public TableDataInfo listAgreeRecord(AgreeRecord.Query query) {
        startPage();
        List<AgreeRecord> list = recordService.listAgreeRecord(query);
        return getDataTable(list);
    }

    /**
     * 添加记录
     *
     * @param record 记录信息
     * @return 结果
     */
    @OptLogger(value = ADD)
    @ApiOperation(value = "添加记录")
    @SaCheckPermission("agree:record:add")
    @PostMapping("/add")
    public Result<?> addRecord(@Validated @RequestBody AgreeRecord record) {
        recordService.addRecord(record);
        return Result.success();
    }

    /**
     * 删除记录
     *
     * @param recordIdList 记录id集合
     * @return 结果
     */
    @OptLogger(value = DELETE)
    @ApiOperation(value = "删除记录")
    @SaCheckPermission("agree:record:delete")
    @DeleteMapping("/delete")
    public Result<?> deleteRecord(@RequestBody List<Integer> recordIdList) {
        recordService.deleteRecord(recordIdList);
        return Result.success();
    }

    /**
     * 回收或恢复记录
     *
     * @param delete 逻辑删除
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "回收或恢复记录")
    @SaCheckPermission("agree:record:recycle")
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
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "修改记录")
    @SaCheckPermission("agree:record:update")
    @PutMapping("/update")
    public Result<?> updateRecord(@Validated @RequestBody AgreeRecord record) {
        recordService.updateRecord(record);
        return Result.success();
    }

    /**
     * 查看记录信息
     *
     * @param recordId 记录id
     * @return {@link Result<AgreeRecord>} 记录信息
     */
    @ApiOperation(value = "查看记录信息")
    @SaCheckPermission("agree:record:info")
    @GetMapping("/info/{recordId}")
    public Result<AgreeRecord> getRecordInfo(@PathVariable("recordId") Integer recordId) {
        return Result.success(recordService.getRecordInfo(recordId));
    }

    /**
     * 置顶记录
     *
     * @param top 置顶信息
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "置顶记录")
    @SaCheckPermission("agree:record:top")
    @PutMapping("/top")
    public Result<?> updateRecordTop(@Validated @RequestBody TopDTO top) {
        recordService.updateRecordTop(top);
        return Result.success();
    }

    /**
     * 推荐记录
     *
     * @param recommend 推荐信息
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "推荐记录")
    @SaCheckPermission("agree:record:recommend")
    @PutMapping("/recommend")
    public Result<?> updateRecordRecommend(@Validated @RequestBody RecommendDTO recommend) {
        recordService.updateRecordRecommend(recommend);
        return Result.success();
    }

    /**
     * 导出数据
     *
     * @param response 浏览器响应体
     * @param query    查询条件
     */
    @SaCheckPermission("agree:record:export")
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgreeRecord.Query query) {
        List<AgreeRecord> list = recordService.listAgreeRecord(query);
        ExcelUtil<AgreeRecord> util = new ExcelUtil<>(AgreeRecord.class);
        util.exportExcel(response, list, "记录数据");
    }

    /**
     * 导入数据
     *
     * @param file     excel文件
     * @param isUpdate 是否支持更新
     * @return 结果
     */
    @SaCheckPermission("agree:record:import")
    @PostMapping("/importData")
    public Result<?> importData(MultipartFile file, boolean isUpdate) throws Exception {
        ExcelUtil<AgreeRecord> util = new ExcelUtil<>(AgreeRecord.class);
        List<AgreeRecord> list = util.importExcel(file.getInputStream());
        return Result.success(recordService.importData(list, isUpdate));
    }
}