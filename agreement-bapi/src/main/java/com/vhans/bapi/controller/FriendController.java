package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.vhans.bus.chat.domain.Friend;
import com.vhans.bus.chat.domain.vo.ConversationVO;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.bus.chat.service.IFriendService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
     * 查询我的好友列表
     *
     * @return {@link Friend} 好友列表
     */
    @SaCheckLogin
    @ApiOperation(value = "查询我的好友列表")
    @GetMapping("/myList")
    public Result<List<Friend>> listFriend() {
        return Result.success(friendService.selectUserFriendList());
    }

    /**
     * 查询用户最近的好友会话列表
     *
     * @param friendIds 最近的好友ids
     * @return {@link ConversationVO} 好友会话列表
     */
    @SaCheckLogin
    @ApiOperation(value = "查询用户最近的好友会话列表")
    @PostMapping("/recentList")
    public Result<List<ConversationVO>> listRecentFriend(@RequestBody List<Integer> friendIds) {
        return Result.success(friendService.getRecentConversation(friendIds));
    }

    /**
     * 修改好友备注
     *
     * @param id           表id
     * @param friendRemark 好友备注
     * @return {@link Result} 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "修改好友备注")
    @PutMapping("/update/{id}/{friendRemark}")
    public Result<?> updateFriendRemark(@PathVariable("id") Integer id, @PathVariable("friendRemark") String friendRemark) {
        return toAjax(friendService.updateFriendRemark(id, friendRemark));
    }

    /**
     * 删除好友
     *
     * @param friendId 好友id
     * @return {@link Result} 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "删除好友")
    @PostMapping("/delete/{friendId}")
    public Result<?> deleteFriend(@PathVariable("friendId") Integer friendId) {
        return toAjax(friendService.deleteFriend(friendId));
    }
}
