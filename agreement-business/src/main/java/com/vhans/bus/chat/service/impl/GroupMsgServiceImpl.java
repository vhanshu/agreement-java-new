package com.vhans.bus.chat.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.chat.domain.GroupMsg;
import com.vhans.bus.chat.domain.GroupUser;
import com.vhans.bus.chat.mapper.GroupMsgMapper;
import com.vhans.bus.chat.mapper.GroupUserMapper;
import com.vhans.bus.chat.service.IGroupMsgService;
import com.vhans.bus.user.domain.User;
import com.vhans.bus.user.mapper.UserMapper;
import com.vhans.core.utils.data.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.vhans.core.constant.NumberConstant.*;

/**
 * 群聊天信息Service业务层处理
 *
 * @author vhans
 * @date 2023-05-21
 */
@Service("groupMsgServiceImpl")
public class GroupMsgServiceImpl implements IGroupMsgService {

    @Autowired
    private GroupMsgMapper groupMsgMapper;

    @Autowired
    private GroupUserMapper groupUserMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<GroupMsg> selectGroupMsgList(GroupMsg.Query query) {
        return groupMsgMapper.selectGroupMsgList(query);
    }

    @Override
    public List<GroupMsg> getGroupMsgList(Integer groupId) {
        return groupMsgMapper.selectRecentGroupMsg(groupId);
    }

    @Override
    public int insertGroupMsg(GroupMsg groupMsg) {
        return groupMsgMapper.insert(groupMsg);
    }

    @Override
    public int deleteGroupMsg(Integer msgId) {
        return groupMsgMapper.deleteById(msgId);
    }

    @Override
    public int deleteGroupMsgByIdIdList(List<Integer> idList) {
        // 删除群聊天信息
        return groupMsgMapper.deleteBatchIds(idList);
    }

    @Override
    public GroupMsg getLastGroupMsg(Integer groupId) {
        // 查询最后一条消息
        GroupMsg groupMsg = groupMsgMapper.selectOne(new LambdaQueryWrapper<GroupMsg>()
                .select(GroupMsg::getFromUid, GroupMsg::getToUid,
                        GroupMsg::getMsgType, GroupMsg::getContent, GroupMsg::getCreateTime)
                .eq(GroupMsg::getToUid, groupId)
                .orderByDesc(GroupMsg::getCreateTime)
                .last("limit 1"));
        if (StringUtils.isNull(groupMsg)) {
            return GroupMsg.builder().content("初创约盟,打个招呼吧").build();
        } else {
            String username;
            // 查询最后一条消息的发送人
            GroupUser groupUser = groupUserMapper.selectOne(new LambdaQueryWrapper<GroupUser>()
                    .select(GroupUser::getUsername)
                    .eq(GroupUser::getUserId, groupMsg.getFromUid())
                    .eq(GroupUser::getGroupId, groupId));
            if (StringUtils.isNull(groupUser)) {
                //不存在表示该用户已被移出群
                User user = userMapper.selectById(groupMsg.getFromUid());
                username = user.getNickname() + "(已出群)";
            } else {
                username = groupUser.getUsername();
            }
            switch (groupMsg.getMsgType()) {
                case TWO -> groupMsg.setContent(username + ":[文件]");
                case THREE -> groupMsg.setContent(username + ":[图片]");
                case FOUR -> groupMsg.setContent(username + ":[视频]");
                case FIVE -> groupMsg.setContent(username + ":[语音]");
                default -> groupMsg.setContent(username + ":" + groupMsg.getContent());
            }
            return groupMsg;
        }
    }
}
