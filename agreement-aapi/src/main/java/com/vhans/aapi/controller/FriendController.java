package com.vhans.aapi.controller;

import com.vhans.bus.chat.domain.Friend;
import com.vhans.bus.chat.service.IFriendService;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 好友Controller控制器
 *
 * @author vhans
 * @date 2023-05-21
 */
@Api(tags = "好友模块")
@RestController
@RequestMapping("/friend")
public class FriendController extends BaseController {

    @Autowired
    private IFriendService friendService;

    /**
     * 查询好友列表
     *
     * @param query 条件
     * @return {@link Friend} 好友列表
     */
    @ApiOperation(value = "查询好友列表")
//    @SaCheckPermission("chat:friend:list")
    @GetMapping("/list")
    public TableDataInfo<Friend> list(Friend.Query query) {
        startPage();
        List<Friend> list = friendService.selectFriendList(query);
        clearPage();
        return getDataTable(list);
    }
}
