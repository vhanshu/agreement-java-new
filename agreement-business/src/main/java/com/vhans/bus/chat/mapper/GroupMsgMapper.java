package com.vhans.bus.chat.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.chat.domain.GroupMsg;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 群聊天信息Mapper接口
 *
 * @author vhans
 * @date 2023-05-21
 */
@Repository
public interface GroupMsgMapper extends BaseMapper<GroupMsg> {

    /**
     * 查询群聊天信息列表
     *
     * @param query 查询条件
     * @return 群聊天信息集合
     */
    List<GroupMsg> selectGroupMsgList(@Param("query") GroupMsg.Query query);

    /**
     * 查询群的聊天记录，通过群id来获取
     *
     * @param groupId 群id
     * @return 聊天记录
     */
    List<GroupMsg> selectRecentGroupMsg(@Param("groupId") Integer groupId);

}
