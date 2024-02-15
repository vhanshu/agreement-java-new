package com.vhans.bus.chat.service;

import com.vhans.bus.chat.domain.Group;
import com.vhans.bus.chat.domain.Request;
import com.vhans.bus.chat.domain.vo.ConversationVO;

import java.util.List;

/**
 * 群组Service接口
 *
 * @author vhans
 * @date 2023-05-21
 */
public interface IGroupService {

    /**
     * 查询群组列表
     *
     * @param query 条件
     * @return 群组集合
     */
    List<Group> selectGroupList(Group.Query query);

    /**
     * 根据群中用户获取该用户所在的群组列表
     *
     * @param userId 用户id
     * @return 群组消息
     */
    List<Group> selectGroupByUserId(Integer userId);

    /**
     * 获取最近的群会话列表
     *
     * @param groupIds 群组ids
     * @return 群组列表
     */
    List<ConversationVO> getRecentConversation(List<Integer> groupIds);

    /**
     * 更新我的访群时间
     *
     * @param groupId 群聊id
     */
    void updateViewGroup(Integer groupId);

    /**
     * 修改群组
     *
     * @param group 群组
     * @return 影响行
     */
    int updateGroup(Group group);

    /**
     * 搜索群组
     *
     * @param groupName 群组名称
     * @return 群组列表
     */
    List<Group> searchGroup(String groupName);

    /**
     * 创建群组
     *
     * @param group 群组
     * @return 影响行
     */
    int createGroup(Group group);

    /**
     * 退出群聊
     *
     * @param userId 用户id
     * @param groupId 群组id
     * @return 影响行
     */
    int quitGroup(Integer userId, Integer groupId);

    /**
     * 删除群
     *
     * @param id 群组id
     */
    void deleteGroup(Integer id);

    /**
     * 获取我加入的群组列表
     *
     * @return 群组列表
     */
    List<Group> selectJoinGroupList();

    /**
     * 获取我的群组列表
     *
     * @return 群组列表
     */
    List<Group> selectMyGroupList();

    /**
     * 获取群组信息
     *
     * @param id 群组主键
     * @return 群组
     */
    Group selectGroupInfoById(Integer id);

    /**
     * 添加群成员
     *
     * @param request 请求信息
     * @return 影响行
     */
    int addNewGroupUser(Request request);

    /**
     * 获取群用户ids
     *
     * @param groupId 群id
     * @return 群用户ids
     */
    List<Integer> getUserIds(Integer groupId);

    /**
     * 获取群主id
     *
     * @param groupId 群id
     * @return 群主id
     */
    Integer getGroupMasterId(Integer groupId);

}
