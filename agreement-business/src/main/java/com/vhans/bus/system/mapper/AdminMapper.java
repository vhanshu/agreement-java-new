package com.vhans.bus.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.system.domain.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【管理员】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface AdminMapper extends BaseMapper<Admin> {
    /**
     * 查询管理员列表
     *
     * @param query 条件
     * @return 管理员列表
     */
    List<Admin> listAdmin(@Param("query") Admin.Query query);
}
