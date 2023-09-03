package com.vhans.bus.chat.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.chat.domain.GroupMsg;
import com.vhans.bus.chat.mapper.GroupMsgMapper;
import com.vhans.bus.chat.service.IGroupMsgService;
import com.vhans.core.utils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public List<GroupMsg> selectGroupMsgList(GroupMsg.Query query) {
        return groupMsgMapper.selectGroupMsgList(query);
    }

    @Override
    public GroupMsg insertGroupMsg(GroupMsg groupMsg) {
        // 要添加的群聊天信息
        GroupMsg newGroupMsg = BeanUtils.copyBean(groupMsg, GroupMsg.class);
        groupMsgMapper.insert(newGroupMsg);
        return newGroupMsg;
    }

    @Override
    public void deleteGroupMsg(Integer msgId) {
        groupMsgMapper.deleteById(msgId);
    }

    @Override
    public int deleteGroupMsgByIdIdList(List<Integer> idList) {
        // 删除群聊天信息
        return groupMsgMapper.deleteBatchIds(idList);
    }

    @Override
    public GroupMsg getLastGroupMsg(Integer groupId) {
        // 查询最后一条消息
        return groupMsgMapper.selectOne(new LambdaQueryWrapper<GroupMsg>()
                .select(GroupMsg::getId, GroupMsg::getGroupId, GroupMsg::getMsgType, GroupMsg::getContent,
                        GroupMsg::getCreateTime, GroupMsg::getUserId)
                .eq(GroupMsg::getGroupId, groupId)
                .orderByDesc(GroupMsg::getCreateTime));
    }

    @Override
    public List<GroupMsg> getRecentGroupMsg(Integer groupId) {
        return groupMsgMapper.selectList(new LambdaQueryWrapper<GroupMsg>()
                .eq(GroupMsg::getGroupId, groupId));
    }
}
