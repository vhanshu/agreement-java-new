package com.vhans.bus.system.service.impl;

import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.session.SaSessionCustomUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.system.domain.AdminRole;
import com.vhans.bus.system.domain.Role;
import com.vhans.bus.system.mapper.AdminRoleMapper;
import com.vhans.bus.system.mapper.RoleMapper;
import com.vhans.bus.system.mapper.RoleMenuMapper;
import com.vhans.bus.system.domain.dto.RoleStatusDTO;
import com.vhans.bus.system.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static com.vhans.core.constant.CommonConstant.ADMIN;
import static com.vhans.core.constant.CommonConstant.TRUE;

/**
 * 角色业务接口实现类
 *
 * @author vhans
 **/
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private AdminRoleMapper adminRoleMapper;

    @Autowired
    private RoleMenuMapper roleMenuMapper;

    @Override
    public List<Role> listRoleVO(Role.Query query) {
        // 查询角色列表
        return roleMapper.selectRoleList(query);
    }

    @Override
    public void addRole(Role role) {
        Assert.isFalse(roleMapper.exists(new LambdaQueryWrapper<Role>()
                        .eq(Role::getRoleName, role.getRoleName())),
                role.getRoleName() + "角色名已存在");
        // 添加新角色
        baseMapper.insert(role);
        // 添加角色菜单权限
        roleMenuMapper.insertRoleMenu(role.getId(), role.getMenuIdList());
    }

    @Override
    public void deleteRole(List<String> roleIdList) {
        Assert.isFalse(roleIdList.contains(ADMIN), "不允许删除管理员角色");
        // 角色是否已分配
        Long count = adminRoleMapper.selectCount(new LambdaQueryWrapper<AdminRole>().in(AdminRole::getRoleId, roleIdList));
        Assert.isFalse(count > 0, "角色已分配");
        // 删除角色
        roleMapper.deleteBatchIds(roleIdList);
        // 批量删除角色关联的菜单权限
        roleMenuMapper.deleteRoleMenu(roleIdList);
        // 删除Redis缓存中的菜单权限
        roleIdList.forEach(roleId -> {
            SaSession sessionById = SaSessionCustomUtil.getSessionById("role-" + roleId, false);
            Optional.ofNullable(sessionById).ifPresent(saSession -> saSession.delete(SaSession.PERMISSION_LIST));
        });
    }

    @Override
    public void updateRole(Role role, Integer isMenu) {
        Assert.isFalse(role.getId().equals(ADMIN) && role.getIsDisable().equals(TRUE),
                "不允许禁用超级管理员角色");
        Assert.isFalse(roleMapper.exists(new LambdaQueryWrapper<Role>()
                .eq(Role::getRoleName, role.getRoleName())
                .ne(Role::getId, role.getId())), "角色名已存在");
        // 更新角色信息
        roleMapper.updateById(role);
        if (Objects.equals(isMenu, TRUE)) {
            // 更新角色菜单权限
            // 1.先删除角色关联的菜单权限
            roleMenuMapper.deleteRoleMenuByRoleId(role.getId());
            // 2.再添加角色菜单权限
            roleMenuMapper.insertRoleMenu(role.getId(), role.getMenuIdList());
            // 3.删除Redis缓存中的菜单权限
            SaSession sessionById = SaSessionCustomUtil.getSessionById("role-" + role.getId(), false);
            Optional.ofNullable(sessionById).ifPresent(saSession -> saSession.delete("Permission_List"));
        }
    }

    @Override
    public void updateRoleStatus(RoleStatusDTO roleStatus) {
        Assert.isFalse(roleStatus.getId().equals(ADMIN), "不允许禁用超级管理员角色");
        // 更新角色状态
        roleMapper.updateById(Role.builder()
                .id(roleStatus.getId())
                .isDisable(roleStatus.getIsDisable())
                .build());
    }

    @Override
    public List<Integer> listRoleMenuTree(String roleId) {
        return roleMenuMapper.selectMenuByRoleId(roleId);
    }

}