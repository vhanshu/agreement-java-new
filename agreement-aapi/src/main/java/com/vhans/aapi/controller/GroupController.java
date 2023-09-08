package com.vhans.aapi.controller;

import com.vhans.bus.chat.domain.Group;
import com.vhans.bus.chat.service.IGroupService;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
     * 查询群组列表
     *
     * @param query 条件
     * @return {@link Group} 题目列表
     */
    @ApiOperation(value = "查询群组列表")
//    @SaCheckPermission("chat:group:list")
    @GetMapping("/list")
    public TableDataInfo<Group> list(Group.Query query) {
        startPage();
        List<Group> list = groupService.selectGroupList(query);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 获取群组详细信息
     *
     * @param id 群组id
     * @return {@link Result<Group>} 群组信息
     */
    @ApiOperation(value = "获取群组详细信息")
//    @SaCheckPermission("chat:group:query")
    @GetMapping(value = "/info/{id}")
    public Result<Group> getInfo(@PathVariable("id") Integer id) {
        return Result.success(groupService.selectGroupInfoById(id));
    }
}
