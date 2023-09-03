package com.vhans.bus.chat.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.chat.domain.GroupUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【群组与用户关联】Mapper接口
 *
 * @author vhans
 * @date 2023-05-21
 */
@Repository
public interface GroupUserMapper extends BaseMapper<GroupUser> {

    /**
     * 批量保存邀请入群的用户
     *
     * @param groupId     群组id
     * @param userIdList 用户id列表
     */
    void saveBatchGroupUserComment(@Param("groupId") Integer groupId, List<Integer> userIdList);
}
