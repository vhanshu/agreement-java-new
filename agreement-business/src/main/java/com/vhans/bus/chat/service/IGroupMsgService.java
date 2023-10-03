package com.vhans.bus.chat.service;

import com.vhans.bus.chat.domain.GroupMsg;

import java.util.List;

/**
 * 群聊天信息Service接口
 * 
 * @author vhans
 * @date 2023-05-21
 */
public interface IGroupMsgService {

    /**
     * 查询群聊天信息列表
     * 
     * @param query 条件
     * @return 群聊天信息集合
     */
    List<GroupMsg> selectGroupMsgList(GroupMsg.Query query);

    /**
     * 获取群的聊天记录，通过群id来获取
     *
     * @param groupId 群id
     * @return 聊天记录
     */
    List<GroupMsg> getGroupMsgList(Integer groupId);

    /**
     * 新增群聊天信息
     *
     * @param groupMsg 群聊天信息
     * @return 影响行
     */
    int insertGroupMsg(GroupMsg groupMsg);

    /**
     * 删除群中指定用户聊天信息
     *
     * @param msgId 消息id
     */
    void deleteGroupMsg(Integer msgId);

    /**
     * 批量删除群聊天信息
     *
     * @param idList 需要删除的群聊天信息主键列表
     * @return 影响行
     */
    int deleteGroupMsgByIdIdList(List<Integer> idList);

    /**
     * 获取群的最后一条聊天记录
     *
     * @param groupId 群号
     * @return 最后一条聊天记录
     */
    GroupMsg getLastGroupMsg(Integer groupId);
}
