package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.vhans.bus.chat.domain.Group;
import com.vhans.bus.chat.service.IGroupService;
import com.vhans.bus.chat.domain.vo.ConversationVO;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 群组Controller控制器
 *
 * @author vhans
 * @date 2023-05-21
 */
@Api(tags = "群组模块")
@RestController
@RequestMapping("/group")
public class GroupController extends BaseController {
    @Autowired
    private IGroupService groupService;

    /**
     * 获取我加入的群聊列表
     *
     * @return {@link Group} 群聊列表
     */
    @SaCheckLogin
    @ApiOperation(value = "获取我加入的群聊列表")
    @GetMapping("/listJoin")
    public Result<List<Group>> listJoin() {
        return Result.success(groupService.selectJoinGroupList());
    }

    /**
     * 获取我的群聊列表
     *
     * @return {@link Group} 群聊列表
     */
    @SaCheckLogin
    @ApiOperation(value = "获取我的群聊列表")
    @GetMapping("/listMy")
    public Result<List<Group>> listMy() {
        return Result.success(groupService.selectMyGroupList());
    }

    /**
     * 查询用户最近的群聊会话列表
     *
     * @param groupIds 最近的群聊ids
     * @return {@link ConversationVO} 最近的群聊列表
     */
    @SaCheckLogin
    @ApiOperation(value = "查询用户最近的群聊会话列表")
    @PostMapping("/recentList")
    public Result<List<ConversationVO>> listRecentGroup(@RequestBody List<Integer> groupIds) {
        return Result.success(groupService.getRecentConversation(groupIds));
    }

    /**
     * 更新我的访群时间
     *
     * @param groupId 群聊id
     * @return {@link Result} 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "更新用户的访群时间")
    @GetMapping("/view/{groupId}")
    public Result<?> viewGroup(@PathVariable("groupId") Integer groupId) {
        groupService.updateViewGroup(groupId);
        return Result.success();
    }

    /**
     * 获取群组详细信息
     *
     * @param groupId 群组id
     * @return {@link Result<Group>} 群组信息
     */
    @SaCheckLogin
    @ApiOperation(value = "获取群组详细信息")
    @GetMapping(value = "/info/{groupId}")
    public Result<Group> getInfo(@PathVariable("groupId") Integer groupId) {
        return Result.success(groupService.selectGroupInfoById(groupId));
    }

    /**
     * 搜索群聊
     *
     * @param groupName 群名称
     * @return {@link Group} 搜索的群组信息
     */
    @SaCheckLogin
    @ApiOperation(value = "搜索群聊")
    @PostMapping("/search/{groupName}")
    public Result<List<Group>> searchGroup(@PathVariable String groupName) {
        return Result.success(groupService.searchGroup(groupName));
    }

    /**
     * 创建群聊
     *
     * @param group 群组
     */
    @SaCheckLogin
    @ApiOperation(value = "创建群聊")
    @PostMapping("/create")
    public Result<?> createGroup(@Validated @RequestBody Group group) {
        return toAjax(groupService.createGroup(group));
    }

    /**
     * 退出群聊
     *
     * @param group 群组
     */
    @SaCheckLogin
    @ApiOperation(value = "退出群聊")
    @PostMapping("/quit")
    public Result<?> quitGroup(@RequestBody Group group) {
        groupService.quitGroup(group);
        return Result.success();
    }

    /**
     * 修改群组
     *
     * @param group 需要修改的群组
     */
    @SaCheckLogin
    @ApiOperation(value = "修改群组")
    @PutMapping("/update")
    public Result<?> update(@Validated @RequestBody Group group) {
        return toAjax(groupService.updateGroup(group));
    }

    /**
     * 删除群组
     *
     * @param id 需要删除的群组id
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "删除群组")
    @DeleteMapping("/delete/{id}")
    public Result<?> delete(@PathVariable("id") Integer id) {
        groupService.deleteGroup(id);
        return Result.success();
    }
}
