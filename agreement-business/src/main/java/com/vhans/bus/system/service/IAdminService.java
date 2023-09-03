package com.vhans.bus.system.service;

import com.vhans.bus.subsidiary.model.dto.DisableDTO;
import com.vhans.bus.subsidiary.model.dto.EmailDTO;
import com.vhans.bus.subsidiary.model.dto.PasswdDTO;
import com.vhans.bus.system.domain.vo.RouterVO;
import com.vhans.bus.system.domain.vo.AdminInfo;
import com.vhans.bus.system.domain.vo.AdminRoleVO;
import com.vhans.bus.subsidiary.model.vo.OnlineVO;
import com.vhans.bus.system.domain.Admin;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 【管理员】Service接口
 * 
 * @author vhans
 * @date 2023-04-10
 */
public interface IAdminService {
    /**
     * 获取登录管理员信息
     *
     * @return 管理员信息
     */
    AdminInfo getAdminInfo();

    /**
     * 获取登录管理员菜单
     *
     * @return 登录管理员菜单
     */
    List<RouterVO> getAdminMenu();

    /**
     * 查看管理员列表
     *
     * @param query 条件
     * @return 管理员列表
     */
    List<Admin> listAdmin(Admin.Query query);

    /**
     * 查看管理员角色选项
     *
     * @return 管理员角色选项
     */
    List<AdminRoleVO> listAdminRoleDTO();

    /**
     * 修改管理员信息
     *
     * @param admin 管理员信息
     * @param isRole 是否修改角色信息
     */
    void updateAdmin(Admin admin, Integer isRole);

    /**
     * 修改管理员状态
     *
     * @param disable 禁用信息
     */
    void updateAdminStatus(DisableDTO disable);

    /**
     * 查看在线管理员列表
     *
     * @param query 条件
     * @return 在线管理员列表
     */
    List<OnlineVO> listOnlineAdmin(Admin.Query query);

    /**
     * 下线管理员
     *
     * @param token 在线token
     */
    void kickOutAdmin(String token);

    /**
     * 修改管理员密码
     *
     * @param password 密码
     */
    void updateAdminPassword(PasswdDTO password);

    /**
     * 修改管理员邮箱
     *
     * @param email 邮箱信息
     */
    void updateAdminEmail(EmailDTO email);

    /**
     * 修改管理员头像
     *
     * @param file 头像
     * @return 头像链接
     */
    String updateAdminAvatar(MultipartFile file);
}
