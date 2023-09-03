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
     * 批量保存记录点赞的用户
     *
     * @param userId 用户id
     * @param likeIdList 点赞id列表
     */
    void saveBatchUserLikeRecord(@Param("userId") Integer userId, List<Integer> likeIdList);

    /**
     * 批量保存题目点赞的用户
     *
     * @param userId 用户id
     * @param likeIdList 点赞id列表
     */
    void saveBatchUserLikeQuiz(@Param("userId") Integer userId, List<Integer> likeIdList);

    /**
     * 批量保存评论点赞的用户
     *
     * @param userId 用户id
     * @param likeIdList 点赞id列表
     */
    void saveBatchUserLikeComment(@Param("userId") Integer userId, List<Integer> likeIdList);
}
