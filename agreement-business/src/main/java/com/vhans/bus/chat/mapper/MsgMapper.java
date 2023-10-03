package com.vhans.bus.chat.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.chat.domain.Msg;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户聊天信息Mapper接口
 *
 * @author vhans
 * @date 2023-05-21
 */
@Repository
public interface MsgMapper extends BaseMapper<Msg> {

    /**
     * 查询用户聊天信息列表
     *
     * @param query 查询条件
     * @return 用户聊天信息集合
     */
    List<Msg> selectMsgList(@Param("query") Msg.Query query);

    /**
     * 查询好友之间的聊天记录
     *
     * @param userId 用户id
     * @param friendId 好友id
     * @return 聊天记录列表
     */
    List<Msg> selectRecentMsg(@Param("userId") Integer userId, @Param("friendId") Integer friendId);

}
