package com.vhans.bus.chat.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.chat.domain.GroupMsg;
import com.vhans.bus.chat.domain.GroupUser;
import com.vhans.bus.chat.mapper.GroupMsgMapper;
import com.vhans.bus.chat.mapper.GroupUserMapper;
import com.vhans.bus.chat.service.IGroupMsgService;
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
        int userId = StpUtil.getLoginIdAsInt();
        GroupMsg groupMsg = groupMsgMapper.selectById(msgId);
        if(groupMsg.getFromUid().equals(userId)) {
            // 是自己的信息
            return groupMsgMapper.deleteById(msgId);
        } else {
            return 0;
        }
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
            // 查询发送人称呼
            String username = groupUserMapper.selectOne(new LambdaQueryWrapper<GroupUser>()
                    .select(GroupUser::getUsername)
                    .eq(GroupUser::getUserId, groupMsg.getFromUid())
                    .eq(GroupUser::getGroupId, groupId)).getUsername();
            switch (groupMsg.getMsgType()) {
                case THREE -> groupMsg.setContent("[图片]");
                case FOUR -> groupMsg.setContent("[视频]");
                case FIVE -> groupMsg.setContent("[语音]");
            }
            groupMsg.setContent(username + ":" + groupMsg.getContent());
            return groupMsg;
        }
    }
}
