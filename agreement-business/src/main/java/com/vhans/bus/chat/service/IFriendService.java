package com.vhans.bus.chat.service;

import com.vhans.bus.chat.domain.Friend;
import com.vhans.bus.chat.domain.vo.ConversationVO;

import java.util.List;

/**
 * 好友Service接口
 *
 * @author vhans
 * @date 2023-05-21
 */
public interface IFriendService {

    /**
     * 查询好友列表(全部)
     *
     * @param query 条件
     * @return 好友集合
     */
    List<Friend> selectFriendList(Friend.Query query);

    /**
     * 查询用户的好友列表
     *
     * @return 好友集合
     */
    List<Friend> selectUserFriendList();

    /**
     * 获取最近好友会话
     *
     * @param friendIds 最近的好友ids
     * @return 与好友的会话
     */
    List<ConversationVO> getRecentConversation(List<Integer> friendIds);

    /**
     * 新增好友
     *
     * @param friend 好友
     * @return 影响行
     */
    int insertFriend(Friend friend);

    /**
     * 修改好友备注
     *
     * @param friendId     好友id
     * @param friendRemark 好友备注
     * @return 影响行
     */
    int updateFriendRemark(Integer friendId, String friendRemark);

    /**
     * 删除好友
     *
     * @param friendId 需要删除的好友id
     * @return 影响行
     */
    int deleteFriend(Integer friendId);
}
