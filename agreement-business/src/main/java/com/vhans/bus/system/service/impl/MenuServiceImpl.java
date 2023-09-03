package com.vhans.bus.system.service.impl;

import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.system.domain.vo.MenuTree;
import com.vhans.bus.system.domain.Menu;
import com.vhans.bus.system.domain.RoleMenu;
import com.vhans.bus.system.mapper.MenuMapper;
import com.vhans.bus.system.mapper.RoleMenuMapper;
import com.vhans.bus.system.service.IMenuService;
import com.vhans.core.utils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import static com.vhans.core.constant.CommonConstant.PARENT_ID;

/**
 * 菜单业务接口实现类
 *
 * @author vhans
 **/
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private RoleMenuMapper roleMenuMapper;

    @Override
    public List<Menu> listMenu(Menu.Query query) {
        // 查询当前菜单列表
        List<Menu> menuVOList = menuMapper.selectMenuList(query);
        // 当前菜单id列表
        Set<Integer> menuIdList = menuVOList.stream()
                .map(Menu::getId)
                .collect(Collectors.toSet());
        return menuVOList.stream().map(menuVO -> {
            Integer parentId = menuVO.getParentId();
            // parentId不在当前菜单id列表，说明为父级菜单id，根据此id作为递归的开始条件节点
            if (!menuIdList.contains(parentId)) {
                menuIdList.add(parentId);
                return recurMenuList(parentId, menuVOList);
            }
            return new ArrayList<Menu>();
        }).collect(ArrayList::new, ArrayList::addAll, ArrayList::addAll);
    }

    @Override
    public void addMenu(Menu menu) {
        // 名称是否存在
        Menu existMenu = menuMapper.selectOne(new LambdaQueryWrapper<Menu>()
                .select(Menu::getId)
                .eq(Menu::getMenuName, menu.getMenuName()));
        Assert.isNull(existMenu, menu.getMenuName() + "菜单已存在");
        Menu newMenu = BeanUtils.copyBean(menu, Menu.class);
        baseMapper.insert(newMenu);
    }

    @Override
    public void deleteMenu(Integer menuId) {
        // 菜单下是否存在子菜单
        Long menuCount = menuMapper.selectCount(new LambdaQueryWrapper<Menu>()
                .eq(Menu::getParentId, menuId));
        Assert.isFalse(menuCount > 0, "存在子菜单");
        // 菜单是否已分配
        Long roleCount = roleMenuMapper.selectCount(new LambdaQueryWrapper<RoleMenu>()
                .eq(RoleMenu::getMenuId, menuId));
        Assert.isFalse(roleCount > 0, "菜单已分配");
        // 删除菜单
        menuMapper.deleteById(menuId);
    }

    @Override
    public void updateMenu(Menu menu) {
        // 名称是否存在
        Long count = menuMapper.selectCount(new LambdaQueryWrapper<Menu>()
                .ne(Menu::getId, menu.getId())
                .eq(Menu::getMenuName, menu.getMenuName()));
        Assert.isTrue(count == 0, "菜单已存在");
        Menu newMenu = BeanUtils.copyBean(menu, Menu.class);
        baseMapper.update(newMenu, new LambdaUpdateWrapper<Menu>()
                .eq(Menu::getId, menu.getId()));
    }

    @Override
    public List<MenuTree> listMenuTree() {
        List<MenuTree> menuTreeList = menuMapper.selectMenuTree();
        return recurMenuTreeList(PARENT_ID, menuTreeList);
    }

    @Override
    public List<MenuTree> listMenuOption() {
        List<MenuTree> menuOptionList = menuMapper.selectMenuOptions();
        return recurMenuTreeList(PARENT_ID, menuOptionList);
    }

    @Override
    public Menu editMenu(Integer menuId) {
        return menuMapper.selectById(menuId);
    }

    /**
     * 递归生成菜单列表
     *
     * @param parentId 父菜单id
     * @param menuList 菜单列表
     * @return 菜单列表
     */
    private List<Menu> recurMenuList(Integer parentId, List<Menu> menuList) {
        return menuList.stream()
                .filter(item -> item.getParentId().equals(parentId))
                .peek(item -> item.setChildren(recurMenuList(item.getId(), menuList)))
                .collect(Collectors.toList());
    }

    /**
     * 递归生成菜单树结构
     *
     * @param parentId     父菜单id
     * @param menuTreeList 菜单树列表
     * @return 菜单列表
     */
    private List<MenuTree> recurMenuTreeList(Integer parentId, List<MenuTree> menuTreeList) {
        return menuTreeList.stream()
                .filter(item -> item.getParentId().equals(parentId))
                .peek(item -> item.setChildren(recurMenuTreeList(item.getId(), menuTreeList)))
                .collect(Collectors.toList());
    }

}