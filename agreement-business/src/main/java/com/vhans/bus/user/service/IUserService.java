package com.vhans.bus.user.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.agree.domain.vo.AgreeVO;
import com.vhans.bus.data.domain.AgreeRecord;
import com.vhans.bus.data.domain.Comment;
import com.vhans.bus.data.domain.Quiz;
import com.vhans.bus.data.domain.QuizAnswer;
import com.vhans.bus.subsidiary.model.dto.DisableDTO;
import com.vhans.bus.subsidiary.model.dto.EmailDTO;
import com.vhans.bus.subsidiary.model.dto.PasswdDTO;
import com.vhans.bus.user.domain.User;
import com.vhans.bus.user.domain.dto.UserAgreeDTO;
import com.vhans.bus.user.domain.vo.UserInfoVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 用户业务接口
 *
 * @author vhans
 **/
public interface IUserService extends IService<User> {

    /**
     * 获取用户列表
     *
     * @param query 条件
     * @return 用户列表
     */
    List<User> listUser(User.Query query);

    /**
     * 获取登录用户信息
     *
     * @return 用户信息
     */
    UserInfoVO getUserInfo();

    /**
     * 获取登录用户发布的约起
     *
     * @return 发布的约起
     */
    List<AgreeVO> getIssueAgree(UserAgreeDTO userAgree);

    /**
     * 获取登录用户参与的约起
     *
     * @return 参与的约起
     */
    List<AgreeVO> getTakeAgree(UserAgreeDTO userAgree);

    /**
     * 获取登录用户发表的记录
     *
     * @return 发表的记录
     */
    List<AgreeRecord> getIssueRecord(UserAgreeDTO userAgree);

    /**
     * 获取登录用户发表的题目
     *
     * @return 发表的题目
     */
    List<Quiz> getIssueQuiz(UserAgreeDTO userAgree);

    /**
     * 获取登录用户发表的题目作答
     *
     * @return 发表的题目作答
     */
    List<QuizAnswer> getIssueAnswer(UserAgreeDTO userAgree);

    /**
     * 获取登录用户发表的评论
     *
     * @return 发表的评论
     */
    List<Comment> getIssueComment(UserAgreeDTO userAgree);

    /**
     * 获取登录用户收藏的记录
     *
     * @return 收藏的记录
     */
    List<AgreeRecord> getCollectRecord(UserAgreeDTO userAgree);

    /**
     * 获取登录用户收藏的题目
     *
     * @return 收藏的题目
     */
    List<Quiz> getCollectQuiz(UserAgreeDTO userAgree);

    /**
     * 获取登录用户点赞的记录
     *
     * @return 点赞的记录
     */
    List<AgreeRecord> getLikeRecord(UserAgreeDTO userAgree);

    /**
     * 获取登录用户点赞的题目
     *
     * @return 点赞的题目
     */
    List<Quiz> getLikeQuiz(UserAgreeDTO userAgree);

    /**
     * 获取登录用户点赞的题目作答
     *
     * @return 点赞的题目作答
     */
    List<QuizAnswer> getLikeAnswer(UserAgreeDTO userAgree);

    /**
     * 获取登录用户点赞的评论
     *
     * @return 点赞的评论
     */
    List<Comment> getLikeComment(UserAgreeDTO userAgree);

    /**
     * 修改用户
     *
     * @param user 用户信息
     */
    void updateUser(User user);

    /**
     * 修改用户状态
     *
     * @param disable 禁用信息
     */
    void updateUserStatus(DisableDTO disable);

    /**
     * 下线用户
     *
     * @param token 在线token
     */
    void kickOutUser(String token);

    /**
     * 修改用户邮箱
     *
     * @param email 邮箱信息
     */
    void updateUserEmail(EmailDTO email);

    /**
     * 修改用户头像
     *
     * @param file 头像
     * @return 头像链接
     */
    String updateUserAvatar(MultipartFile file);

    /**
     * 修改用户密码
     *
     * @param passwd 密码
     */
    void updatePassword(PasswdDTO passwd);

    /**
     * 重置用户密码为123456
     *
     * @param userId 用户ID
     */
    void resetPassword(Integer userId);
}
