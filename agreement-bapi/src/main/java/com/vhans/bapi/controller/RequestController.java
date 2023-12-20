package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.vhans.bus.chat.domain.Request;
import com.vhans.bus.chat.service.IRequestService;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
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
    private IRequestService requestService;

    /**
     * 查询用户的好友请求列表
     *
     * @return {@link Request} 请求列表
     */
    @SaCheckLogin
    @ApiOperation(value = "查询用户的好友请求列表")
    @GetMapping("/listFriend")
    public Result<List<Request>> getFRequest() {
        return Result.success(requestService.selectUserRequestList());
    }

    /**
     * 查询我的请求列表
     *
     * @return {@link Request} 请求列表
     */
    @SaCheckLogin
    @ApiOperation(value = "查询我的请求列表")
    @GetMapping("/listMy")
    public Result<List<Request>> listIRequest() {
        return Result.success(requestService.selectIRequestList());
    }

    /**
     * 删除好友请求
     *
     * @param id 请求主键
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "删除好友请求")
    @DeleteMapping("/delete/{id}")
    public Result<?> deleteRequest(@PathVariable Integer id) {
        return toAjax(requestService.deleteRequestById(id));
    }
}
