package com.vhans.aapi.controller;

import com.vhans.bus.chat.domain.Msg;
import com.vhans.bus.chat.service.IMsgService;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户聊天信息Controller控制器
 *
 * @author vhans
 * @date 2023-05-21
 */
@Api(tags = "用户聊天信息模块")
@RestController
@RequestMapping("/msg")
public class MsgController extends BaseController {

    @Autowired
    private IMsgService msgService;

    /**
     * 查询用户聊天记录
     *
     * @param query 条件
     * @return {@link Msg} 聊天记录
     */
    @ApiOperation(value = "查询用户聊天信息列表")
//    @SaCheckPermission("chat:msg:list")
    @GetMapping("/list")
    public TableDataInfo list(Msg.Query query) {
        startPage();
        List<Msg> list = msgService.selectMsgList(query);
        return getDataTable(list);
    }

    /**
     * 批量删除用户聊天信息
     *
     * @param idList 需要删除的用户聊天信息主键列表
     * @return 结果
     */
    @ApiOperation(value = "批量删除用户聊天信息")
//    @SaCheckPermission("chat:msg:delete")
    @DeleteMapping("/delete")
    public Result<?> delete(@RequestBody List<Integer> idList) {
        return toAjax(msgService.deleteMsgByIdIdList(idList));
    }
}
