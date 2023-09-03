package com.vhans.bus.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.system.domain.vo.AdminMenuVO;
import com.vhans.bus.system.domain.vo.MenuTree;
import com.vhans.bus.system.domain.Menu;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【菜单】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface MenuMapper extends BaseMapper<Menu> {
    /**
     * 根据角色id查询对应权限
     *
     * @param roleId id
     * @return 权限标识
     */
    List<String> selectPermissionByRoleId(@Param("roleId") String roleId);

    /**
     * 查询菜单列表
     *
     * @param query 查询条件
     * @return 菜单列表
     */
    List<Menu> selectMenuList(@Param("query") Menu.Query query);

    /**
     * 根据用户id查询用户菜单列表
     *
     * @param userId 用户id
     * @return 用户菜单列表
     */
    List<AdminMenuVO> selectMenuByAdminId(@Param("adminId") Integer userId);

    /**
     * 查询菜单下拉树
     *
     * @return 菜单下拉树
     */
    List<MenuTree> selectMenuTree();

    /**
     * 查询菜单选项树
     *
     * @return 菜单选项树
     */
    List<MenuTree> selectMenuOptions();

}
