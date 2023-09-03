package com.vhans.bus.chat.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.chat.domain.Request;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 好友请求Mapper接口
 *
 * @author vhans
 * @date 2023-05-21
 */
@Repository
public interface RequestMapper extends BaseMapper<Request> {

    /**
     * 查询好友请求列表
     *
     * @param query 查询条件
     * @return 好友请求集合
     */
    List<Request> selectRequestList(@Param("query") Request.Query query);

    /**
     * 查询用户的好友请求列表
     *
     * @param userId 查询条件
     * @return 好友请求集合
     */
    List<Request> selectUserRequestList(@Param("userId") Integer userId);

    /**
     * 查询我自己的请求列表
     *
     * @param userId 查询条件
     * @return 好友请求集合
     */
    List<Request> selectIRequestList(@Param("userId") Integer userId);
}
