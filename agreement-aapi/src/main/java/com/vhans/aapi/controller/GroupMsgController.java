package com.vhans.aapi.controller;

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
     * 查询群聊天信息列表
     *
     * @param query 条件
     * @return {@link GroupMsg} 群聊天信息列表
     */
    @ApiOperation(value = "查询群聊天信息列表")
//    @SaCheckPermission("chat:groupMsg:list")
    @GetMapping("/list")
    public TableDataInfo<GroupMsg> list(GroupMsg.Query query) {
        startPage();
        List<GroupMsg> list = groupMsgService.selectGroupMsgList(query);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 删除群聊天信息
     *
     * @param idList 需要删除的群聊天信息主键列表
     * @return 结果
     */
    @ApiOperation(value = "删除群聊天信息")
//    @SaCheckPermission("chat:groupMsg:delete")
    @DeleteMapping("/delete")
    public Result<?> delete(@RequestBody List<Integer> idList) {
        return toAjax(groupMsgService.deleteGroupMsgByIdIdList(idList));
    }
}
