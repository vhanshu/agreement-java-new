package com.vhans.bus.user.service;


import com.vhans.bus.subsidiary.model.dto.LoginDTO;
import com.vhans.bus.user.domain.dto.GitDTO;
import com.vhans.bus.user.domain.dto.QqLoginDTO;
import com.vhans.bus.user.domain.dto.RegisterDTO;

/**
 * 前台登录业务接口
 *
 * @author vhans
 **/
public interface IUserLoginService {

    /**
     * 发送验证码
     *
     * @param email 邮箱
     */
    void sendCode(String email);

    /**
     * 用户注册
     *
     * @param register 注册信息
     */
    void register(RegisterDTO register);

    /**
     * 用户登录
     *
     * @param login 登录参数
     * @return token
     */
    String login(LoginDTO login);

    /**
     * 忘记密码时根据验证码来更新密码
     *
     * @param passwdDTO 更新信息
     */
    void updatePasswd(RegisterDTO passwdDTO);

    /**
     * Gitee登录
     *
     * @param data 第三方code
     * @return Token
     */
    String giteeLogin(GitDTO data);

    /**
     * Github登录
     *
     * @param data 第三方code
     * @return Token
     */
    String githubLogin(GitDTO data);

    /**
     * QQ登录
     *
     * @param qqLogin QQ登录信息
     * @return token
     */
    String qqLogin(QqLoginDTO qqLogin);
}
