package com.vhans.bus.chat.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.chat.domain.Friend;
import com.vhans.bus.chat.domain.Msg;
import com.vhans.bus.chat.domain.Request;
import com.vhans.bus.chat.domain.vo.ConversationVO;
import com.vhans.bus.chat.mapper.FriendMapper;
import com.vhans.bus.chat.mapper.MsgMapper;
import com.vhans.bus.chat.mapper.RequestMapper;
import com.vhans.bus.chat.service.IFriendService;
import com.vhans.bus.chat.service.IMsgService;
import com.vhans.bus.user.mapper.UserMapper;
import com.vhans.core.redis.RedisService;
import com.vhans.core.utils.data.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

import static com.vhans.core.constant.CommonConstant.FALSE;
import static com.vhans.core.constant.NumberConstant.ONE;
import static com.vhans.core.constant.NumberConstant.ZERO;
import static com.vhans.core.constant.RedisConstant.LATELY_FRIEND_IDS;

/**
 * 好友Service业务层处理
 *
 * @author vhans
 * @date 2023-05-21
 */
@Service("friendServiceImpl")
public class FriendServiceImpl implements IFriendService {

    @Autowired
    private FriendMapper friendMapper;

    @Autowired
    private MsgMapper msgMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RequestMapper requestMapper;

    @Autowired
    private IMsgService msgService;

    @Autowired
    private RedisService redisService;

    @Override
    public List<Friend> selectFriendList(Friend.Query query) {
        // 查询好友信息
        return friendMapper.selectFriendList(query);
    }

    @Override
    public List<Friend> selectUserFriendList() {
        Friend.Query query = new Friend.Query();
        query.setUserId(StpUtil.getLoginIdAsInt());
        return friendMapper.selectFriendList(query);
    }

    @Override
    public List<ConversationVO> getRecentConversation(List<Integer> friendIds) {
        // 获取用户id
        int userId = StpUtil.getLoginIdAsInt();
        List<Integer> redisIds = redisService.getObject(LATELY_FRIEND_IDS + userId);
        // 当用户换浏览器登录时,取上次ids
        if (StringUtils.isEmpty(friendIds) && StringUtils.isNotEmpty(redisIds)) {
            friendIds.addAll(redisIds);
        }
        // 查询最近给我发新消息的用户并加入最近列表
        List<Msg> newFriends = msgMapper.selectList(new LambdaQueryWrapper<Msg>()
                .select(Msg::getFromUid)
                .ne(Msg::getMsgType, ZERO)
                .eq(Msg::getIsRead, FALSE)
                .eq(Msg::getToUid, userId));
        if (StringUtils.isNotEmpty(newFriends)) {
            friendIds.addAll(newFriends.stream().map(Msg::getFromUid).filter(id -> !friendIds.contains(id)).toList());
        }
        if (StringUtils.isEmpty(friendIds)) {
            return new ArrayList<>();
        }
        // 将最新的用户ids加入Redis缓存
        redisService.setObject(LATELY_FRIEND_IDS + userId, friendIds);
        // 获取基本消息(好友id,备注,头像,时间)
        List<ConversationVO> conversations = friendMapper.selectRecentConversation(userId, friendIds);
        conversations.forEach(item -> {
            // 封装最近好友会话
            // 我现在是接收方
            Msg lastMsg = msgService.getLastMsg(userId, item.getId());
            int unread = Math.toIntExact(msgMapper.selectCount(new LambdaQueryWrapper<Msg>()
                    .eq(Msg::getIsRead, FALSE)
                    .eq(Msg::getFromUid, item.getId())
                    .eq(Msg::getToUid, userId)));
            item.setLastMsg(lastMsg.getContent());
            if (StringUtils.isNotNull(lastMsg.getCreateTime())) {
                item.setTime(lastMsg.getCreateTime());
            }
            item.setUnread(Math.min(unread, 99));
        });
        return conversations;
    }

    @Override
    @Transactional
    public int insertFriend(Friend friend) {
        Assert.isFalse(friendMapper.exists(new LambdaQueryWrapper<Friend>()
                .select(Friend::getId)
                .eq(Friend::getUserId, friend.getUserId())
                .eq(Friend::getFriendId, friend.getFriendId())), "已添加好友");
        // 添加好友
        int row = friendMapper.insert(friend);
        // 反向再添加一次
        // 默认对方的好友备注为昵称
        String nickname = userMapper.selectById(friend.getUserId()).getNickname();
        row += friendMapper.insert(Friend.builder()
                .friendRemark(nickname)
                .userId(friend.getFriendId())
                .friendId(friend.getUserId()).build());
        return row;
    }

    @Override
    public int updateFriendRemark(Integer friendId, String friendRemark) {
        return friendMapper.update(Friend.builder().friendRemark(friendRemark).build(), new LambdaQueryWrapper<Friend>()
                .eq(Friend::getFriendId, friendId)
                .eq(Friend::getUserId, StpUtil.getLoginIdAsInt()));
    }

    @Transactional
    @Override
    public int deleteFriend(Integer userId, Integer friendId) {
        // 默认UserId是执行删除者的ID，FriendId是要删除者的ID
        // 1.删除正反好友请求
        requestMapper.delete(new LambdaQueryWrapper<Request>()
                .eq(Request::getType, ONE)
                .eq(Request::getFromUid, userId)
                .eq(Request::getToUid, friendId)
                .or()
                .eq(Request::getFromUid, friendId)
                .eq(Request::getToUid, userId));
        // 2.正反收发者的信息均删除
        msgMapper.delete(new LambdaQueryWrapper<Msg>()
                .eq(Msg::getFromUid, userId)
                .eq(Msg::getToUid, friendId)
                .or()
                .eq(Msg::getFromUid, friendId)
                .eq(Msg::getToUid, userId));
        // 3.删除正反好友
        return friendMapper.delete(new LambdaQueryWrapper<Friend>()
                .eq(Friend::getUserId, userId)
                .eq(Friend::getFriendId, friendId)
                .or()
                .eq(Friend::getUserId, friendId)
                .eq(Friend::getFriendId, userId));
    }
}
