package com.vhans.bus.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.user.domain.UserLike;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【用户与点赞关联】Mapper接口
 *
 * @author vhans
 * @date 2023-04-15
 */
@Repository
public interface UserLikeMapper extends BaseMapper<UserLike> {
    /**
     * 批量保存用户的点赞信息
     *
     * @param userId     用户id
     * @param type       类型(1记录 2题目 3评论 4题目作答)
     * @param likeIdList 点赞id列表
     */
    void saveBatchUserLike(@Param("userId") Integer userId, @Param("type") Integer type, List<Integer> likeIdList);
}
