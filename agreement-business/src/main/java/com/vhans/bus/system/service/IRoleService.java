package com.vhans.bus.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.system.domain.Role;
import com.vhans.bus.system.domain.dto.RoleStatusDTO;

import java.util.List;

/**
 * 角色业务接口
 *
 * @author vhans
 **/
public interface IRoleService extends IService<Role> {

    /**
     * 查看角色列表
     *
     * @param query 查询条件
     * @return 角色列表
     */
    List<Role> listRoleVO(Role.Query query);

    /**
     * 添加角色
     *
     * @param role 角色信息
     */
    void addRole(Role role);

    /**
     * 删除角色
     *
     * @param roleIdList 角色id集合
     */
    void deleteRole(List<String> roleIdList);

    /**
     * 修改角色
     *
     * @param role   角色信息
     * @param isMenu 是否修改菜单信息
     */
    void updateRole(Role role, Integer isMenu);

    /**
     * 修改角色状态
     *
     * @param roleStatus 角色状态
     */
    void updateRoleStatus(RoleStatusDTO roleStatus);

    /**
     * 查看角色的菜单权限
     *
     * @param roleId 角色id
     * @return 角色的菜单权限
     */
    List<Integer> listRoleMenuTree(String roleId);
}
