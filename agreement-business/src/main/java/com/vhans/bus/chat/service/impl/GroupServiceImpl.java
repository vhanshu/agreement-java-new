package com.vhans.bus.chat.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.chat.domain.*;
import com.vhans.bus.chat.domain.vo.ConversationVO;
import com.vhans.bus.chat.domain.vo.GroupUserIntroVO;
import com.vhans.bus.chat.mapper.FriendMapper;
import com.vhans.bus.chat.mapper.GroupMapper;
import com.vhans.bus.chat.mapper.GroupMsgMapper;
import com.vhans.bus.chat.mapper.GroupUserMapper;
import com.vhans.bus.chat.service.IGroupMsgService;
import com.vhans.bus.chat.service.IGroupService;
import com.vhans.bus.transmit.config.NettyWsHandler;
import com.vhans.bus.user.domain.User;
import com.vhans.bus.user.mapper.UserMapper;
import com.vhans.core.redis.RedisService;
import com.vhans.core.utils.data.StringUtils;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import static com.vhans.core.constant.CommonConstant.FALSE;
import static com.vhans.core.constant.NumberConstant.*;
import static com.vhans.core.constant.PushTypeConstant.PUSH_GROUP_CREATE;
import static com.vhans.core.constant.RedisConstant.LATELY_GROUP_IDS;
import static com.vhans.core.enums.ZoneEnum.SHANGHAI;

/**
 * 群组Service业务层处理
 *
 * @author vhans
 * @date 2023-05-21
 */
@Service("groupServiceImpl")
public class GroupServiceImpl implements IGroupService {

    @Autowired
    private GroupMapper groupMapper;

    @Autowired
    private GroupUserMapper groupUserMapper;

    @Autowired
    private FriendMapper friendMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private GroupMsgMapper groupMsgMapper;

    @Autowired
    private IGroupMsgService groupMsgService;

    @Autowired
    private RedisService redisService;


    @Override
    public List<Group> selectGroupList(Group.Query query) {
        // 查询群组信息
        return groupMapper.selectList(new LambdaQueryWrapper<Group>()
                .eq(StringUtils.isNotNull(query.getName()), Group::getName, query.getName())
                .eq(StringUtils.isNotNull(query.getIsDelete()), Group::getIsDelete, query.getIsDelete()));
    }

    @Override
    public List<ConversationVO> getRecentConversation(List<Integer> groupIds) {
        //用户id
        int userId = StpUtil.getLoginIdAsInt();
        List<Integer> redisIds = redisService.getObject(LATELY_GROUP_IDS + userId);
        // 当用户换浏览器登录时,取上次ids
        if (StringUtils.isEmpty(groupIds) && StringUtils.isNotEmpty(redisIds)) {
            groupIds.addAll(redisIds);
        }
        if (StringUtils.isEmpty(groupIds)) {
            return new ArrayList<>();
        }
        // 将最新的群聊ids加入Redis缓存
        redisService.setObject(LATELY_GROUP_IDS + userId, groupIds);
        // 获取基本消息(id,名称,图像,时间,状态)
        List<ConversationVO> conversations = groupMapper.selectRecentConversation(userId, groupIds);
        conversations.forEach(item -> {
            // 封装最近群聊会话
            item.setName(item.getName() + "群");
            // 我现在是接收方
            GroupMsg lastMsg = groupMsgService.getLastGroupMsg(item.getId());
            // 未读消息数
            int unread = getUnread(item.getId(), userId);
            item.setLastMsg(lastMsg.getContent());
            if (StringUtils.isNotNull(lastMsg.getCreateTime())) {
                item.setTime(lastMsg.getCreateTime());
            }
            item.setUnread(Math.min(unread, 99));
        });
        return conversations;
    }

    @Override
    public void updateViewGroup(Integer groupId) {
        // 获取访问时间
        LocalDateTime viewTime = LocalDateTime.now(ZoneId.of(SHANGHAI.getZone()));
        groupUserMapper.update(GroupUser.builder().viewTime(viewTime).build(), new LambdaQueryWrapper<GroupUser>()
                .eq(GroupUser::getGroupId, groupId)
                .eq(GroupUser::getUserId, StpUtil.getLoginIdAsInt()));
    }

    @Override
    public int updateGroup(Group group) {
        Group oldGroup = groupMapper.selectById(group.getId());
        if (!oldGroup.getMasterId().equals(group.getMasterId())) {
            groupMsgMapper.insert(GroupMsg.builder()
                    .msgType(ZERO)
                    .fromUid(group.getMasterId())
                    .toUid(group.getId())
                    .content("群主之位发生改变").build());
        }
        if (!oldGroup.getName().equals(group.getName())) {
            groupMsgMapper.insert(GroupMsg.builder()
                    .msgType(ZERO)
                    .fromUid(group.getMasterId())
                    .toUid(group.getId())
                    .content("群主将群聊名称改为：" + group.getName()).build());
        }
        if (!oldGroup.getRemark().equals(group.getRemark())) {
            groupMsgMapper.insert(GroupMsg.builder()
                    .msgType(ZERO)
                    .fromUid(group.getMasterId())
                    .toUid(group.getId())
                    .content(group.getRemark()).build());
        }
        if (!oldGroup.getImg().equals(group.getImg())) {
            groupMsgMapper.insert(GroupMsg.builder()
                    .msgType(ZERO)
                    .fromUid(group.getMasterId())
                    .toUid(group.getId())
                    .content("群主更新了群缩略图").build());
        }
        return groupMapper.updateById(group);
    }

    @Transactional
    @Override
    public List<Group> searchGroup(String groupName) {
        // 当前用户id
        int userId = StpUtil.getLoginIdAsInt();
        // 搜索群信息
        List<Group> groups = groupMapper.selectSearchGroupList(groupName, userId);
        // 设置群用户数
        groups.forEach(item -> item.setUserNumber(Math.toIntExact(groupUserMapper.selectCount(
                new LambdaQueryWrapper<GroupUser>().eq(GroupUser::getGroupId, item.getId())))));
        return groups;

    }

    @Transactional
    @Override
    public int createGroup(Group group) {
        Assert.isFalse(groupMapper.exists(new LambdaQueryWrapper<Group>()
                .eq(Group::getName, group.getName())), "群名称已被使用");
        int userId = StpUtil.getLoginIdAsInt();
        // 1.设置群主:群中默认称呼为用户昵称
        group.setMasterId(userId);
        // 2.新增群聊并绑定群主
        int row = groupMapper.insert(group);
        groupUserMapper.insert(GroupUser.builder()
                .groupId(group.getId())
                .userId(userId)
                .username(userMapper.selectById(userId).getNickname()).build());
        // 3.设置最初的群用户:群中默认称呼为用户昵称
        group.getUserList().forEach(item ->
                groupUserMapper.insert(GroupUser.builder()
                        .groupId(group.getId())
                        .userId(item.getId())
                        .username(item.getNickname()).build()));
        // 4.添加一条建群消息
        GroupMsg groupMsg = GroupMsg.builder()
                .msgType(ZERO)
                .fromUid(group.getMasterId())
                .toUid(group.getId())
                .content(group.getRemark()).build();
        groupMsgMapper.insert(groupMsg);
        // 5.异步给每个群用户推送群创建信息
        CompletableFuture.runAsync(() -> {
            groupMsg.setContent("您已被拉入新创建的群【" + group.getName() + "】");
            group.getUserList().forEach(item -> NettyWsHandler.pushInfo(PUSH_GROUP_CREATE, JSONUtil.toJsonStr(groupMsg), item.getId()));
        });
        return row;
    }

    @Transactional
    @Override
    public int quitGroup(Integer userId, Integer groupId) {
        return groupUserMapper.delete(new LambdaQueryWrapper<GroupUser>()
                .eq(GroupUser::getGroupId, groupId)
                .eq(GroupUser::getUserId, userId));
    }

    @Transactional
    @Override
    public void deleteGroup(Integer id) {
        // 1、先删除该群中所有信息
        groupMsgMapper.delete(new LambdaQueryWrapper<GroupMsg>()
                .eq(GroupMsg::getToUid, id));
        // 2、再删除该群的所有成员
        groupUserMapper.delete(new LambdaQueryWrapper<GroupUser>()
                .eq(GroupUser::getGroupId, id));
        // 3、最后更新群状态为解散
        groupMapper.updateById(Group.builder().isDelete(FALSE).id(id).build());
    }

    @Override
    public List<Group> selectJoinGroupList() {
        List<Group> list = groupMapper.getJoinGroupListByUserId(StpUtil.getLoginIdAsInt());
        list.forEach(item -> item.setUserNumber(Math.toIntExact(
                groupUserMapper.selectCount(new LambdaQueryWrapper<GroupUser>()
                        .eq(GroupUser::getGroupId, item.getId())))));
        return list;
    }

    @Override
    public List<Group> selectMyGroupList() {
        List<Group> list = groupMapper.selectList(new LambdaQueryWrapper<Group>()
                .eq(Group::getMasterId, StpUtil.getLoginIdAsInt()));
        list.forEach(item -> item.setUserNumber(Math.toIntExact(
                groupUserMapper.selectCount(new LambdaQueryWrapper<GroupUser>()
                        .eq(GroupUser::getGroupId, item.getId())))));
        return list;
    }

    @Override
    public Group selectGroupInfoById(Integer id) {
        // 查询群组信息
        Group group = groupMapper.selectById(id);
        Assert.notNull(group, "没有该群组");
        return postUserIntro(group);
    }

    @Override
    public List<Group> selectGroupByUserId(Integer userId) {
        return groupMapper.selectGroupByUserId(userId);
    }

    @Transactional
    @Override
    public int addNewGroupUser(Request request) {
        GroupUser groupUser = groupUserMapper.selectOne(new LambdaQueryWrapper<GroupUser>()
                .eq(GroupUser::getGroupId, request.getGroupId())
                .eq(GroupUser::getUserId, request.getFromUid()));
        // 已存在该群用户
        if(StringUtils.isNotNull(groupUser)){
            return 0;
        }
        // 1.增加群用户
        int row = groupUserMapper.insert(GroupUser.builder()
                .groupId(request.getGroupId())
                .userId(request.getFromUid())
                .username(request.getNickname()).build()); // 默认用户在群中的称呼为昵称
        // 2.添加一条群消息
        GroupMsg groupMsg = GroupMsg.builder()
                .msgType(ONE)
                .fromUid(request.getFromUid())
                .toUid(request.getGroupId())
                .content("【" + request.getNickname() + "】加入群,热烈欢迎🎉🎉🎉").build();
        groupMsgMapper.insert(groupMsg);
        return row;
    }

    @Override
    public List<Integer> getUserIds(Integer groupId) {
        return groupUserMapper.selectList(new LambdaQueryWrapper<GroupUser>()
                .select(GroupUser::getUserId)
                .eq(GroupUser::getGroupId, groupId)).stream().map(GroupUser::getUserId).toList();
    }

    @Override
    public Integer getGroupMasterId(Integer groupId) {
        return groupMapper.selectById(groupId).getMasterId();
    }

    /**
     * 扩展群组信息,加上群用户简介列表
     *
     * @param groupInfo 要扩展的群组信息
     * @return 扩展的群组信息
     */
    @NotNull
    private Group postUserIntro(Group groupInfo) {
        int userId = StpUtil.getLoginIdAsInt();
        List<GroupUserIntroVO> groupUserList = groupUserMapper.selectList(new LambdaQueryWrapper<GroupUser>()
                .select(GroupUser::getUserId)
                .eq(GroupUser::getGroupId, groupInfo.getId())).stream().map(item -> {
            User user = userMapper.selectById(item.getUserId());
            boolean isFriend = friendMapper.exists(new LambdaQueryWrapper<Friend>()
                    .eq(Friend::getUserId, userId)
                    .eq(Friend::getFriendId, user.getId()));
            int type = isFriend ? TWO : (user.getId() == userId ? THREE : (groupInfo.getMasterId() == userId ? FOUR : ONE));
            return GroupUserIntroVO.builder()
                    .id(user.getId())
                    .avatar(user.getAvatar())
                    .nickname(user.getNickname())
                    .intro(user.getIntro())
                    .type(type).build();
        }).toList();
        groupInfo.setUserList(groupUserList);
        return groupInfo;
    }

    /**
     * 获取未读消息数
     *
     * @param groupId 群组id
     * @param userId  用户id
     * @return 未读消息数
     */
    private Integer getUnread(Integer groupId, Integer userId) {
        GroupUser groupUser = groupUserMapper.selectOne(new LambdaQueryWrapper<GroupUser>()
                .select(GroupUser::getViewTime)
                .eq(GroupUser::getGroupId, groupId)
                .eq(GroupUser::getUserId, userId));
        if (StringUtils.isNotNull(groupUser)) {
            return Math.toIntExact(groupMsgMapper.selectCount(new LambdaQueryWrapper<GroupMsg>()
                    .eq(GroupMsg::getToUid, groupId)
                    .ne(GroupMsg::getFromUid, userId)
                    .gt(GroupMsg::getCreateTime, groupUser.getViewTime())));
        }
        return 0;
    }
}
