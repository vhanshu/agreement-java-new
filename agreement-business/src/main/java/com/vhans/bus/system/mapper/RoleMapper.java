package com.vhans.bus.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.system.domain.Role;
import com.vhans.bus.system.domain.vo.AdminRoleVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【角色】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface RoleMapper extends BaseMapper<Role> {
    /**
     * 根据管理员id查询管理员角色
     *
     * @param adminId 管理员id
     * @return 角色
     */
    List<String> selectRoleListByAdminId(@Param("adminId") Object adminId);

    /**
     * 根据管理员id查询管理员角色对象
     *
     * @param adminId 管理员id
     * @return 角色
     */
    List<AdminRoleVO> selectRoleObjListByAdminId(@Param("adminId") Object adminId);

    /**
     * 查询后台角色数量
     *
     * @param query 查询条件
     * @return 后台角色数量
     */
    Long selectRoleCount(@Param("query") Role.Query query);

    /**
     * 查询后台角色列表
     *
     * @param query 查询条件
     * @return 后台角色列表
     */
    List<Role> selectRoleList(@Param("query") Role.Query query);

    /**
     * 查询管理员角色选项
     *
     * @return 管理员角色选项
     */
    List<AdminRoleVO> selectAdminRoleList();
}
