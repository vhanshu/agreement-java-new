package com.vhans.bus.system.service;


import com.vhans.bus.subsidiary.model.dto.LoginDTO;
import com.vhans.bus.system.domain.dto.UpdatePasswdDTO;
import com.vhans.bus.subsidiary.model.vo.OnlineVO;

import java.util.List;

/**
 * 后台登录业务接口
 *
 * @author vhans
 **/
public interface IAdminLoginService {

    /**
     * 发送验证码
     *
     * @param admin 管理员账号
     */
    void sendCode(String admin);

    /**
     * 管理员登录
     *
     * @param login 登录参数
     * @return token
     */
    String loginAdmin(LoginDTO login);

    /**
     * 根据验证码来更新密码
     *
     * @param passwdDTO 更新信息
     */
    void updatePasswd(UpdatePasswdDTO passwdDTO);

    /**
     * 查看在线人员
     *
     * @param name 名称
     * @param type 类型(1管理员 2用户)
     * @return 在线人员列表
     */
    List<OnlineVO> listOnline(String name, Integer type);
}
