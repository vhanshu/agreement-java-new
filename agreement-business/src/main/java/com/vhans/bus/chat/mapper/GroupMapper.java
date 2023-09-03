package com.vhans.bus.chat.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.chat.domain.Group;
import com.vhans.bus.chat.domain.vo.ConversationVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 群组Mapper接口
 *
 * @author vhans
 * @date 2023-05-21
 */
@Repository
public interface GroupMapper extends BaseMapper<Group> {

    /**
     * 根据群中用户获取该用户所在的群组信息
     *
     * @param userId 用户id
     * @return 群组消息
     */
    List<Group> selectGroupByUserId(@Param("userId") Integer userId);

    /**
     * 查询用户加入的群聊
     *
     * @param userId 用户id
     * @return 群聊列表
     */
    List<Group> getJoinGroupListByUserId(@Param("userId") Integer userId);

    /**
     * 根据名称查询群聊列表(用户未在群中)
     * @param groupName 群聊名称
     * @return 群聊列表
     */
    List<Group> selectSearchGroupList(@Param("groupName") String groupName, @Param("userId") Integer userId);

    /**
     * 查询最近的群聊会话
     *
     * @param groupIds  群聊ids
     * @param userId 用户id
     * @return 最近的群聊
     */
    List<ConversationVO> selectRecentConversation(@Param("userId") Integer userId, @Param("groupIds") List<Integer> groupIds);

}
