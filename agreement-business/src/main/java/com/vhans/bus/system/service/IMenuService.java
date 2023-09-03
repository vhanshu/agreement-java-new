package com.vhans.bus.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.system.domain.vo.MenuTree;
import com.vhans.bus.system.domain.Menu;

import java.util.List;

/**
 * 菜单业务接口
 *
 * @author vhans
 **/
public interface IMenuService extends IService<Menu> {

    /**
     * 查看菜单列表
     *
     * @param query 查询条件
     * @return 菜单列表
     */
    List<Menu> listMenu(Menu.Query query);

    /**
     * 添加菜单
     *
     * @param menu 菜单
     */
    void addMenu(Menu menu);

    /**
     * 删除菜单
     *
     * @param menuId 菜单id
     */
    void deleteMenu(Integer menuId);

    /**
     * 修改菜单
     *
     * @param menu 菜单
     */
    void updateMenu(Menu menu);

    /**
     * 获取菜单下拉树
     *
     * @return 菜单下拉树
     */
    List<MenuTree> listMenuTree();

    /**
     * 获取菜单选项树
     *
     * @return 菜单选项树
     */
    List<MenuTree> listMenuOption();

    /**
     * 编辑菜单
     *
     * @param menuId 菜单id
     * @return 菜单
     */
    Menu editMenu(Integer menuId);
}
