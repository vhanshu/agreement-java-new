package com.vhans.aapi.controller;

import com.vhans.bus.chat.domain.Request;
import com.vhans.bus.chat.service.IRequestService;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 请求Controller控制器
 *
 * @author vhans
 * @date 2023-05-21
 */
@Api(tags = "请求模块")
@RestController
@RequestMapping("/request")
public class RequestController extends BaseController {

    @Autowired
    private IRequestService cRequestService;

    /**
     * 查询请求列表
     *
     * @param query 条件
     * @return {@link Request} 请求列表
     */
    @ApiOperation(value = "查询请求列表")
//    @SaCheckPermission("chat:request:list")
    @GetMapping("/list")
    public TableDataInfo list(Request.Query query) {
        startPage();
        List<Request> list = cRequestService.selectRequestList(query);
        return getDataTable(list);
    }

    /**
     * 获取请求详细信息
     *
     * @param id 请求id
     * @return {@link Result<Request>} 请求信息
     */
    @ApiOperation(value = "获取请求信息")
//    @SaCheckPermission("chat:request:info")
    @GetMapping(value = "/info/{id}")
    public Result<Request> getInfo(@PathVariable("id") Integer id) {
        return Result.success(cRequestService.selectRequestInfoById(id));
    }

    /**
     * 删除请求
     *
     * @param idList 需要删除的主键列表
     * @return 结果
     */
    @ApiOperation(value = "删除请求")
//    @SaCheckPermission("chat:request:delete")
    @DeleteMapping("/delete")
    public Result<?> delete(@RequestBody List<Integer> idList) {
        return toAjax(cRequestService.deleteRequestByIdIdList(idList));
    }
}
