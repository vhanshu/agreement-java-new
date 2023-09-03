package com.vhans.bus.chat.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.chat.domain.Friend;
import com.vhans.bus.chat.domain.vo.ConversationVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 好友Mapper接口
 *
 * @author vhans
 * @date 2023-05-21
 */
@Repository
public interface FriendMapper extends BaseMapper<Friend> {

    /**
     * 查询好友列表
     *
     * @param query 条件
     * @return 好友列表
     */
    List<Friend> selectFriendList(@Param("query") Friend.Query query);

    /**
     * 查询最近与好友的会话
     *
     * @param userId    用户id
     * @param friendIds 好友ids
     * @return 结果
     */
    List<ConversationVO> selectRecentConversation(@Param("userId") Integer userId, @Param("friendIds") List<Integer> friendIds);

}
