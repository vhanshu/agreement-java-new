package com.vhans.bus.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.user.domain.UserCollect;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 【用户与收藏关联】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface UserCollectMapper extends BaseMapper<UserCollect> {
    /**
     * 保存记录收藏的用户
     *
     * @param userId    用户id
     * @param type      收藏类型
     * @param collectId 收藏id
     */
    void saveUserCollect(@Param("userId") Integer userId, @Param("type") Integer type, @Param("collectId") Integer collectId);
}
