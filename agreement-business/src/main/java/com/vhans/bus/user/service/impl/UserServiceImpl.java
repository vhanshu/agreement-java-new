package com.vhans.bus.user.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.agree.domain.dto.AgreeQueryDTO;
import com.vhans.bus.agree.domain.vo.AgreeVO;
import com.vhans.bus.agree.service.IAgreeService;
import com.vhans.bus.chat.domain.Friend;
import com.vhans.bus.chat.mapper.FriendMapper;
import com.vhans.bus.data.domain.AgreeRecord;
import com.vhans.bus.data.domain.Comment;
import com.vhans.bus.data.domain.Quiz;
import com.vhans.bus.data.domain.QuizAnswer;
import com.vhans.bus.data.service.IAgreeRecordService;
import com.vhans.bus.data.service.ICommentService;
import com.vhans.bus.data.service.IQuizAnswerService;
import com.vhans.bus.data.service.IQuizService;
import com.vhans.bus.subsidiary.model.dto.DisableDTO;
import com.vhans.bus.subsidiary.model.dto.EmailDTO;
import com.vhans.bus.subsidiary.model.dto.PasswdDTO;
import com.vhans.bus.user.domain.User;
import com.vhans.bus.user.domain.UserAgree;
import com.vhans.bus.user.domain.UserCollect;
import com.vhans.bus.user.domain.UserLike;
import com.vhans.bus.user.domain.dto.UserAgreeDTO;
import com.vhans.bus.user.domain.vo.UserInfoVO;
import com.vhans.bus.user.mapper.UserAgreeMapper;
import com.vhans.bus.user.mapper.UserCollectMapper;
import com.vhans.bus.user.mapper.UserLikeMapper;
import com.vhans.bus.user.mapper.UserMapper;
import com.vhans.bus.user.service.IUserService;
import com.vhans.core.enums.FilePathEnum;
import com.vhans.core.redis.RedisService;
import com.vhans.core.strategy.context.UploadStrategyContext;
import com.vhans.core.utils.SecurityUtils;
import com.vhans.core.utils.data.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

import static com.vhans.core.constant.CommonConstant.FALSE;
import static com.vhans.core.constant.CommonConstant.TRUE;
import static com.vhans.core.constant.RedisConstant.*;
import static com.vhans.core.enums.CommentTypeEnum.*;

/**
 * 用户业务接口实现类
 *
 * @author vhans.db
 * @date 2022/12/05 15:32
 **/
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserAgreeMapper userAgreeMapper;

    @Autowired
    private UserCollectMapper userCollectMapper;

    @Autowired
    private UserLikeMapper userLikeMapper;

    @Autowired
    private FriendMapper friendMapper;

    @Autowired
    private IAgreeService agreeService;

    @Autowired
    private IAgreeRecordService recordService;

    @Autowired
    private IQuizService quizService;

    @Autowired
    private IQuizAnswerService quizAnswerService;

    @Autowired
    private ICommentService commentService;

    @Autowired
    private RedisService redisService;

    @Autowired
    private UploadStrategyContext uploadStrategyContext;

    @Override
    public List<User> listUser(User.Query query) {
        return userMapper.listUser(query);
    }

    @Override
    public UserInfoVO getLoginInfo() {
        int userId = StpUtil.getLoginIdAsInt();
        User user = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .select(User::getAvatar, User::getNickname, User::getEmail, User::getSex, User::getUsername,
                        User::getIntro, User::getLoginType, User::getIpSource, User::getLoginTime)
                .eq(User::getId, userId));
        // 点赞记录
        List<Integer> recordIds = getLikeRecordIds(userId);
        // 点赞题目
        List<Integer> quizIds = getLikeQuizIds(userId);
        // 点赞题目作答
        List<Integer> answerIds = getLikeAnswerIds(userId);
        // 点赞评论
        List<Integer> commentIds = getLikeCommentIds(userId);
        // 收藏记录
        List<Integer> recordCIds = getCollectIds(userId, RECORD.getType());
        // 收藏题目
        List<Integer> quizCIds = getCollectIds(userId, QUIZ.getType());
        // 用户参与的约起记录
        List<UserAgree> myIssueAgrees = getIssueAgreeIds(userId);
        return UserInfoVO.builder()
                .id(userId)
                .avatar(user.getAvatar())
                .nickname(user.getNickname())
                .username(user.getUsername())
                .email(user.getEmail())
                .intro(user.getIntro())
                .sex(user.getSex())
                .recordLikeSet(recordIds)
                .quizLikeSet(quizIds)
                .answerLikeSet(answerIds)
                .commentLikeSet(commentIds)
                .recordCollectSet(recordCIds)
                .quizCollectSet(quizCIds)
                .agreeIssueSet(myIssueAgrees)
                .loginType(user.getLoginType())
                .ipSource(user.getIpSource())
                .loginTime(user.getLoginTime())
                .build();
    }

    @Override
    public User getUserById(Integer id) {
        int userId = StpUtil.getLoginIdAsInt();
        User user = userMapper.selectById(id);
        if (id != userId) {
            user.setPassword("");
            user.setLoginType(0);
            user.setIpSource(null);
            user.setIpAddress("");
            Friend friend = friendMapper.selectOne(new LambdaQueryWrapper<Friend>()
                    .select(Friend::getFriendRemark)
                    .eq(Friend::getUserId, userId)
                    .eq(Friend::getFriendId, id));
            if (StringUtils.isNotNull(friend)) {
                user.setFriendRemark(friend.getFriendRemark());
            } else {
                user.setLoginTime(null);
            }
        }
        return user;
    }

    @Override
    public List<AgreeVO> getIssueAgree(Integer userId, UserAgreeDTO userAgree) {
        return agreeService.listAgreementVO(AgreeQueryDTO.builder()
                .type(userAgree.getType())
                .title(userAgree.getKeyword())
                .userId(userId)
                .build());
    }

    @Override
    public List<AgreeVO> getTakeAgree(Integer userId, UserAgreeDTO userAgree) {
        return agreeService.listAgreementVO(AgreeQueryDTO.builder()
                .type(userAgree.getType())
                .title(userAgree.getKeyword())
                .relateUid(userId)
                .build());
    }

    @Override
    public List<AgreeRecord> getIssueRecord(Integer userId, UserAgreeDTO userAgree) {
        AgreeRecord.Query query = new AgreeRecord.Query();
        query.setIsDelete(FALSE);
        query.setUserId(userId);
        query.setTitle(userAgree.getKeyword());
        query.setType(userAgree.getType());
        return recordService.listAgreeRecord(query);
    }

    @Override
    public List<Quiz> getIssueQuiz(Integer userId, UserAgreeDTO userAgree) {
        Quiz.Query query = new Quiz.Query();
        query.setUserId(userId);
        query.setTitle(userAgree.getKeyword());
        return quizService.listQuiz(query);
    }

    @Override
    public List<QuizAnswer> getIssueAnswer(Integer userId, UserAgreeDTO userAgree) {
        QuizAnswer.Query query = new QuizAnswer.Query();
        query.setUserId(userId);
        query.setKeyword(userAgree.getKeyword());
        return quizAnswerService.selectAnswerList(query);
    }

    @Override
    public List<Comment> getIssueComment(Integer userId, UserAgreeDTO userAgree) {
        Comment.Query query = new Comment.Query();
        query.setFromUid(userId);
        query.setTitle(userAgree.getKeyword());
        return commentService.listCommentVO(query);
    }

    @Override
    public List<AgreeRecord> getCollectRecord(Integer userId, UserAgreeDTO userAgree) {
        AgreeRecord.Query query = new AgreeRecord.Query();
        query.setIsDelete(FALSE);
        query.setCollectUid(userId);
        query.setTitle(userAgree.getKeyword());
        query.setType(userAgree.getType());
        return recordService.listAgreeRecord(query);
    }

    @Override
    public List<Quiz> getCollectQuiz(Integer userId, UserAgreeDTO userAgree) {
        Quiz.Query query = new Quiz.Query();
        query.setCollectUid(userId);
        query.setTitle(userAgree.getKeyword());
        return quizService.listQuiz(query);
    }

    @Override
    public List<AgreeRecord> getLikeRecord(Integer userId, UserAgreeDTO userAgree) {
        userAgree.setType(userAgree.getType() == null ? 0 : userAgree.getType());
        if (userAgree.getFlag()) {
            return redisService.getSet(USER_RECORD_LIKE + userId).stream().map(id ->
                    recordService.getRecordInfo(Integer.valueOf(id.toString()))).peek(item -> item.setContent("")).filter(item -> {
                if (StringUtils.isNotEmpty(userAgree.getKeyword()) && userAgree.getType() != 0) {
                    return (item.getTitle().contains(userAgree.getKeyword()) ||
                            item.getNickname().contains(userAgree.getKeyword())) &&
                            userAgree.getType().equals(item.getType());
                } else if (StringUtils.isNotEmpty(userAgree.getKeyword())) {
                    return item.getTitle().contains(userAgree.getKeyword()) ||
                            item.getNickname().contains(userAgree.getKeyword());
                } else if (userAgree.getType() != 0) {
                    return userAgree.getType().equals(item.getType());
                } else {
                    return true;
                }
            }).toList();
        } else {
            AgreeRecord.Query query = new AgreeRecord.Query();
            query.setTitle(userAgree.getKeyword());
            query.setType(userAgree.getType());
            query.setLikeUid(userId);
            return recordService.listAgreeRecord(query);
        }
    }

    @Override
    public List<Quiz> getLikeQuiz(Integer userId, UserAgreeDTO userAgree) {
        userAgree.setType(userAgree.getType() == null ? 0 : userAgree.getType());
        if (userAgree.getFlag()) {
            return redisService.getSet(USER_QUIZ_LIKE + userId).stream().map(id ->
                    quizService.getQuizInfo(Integer.valueOf(id.toString()))).peek(item -> item.setContent("")).filter(item -> {
                if (StringUtils.isNotEmpty(userAgree.getKeyword())) {
                    return item.getTitle().contains(userAgree.getKeyword()) ||
                            item.getNickname().contains(userAgree.getKeyword());
                } else {
                    return true;
                }
            }).toList();
        } else {
            Quiz.Query query = new Quiz.Query();
            query.setTitle(userAgree.getKeyword());
            query.setLikeUid(userId);
            return quizService.listQuiz(query);
        }
    }

    @Override
    public List<QuizAnswer> getLikeAnswer(Integer userId, UserAgreeDTO userAgree) {
        userAgree.setType(userAgree.getType() == null ? 0 : userAgree.getType());
        if (userAgree.getFlag()) {
            return redisService.getSet(USER_ANSWER_LIKE + userId).stream().map(id ->
                    quizAnswerService.selectAnswerById(Integer.valueOf(id.toString()))).peek(item -> item.setContent(item.getContent().length() >= 200 ? (item.getContent().substring(0, 200) + "...") : item.getContent())).filter(item -> {
                if (StringUtils.isNotEmpty(userAgree.getKeyword())) {
                    return item.getTitle().contains(userAgree.getKeyword()) ||
                            item.getNickname().contains(userAgree.getKeyword());
                } else {
                    return true;
                }
            }).toList();
        } else {
            QuizAnswer.Query query = new QuizAnswer.Query();
            query.setKeyword(userAgree.getKeyword());
            query.setLikeUid(userId);
            return quizAnswerService.selectAnswerList(query);
        }
    }

    @Override
    public List<Comment> getLikeComment(Integer userId, UserAgreeDTO userAgree) {
        userAgree.setType(userAgree.getType() == null ? 0 : userAgree.getType());
        if (userAgree.getFlag()) {
            return redisService.getSet(USER_COMMENT_LIKE + userId).stream().map(id ->
                    commentService.getCommentInfo(Integer.valueOf(id.toString()))).filter(item -> {
                if (StringUtils.isNotEmpty(userAgree.getKeyword()) && userAgree.getType() != 0) {
                    return (item.getTitle().contains(userAgree.getKeyword()) ||
                            item.getFromNickname().contains(userAgree.getKeyword())) &&
                            userAgree.getType().equals(item.getType());
                } else if (StringUtils.isNotEmpty(userAgree.getKeyword())) {
                    return item.getTitle().contains(userAgree.getKeyword()) ||
                            item.getFromNickname().contains(userAgree.getKeyword());
                } else if (userAgree.getType() != 0) {
                    return userAgree.getType().equals(item.getType());
                } else {
                    return true;
                }
            }).toList();
        } else {
            Comment.Query query = new Comment.Query();
            query.setTitle(userAgree.getKeyword());
            query.setType(userAgree.getType());
            query.setLikeUid(userId);
            return commentService.listCommentVO(query);
        }
    }

    @Override
    public void updateUser(User user) {
        int userId = StpUtil.getLoginIdAsInt();
        user.setId(userId);
        User oldUser = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .select(User::getUsername, User::getNickname)
                .eq(User::getId, userId));
        if (!oldUser.getUsername().equals(user.getUsername())) {
            User flagUser = userMapper.selectOne(new LambdaQueryWrapper<User>()
                    .select(User::getId)
                    .eq(User::getUsername, user.getUsername())
                    .ne(User::getNickname, oldUser.getNickname()));
            Assert.isNull(flagUser, "账号[" + user.getUsername() + "]已被使用");
        }
        if (StringUtils.isNotEmpty(user.getNickname())) {
            User flagUser = userMapper.selectOne(new LambdaQueryWrapper<User>()
                    .select(User::getId)
                    .eq(User::getNickname, user.getNickname())
                    .ne(User::getUsername, oldUser.getUsername()));
            Assert.isNull(flagUser, "昵称[" + user.getNickname() + "]已被使用");
        }
        userMapper.updateById(user);
    }

    @Override
    public void updateUserStatus(DisableDTO disable) {
        // 更新用户状态
        userMapper.updateById(User.builder()
                .id(disable.getId())
                .isDisable(disable.getIsDisable())
                .build());
        if (disable.getIsDisable().equals(TRUE)) {
            // 先踢下线
            StpUtil.logout(disable.getId());
            // 再封禁账号
            StpUtil.disable(disable.getId(), 86400);
        } else {
            // 解除封禁
            StpUtil.untieDisable(disable.getId());
        }
    }

    @Override
    public void kickOutUser(String token) {
        StpUtil.logoutByTokenValue(token);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateUserEmail(EmailDTO email) {
        verifyCode(email.getEmail(), email.getCode());
        userMapper.updateById(User.builder()
                .id(StpUtil.getLoginIdAsInt())
                .email(email.getEmail())
                .build());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String updateUserAvatar(MultipartFile file) {
        // 头像上传
        String avatar = uploadStrategyContext.executeUploadStrategy(file, FilePathEnum.AVATAR.getPath());
        // 更新用户头像
        userMapper.updateById(User.builder()
                .id(StpUtil.getLoginIdAsInt())
                .avatar(avatar)
                .build());
        return avatar;
    }

    @Override
    public void updatePassword(PasswdDTO passwd) {
        Integer userId = StpUtil.getLoginIdAsInt();
        // 查询旧密码是否正确
        User user = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getId, userId));
        Assert.notNull(user, "用户不存在");
        Assert.isTrue(SecurityUtils.checkPw(user.getPassword(), passwd.getOldPassword()), "旧密码校验不通过!");
        // 正确则修改密码
        String newPassword = SecurityUtils.sha256Encrypt(passwd.getNewPassword());
        user.setPassword(newPassword);
        userMapper.updateById(user);
    }

    @Override
    public void resetPassword(Integer userId) {
        // 用户是否存在
        User user = userMapper.selectById(userId);
        Assert.isFalse(StringUtils.isNull(user), "用户不存在！");
        // 根据用户ID重置密码
        userMapper.update(user, new LambdaUpdateWrapper<User>()
                .set(User::getPassword, SecurityUtils.sha256Encrypt("123456"))
                .eq(User::getId, userId));
    }

    /**
     * 校验验证码
     *
     * @param username 用户名
     * @param code     验证码
     */
    private void verifyCode(String username, String code) {
        String sysCode = redisService.getObject(CODE_KEY_USER + username);
        Assert.notBlank(sysCode, "验证码未发送或已过期！");
        Assert.isTrue(sysCode.equals(code), "验证码错误，请重新输入！");
    }

    /**
     * 获取用户点赞的记录ids
     */
    private List<Integer> getLikeRecordIds(Integer userId) {
        List<Integer> recordIds = new ArrayList<>(redisService.getSet(USER_RECORD_LIKE + userId)
                .stream().map(item -> Integer.valueOf(item.toString())).toList());
        List<UserLike> userLikeList = userLikeMapper.selectList(new LambdaQueryWrapper<UserLike>()
                .select(UserLike::getTypeId)
                .eq(UserLike::getType, RECORD.getType())
                .eq(UserLike::getUserId, userId));
        if (StringUtils.isNotEmpty(userLikeList)) {
            recordIds.addAll(userLikeList.stream().map(UserLike::getTypeId).toList());
        }
        return recordIds;
    }


    /**
     * 获取用户点赞的题目ids
     */
    private List<Integer> getLikeQuizIds(Integer userId) {
        List<Integer> quizIds = new ArrayList<>(redisService.getSet(USER_QUIZ_LIKE + userId)
                .stream().map(item -> Integer.valueOf(item.toString())).toList());
        List<UserLike> userLikeList = userLikeMapper.selectList(new LambdaQueryWrapper<UserLike>()
                .select(UserLike::getTypeId)
                .eq(UserLike::getType, QUIZ.getType())
                .eq(UserLike::getUserId, userId));
        if (StringUtils.isNotEmpty(userLikeList)) {
            quizIds.addAll(userLikeList.stream().map(UserLike::getTypeId).toList());
        }
        return quizIds;
    }

    /**
     * 获取用户点赞的题目作答ids
     */
    private List<Integer> getLikeAnswerIds(Integer userId) {
        List<Integer> answerIds = new ArrayList<>(redisService.getSet(USER_ANSWER_LIKE + userId)
                .stream().map(item -> Integer.valueOf(item.toString())).toList());
        List<UserLike> userLikeList = userLikeMapper.selectList(new LambdaQueryWrapper<UserLike>()
                .select(UserLike::getTypeId)
                .eq(UserLike::getType, ANSWER.getType())
                .eq(UserLike::getUserId, userId));
        if (StringUtils.isNotEmpty(userLikeList)) {
            answerIds.addAll(userLikeList.stream().map(UserLike::getTypeId).toList());
        }
        return answerIds;
    }

    /**
     * 获取用户点赞的评论ids
     */
    private List<Integer> getLikeCommentIds(Integer userId) {
        List<Integer> commentIds = new ArrayList<>(redisService.getSet(USER_COMMENT_LIKE + userId)
                .stream().map(item -> Integer.valueOf(item.toString())).toList());
        List<UserLike> userLikeList = userLikeMapper.selectList(new LambdaQueryWrapper<UserLike>()
                .select(UserLike::getTypeId)
                .eq(UserLike::getType, COMMENT.getType())
                .eq(UserLike::getUserId, userId));
        if (StringUtils.isNotEmpty(userLikeList)) {
            commentIds.addAll(userLikeList.stream().map(UserLike::getTypeId).toList());
        }
        return commentIds;
    }

    /**
     * 获取用户收藏的文本ids
     */
    private List<Integer> getCollectIds(Integer userId, Integer type) {
        List<UserCollect> list = userCollectMapper.selectList(new LambdaQueryWrapper<UserCollect>()
                .select(UserCollect::getTypeId)
                .eq(UserCollect::getType, type)
                .eq(UserCollect::getUserId, userId));
        if (StringUtils.isNotEmpty(list)) {
            return list.stream().map(UserCollect::getTypeId).toList();
        } else {
            return new ArrayList<>();
        }
    }

    /**
     * 获取用户参与的约起记录ids信息
     */
    private List<UserAgree> getIssueAgreeIds(Integer userId) {
        return userAgreeMapper.selectList(new LambdaQueryWrapper<UserAgree>()
                .select(UserAgree::getAgreeId, UserAgree::getType, UserAgree::getStatus)
                .eq(UserAgree::getUserId, userId));
    }

}