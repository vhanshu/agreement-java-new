package com.vhans.bus.system.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.system.domain.AdminRole;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 【管理员与角色关联】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface AdminRoleMapper extends BaseMapper<AdminRole> {
    /**
     * 根据管理员id查询角色id
     *
     * @param adminId 管理员id
     * @return 角色id
     */
    List<String> selectRoleIdByAdminId(@Param("adminId") Integer adminId);

    /**
     * 添加管理员角色
     *
     * @param adminId    管理员id
     * @param roleIdList 角色id集合
     */
    void insertAdminRole(@Param("adminId") Integer adminId, @Param("roleIdList") List<String> roleIdList);
}
