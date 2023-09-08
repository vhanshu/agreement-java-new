package com.vhans.bus.chat.service;

import com.vhans.bus.chat.domain.Msg;

import java.util.List;

/**
 * 用户聊天信息Service接口
 *
 * @author vhans
 * @date 2023-05-21
 */
public interface IMsgService {

    /**
     * 查询用户聊天信息列表
     *
     * @param query 条件
     * @return 用户聊天信息集合
     */
    List<Msg> selectMsgList(Msg.Query query);

    /**
     * 获取好友之间的最后一条聊天记录
     *
     * @param userId   用户id
     * @param friendId 好友id
     * @return 最后一条聊天记录
     */
    Msg getLastMsg(Integer userId, Integer friendId);

    /**
     * 获取好友之间的聊天记录
     *
     * @param friendId 好友id
     * @return 聊天记录列表
     */
    List<Msg> getRecentMsg(Integer friendId);

    /**
     * 批量消息读取
     *
     * @param friendId 好友id
     */
    void batchReadMsg(Integer friendId);

    /**
     * 新增用户聊天信息
     *
     * @param msg 用户聊天信息
     * @return 影响行
     */
    int insertMsg(Msg msg);

    /**
     * 删除用户聊天信息
     *
     * @param msgId 消息id
     * @return 影响行
     */
    int deleteMsg(Integer msgId);

    /**
     * 批量删除用户聊天信息
     *
     * @param idList 需要删除的用户聊天信息主键列表
     * @return 影响行
     */
    int deleteMsgByIdIdList(List<Integer> idList);
}
