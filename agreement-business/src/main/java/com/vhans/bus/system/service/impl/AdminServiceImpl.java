package com.vhans.bus.system.service.impl;

import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.subsidiary.model.dto.DisableDTO;
import com.vhans.bus.subsidiary.model.dto.EmailDTO;
import com.vhans.bus.subsidiary.model.dto.PasswdDTO;
import com.vhans.bus.system.domain.vo.MetaVO;
import com.vhans.bus.system.domain.vo.RouterVO;
import com.vhans.bus.system.domain.vo.AdminInfo;
import com.vhans.bus.system.domain.vo.AdminMenuVO;
import com.vhans.bus.system.domain.vo.AdminRoleVO;
import com.vhans.bus.subsidiary.model.vo.OnlineVO;
import com.vhans.bus.system.domain.Admin;
import com.vhans.bus.system.domain.AdminRole;
import com.vhans.bus.system.mapper.AdminMapper;
import com.vhans.bus.system.mapper.AdminRoleMapper;
import com.vhans.bus.system.mapper.MenuMapper;
import com.vhans.bus.system.mapper.RoleMapper;
import com.vhans.bus.system.service.IAdminService;
import com.vhans.core.enums.FilePathEnum;
import com.vhans.core.redis.RedisService;
import com.vhans.core.strategy.context.FileStrategyContext;
import com.vhans.core.utils.SecurityUtils;
import com.vhans.core.utils.data.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.*;
import java.util.stream.Collectors;

import static com.vhans.core.constant.CommonConstant.*;
import static com.vhans.core.constant.RedisConstant.CODE_KEY_ADMIN;

/**
 * 【管理员】Service业务处理
 *
 * @author vhans
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements IAdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private AdminRoleMapper adminRoleMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private RedisService redisService;

    @Autowired
    private FileStrategyContext fileStrategyContext;

    @Override
    public AdminInfo getAdminInfo() {
        Integer adminId = StpUtil.getLoginIdAsInt();
        // 查询管理员信息
        Admin admin = adminMapper.selectOne(new LambdaQueryWrapper<Admin>()
                .select(Admin::getAvatar, Admin::getAdminName, Admin::getNickname)
                .eq(Admin::getId, adminId));
        // 查询管理员角色和权限
        List<String> roleIdList = StpUtil.getRoleList();
        List<String> permissions = StpUtil.getPermissionList();
        Assert.isTrue(StringUtils.isNotEmpty(permissions), "获取管理员权限失败");
        // 管理员权限列表
        List<String> permissionList = permissions.stream()
                .filter(StringUtils::isNotEmpty)
                .distinct()
                .collect(Collectors.toList());
        return AdminInfo.builder()
                .id(adminId)
                .avatar(admin.getAvatar())
                .adminName(admin.getAdminName())
                .nickname(admin.getNickname())
                .roleList(roleIdList)
                .permissionList(permissionList)
                .build();
    }

    @Override
    public List<RouterVO> getAdminMenu() {
        // 查询管理员菜单
        List<AdminMenuVO> adminMenuVOList = menuMapper.selectMenuByAdminId(StpUtil.getLoginIdAsInt());
        // 递归生成路由,parentId为0
        return recurRoutes(PARENT_ID, adminMenuVOList);
    }

    @Override
    public List<Admin> listAdmin(Admin.Query query) {
        List<Admin> admins = adminMapper.listAdmin(query);
        admins.forEach(admin -> {
            List<AdminRoleVO> adminRoleVOS = roleMapper.selectRoleObjListByAdminId(admin.getId());
            admin.setRoleList(adminRoleVOS);
        });
        return admins;
    }

    @Override
    public List<AdminRoleVO> listAdminRoleDTO() {
        // 查询所有角色列表
        return roleMapper.selectAdminRoleList();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateAdmin(Admin admin, Integer isRole) {
        // 更新管理员信息
        baseMapper.updateById(admin);
        if (Objects.equals(isRole, TRUE)) {
            // 更新管理员角色
            // 1.删除管理员角色
            adminRoleMapper.delete(new LambdaQueryWrapper<AdminRole>().eq(AdminRole::getAdminId, admin.getId()));
            // 2.重新添加管理员角色
            admin.getRoleList().forEach(item -> adminRoleMapper.insert(AdminRole.builder()
                    .adminId(admin.getId())
                    .roleId(item.getId()).build()));
            // 3.删除Redis缓存中的角色
            SaSession sessionByLoginId = StpUtil.getSessionByLoginId(admin.getId(), false);
            Optional.ofNullable(sessionByLoginId).ifPresent(saSession -> saSession.delete(SaSession.ROLE_LIST));
        }
    }

    @Override
    public void updateAdminStatus(DisableDTO disable) {
        // 更新管理员状态
        Admin newAdmin = Admin.builder()
                .id(disable.getId())
                .isDisable(disable.getIsDisable())
                .build();
        adminMapper.updateById(newAdmin);
        if (disable.getIsDisable().equals(TRUE)) {
            // 先踢下线
            StpUtil.logout(disable.getId());
            // 再封禁账号一天(86400秒)
            StpUtil.disable(disable.getId(), 86400);
        } else {
            // 解除封禁
            StpUtil.untieDisable(disable.getId());
        }
    }

    @Override
    public List<OnlineVO> listOnlineAdmin(Admin.Query query) {
        // 查询所有会话token
        List<String> tokenList = StpUtil.searchTokenSessionId("", 0, -1, false);
        return tokenList.stream()
                .map(token -> {
                    // 获取tokenSession
                    SaSession sessionBySessionId = StpUtil.getSessionBySessionId(token);
                    return (OnlineVO) sessionBySessionId.get(ONLINE_ADMIN);
                })
                .filter(item -> StringUtils.isEmpty(query.getAdminName()) ||
                        StringUtils.isNotNull(item) && item.getNickname().contains(query.getAdminName()))
                .sorted(Comparator.comparing(OnlineVO::getLoginTime).reversed())
                .collect(Collectors.toList());
    }

    @Override
    public void kickOutAdmin(String token) {
        StpUtil.logoutByTokenValue(token);
    }

    @Override
    public void updateAdminPassword(PasswdDTO password) {
        Integer adminId = StpUtil.getLoginIdAsInt();
        // 查询旧密码是否正确
        Admin admin = adminMapper.selectOne(new LambdaQueryWrapper<Admin>()
                .eq(Admin::getId, adminId));
        Assert.notNull(admin, "管理员不存在");
        Assert.isTrue(SecurityUtils.checkPw(admin.getPassword(), password.getOldPassword()), "旧密码校验不通过!");
        // 正确则修改密码
        String newPassword = SecurityUtils.sha256Encrypt(password.getNewPassword());
        admin.setPassword(newPassword);
        adminMapper.updateById(admin);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateAdminEmail(EmailDTO email) {
        verifyCode(email.getEmail(), email.getCode());
        adminMapper.updateById(Admin.builder()
                .id(StpUtil.getLoginIdAsInt())
                .email(email.getEmail())
                .build());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String updateAdminAvatar(MultipartFile file) {
        // 头像上传
        String avatar = fileStrategyContext.executeUploadStrategy(file, FilePathEnum.AVATAR.getPath());
        // 更新管理员头像
        adminMapper.updateById(Admin.builder()
                .id(StpUtil.getLoginIdAsInt())
                .avatar(avatar)
                .build());
        return avatar;
    }

    /**
     * 校验验证码
     *
     * @param adminName 管理员名
     * @param code      验证码
     */
    private void verifyCode(String adminName, String code) {
        String sysCode = redisService.getObject(CODE_KEY_ADMIN + adminName);
        Assert.notBlank(sysCode, "验证码未发送或已过期！");
        Assert.isTrue(sysCode.equals(code), "验证码错误，请重新输入！");
    }

    /**
     * 递归生成路由列表
     *
     * @param parentId 父级ID
     * @param menuList 菜单列表
     * @return 路由列表
     */
    private List<RouterVO> recurRoutes(Integer parentId, List<AdminMenuVO> menuList) {
        List<RouterVO> list = new ArrayList<>();
        Optional.ofNullable(menuList).ifPresent(menus -> menus.stream()
                .filter(menu -> menu.getParentId().equals(parentId))
                .forEach(menu -> {
                    RouterVO routeVO = new RouterVO();
                    routeVO.setName(menu.getMenuName());
                    routeVO.setPath(getRouterPath(menu));
                    routeVO.setComponent(getComponent(menu));
                    routeVO.setMeta(MetaVO.builder()
                            .title(menu.getMenuName())
                            .icon(menu.getIcon())
                            .hidden(menu.getIsHidden().equals(TRUE))
                            .build());
                    if (menu.getMenuType().equals(TYPE_DIR)) {
                        List<RouterVO> children = recurRoutes(menu.getId(), menuList);
                        if (CollectionUtil.isNotEmpty(children)) {
                            routeVO.setAlwaysShow(true);
                            routeVO.setRedirect("noRedirect");
                        }
                        routeVO.setChildren(children);
                    } else if (isMenuFrame(menu)) {
                        routeVO.setMeta(null);
                        List<RouterVO> childrenList = new ArrayList<>();
                        RouterVO children = new RouterVO();
                        children.setName(menu.getMenuName());
                        children.setPath(menu.getPath());
                        children.setComponent(menu.getComponent());
                        children.setMeta(MetaVO.builder()
                                .title(menu.getMenuName())
                                .icon(menu.getIcon())
                                .hidden(menu.getIsHidden().equals(TRUE))
                                .build());
                        childrenList.add(children);
                        routeVO.setChildren(childrenList);
                    }
                    list.add(routeVO);
                }));
        return list;
    }

    /**
     * 获取路由地址
     *
     * @param menu 菜单信息
     * @return 路由地址
     */
    public String getRouterPath(AdminMenuVO menu) {
        String routerPath = menu.getPath();
        // 一级目录
        if (menu.getParentId().equals(PARENT_ID) && TYPE_DIR.equals(menu.getMenuType())) {
            routerPath = "/" + menu.getPath();
        }
        // 一级菜单
        else if (isMenuFrame(menu)) {
            routerPath = "/";
        }
        return routerPath;
    }

    /**
     * 获取组件信息
     *
     * @param menu 菜单信息
     * @return 组件信息
     */
    public String getComponent(AdminMenuVO menu) {
        String component = LAYOUT;
        if (StringUtils.isNotEmpty(menu.getComponent()) && !isMenuFrame(menu)) {
            component = menu.getComponent();
        } else if (StringUtils.isEmpty(menu.getComponent()) && isParentView(menu)) {
            component = PARENT_VIEW;
        }
        return component;
    }

    /**
     * 是否为菜单内部跳转
     *
     * @param menu 菜单信息
     * @return 结果
     */
    public boolean isMenuFrame(AdminMenuVO menu) {
        return menu.getParentId().equals(PARENT_ID) && TYPE_MENU.equals(menu.getMenuType());
    }

    /**
     * 是否为parent_view组件
     *
     * @param menu 菜单信息
     * @return 结果
     */
    public boolean isParentView(AdminMenuVO menu) {
        return !menu.getParentId().equals(PARENT_ID) && TYPE_DIR.equals(menu.getMenuType());
    }
}
