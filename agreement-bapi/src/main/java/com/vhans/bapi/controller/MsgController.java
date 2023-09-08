package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.vhans.bus.chat.domain.Msg;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import com.vhans.bus.chat.service.IMsgService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
     * 获取聊天列表
     *
     * @param friendId 好友id
     * @return {@link Msg} 聊天记录
     */
    @SaCheckLogin
    @ApiOperation(value = "获取聊天列表")
    @GetMapping("/list/{friendId}")
    public TableDataInfo<Msg> listMsg(@PathVariable Integer friendId) {
        startPage();
        List<Msg> list = msgService.getRecentMsg(friendId);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 标记消息已读
     *
     * @param friendId 好友id
     * @return {@link Result} 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "标记消息已读")
    @GetMapping("/read/{friendId}")
    public Result<?> readMsg(@PathVariable("friendId") Integer friendId) {
        msgService.batchReadMsg(friendId);
        return Result.success();
    }

    /**
     * 查询用户历史聊天记录
     *
     * @param query 条件
     * @return {@link Msg} 聊天记录
     */
    @SaCheckLogin
    @ApiOperation(value = "查询用户历史聊天记录")
    @GetMapping("/listHistory")
    public TableDataInfo<Msg> listHistory(Msg.Query query) {
        startPage();
        List<Msg> list = msgService.selectMsgList(query);
        clearPage();
        return getDataTable(list);
    }
}
