package com.vhans.bus.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.user.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【用户】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository("userMapper")
public interface UserMapper extends BaseMapper<User> {
    /**
     * 查询用户列表
     *
     * @param query 条件
     * @return 用户列表
     */
    List<User> listUser(@Param("query") User.Query query);

    /**
     * 更新用户约起分数
     *
     * @param userId 用户id
     * @param score  分数
     */
    void updateDegree(@Param("userId") Integer userId, @Param("score") Integer score);

    /**
     * 更新用户解疑分数
     *
     * @param userId 用户id
     * @param score  分数
     */
    void updateGrade(@Param("userId") Integer userId, @Param("score") Integer score);
}
