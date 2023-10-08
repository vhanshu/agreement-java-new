package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.vhans.bus.chat.domain.GroupMsg;
import com.vhans.bus.chat.service.IGroupMsgService;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 群聊天信息Controller控制器
 *
 * @author vhans
 * @date 2023-05-21
 */
@Api(tags = "群聊天信息模块")
@RestController
@RequestMapping("/groupMsg")
public class GroupMsgController extends BaseController {

    @Autowired
    private IGroupMsgService groupMsgService;

    /**
     * 获取群消息列表
     *
     * @param groupId 群id
     * @return {@link GroupMsg} 群消息列表
     */
    @SaCheckLogin
    @ApiOperation(value = "获取群消息列表")
    @GetMapping("/list/{groupId}")
    public TableDataInfo<GroupMsg> listGroup(@PathVariable Integer groupId) {
        startPage();
        List<GroupMsg> list = groupMsgService.getGroupMsgList(groupId);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 查询群历史消息
     *
     * @param query 条件
     * @return {@link GroupMsg} 群聊天信息
     */
    @SaCheckLogin
    @ApiOperation(value = "查询群历史消息")
    @GetMapping(value = "/listHistory")
    public TableDataInfo<GroupMsg> listHistory(GroupMsg.Query query) {
        startPage();
        List<GroupMsg> list = groupMsgService.selectGroupMsgList(query);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 撤回聊天信息
     *
     * @param msgId 消息id
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "撤回聊天信息")
    @DeleteMapping("/delete/{msgId}")
    public Result<?> deleteMsg(@PathVariable("msgId") Integer msgId) {
        return toAjax(groupMsgService.deleteGroupMsg(msgId));
    }
}
