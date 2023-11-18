package com.vhans.bus.data.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.data.domain.AgreeRecord;
import com.vhans.bus.data.domain.Comment;
import com.vhans.bus.data.domain.Quiz;
import com.vhans.bus.data.domain.vo.ReplyVO;
import com.vhans.bus.data.mapper.AgreeRecordMapper;
import com.vhans.bus.data.mapper.CommentMapper;
import com.vhans.bus.data.mapper.QuizMapper;
import com.vhans.bus.data.service.ICommentService;
import com.vhans.bus.subsidiary.model.dto.CheckDTO;
import com.vhans.bus.user.domain.User;
import com.vhans.bus.user.mapper.UserMapper;
import com.vhans.bus.website.domain.SiteConfig;
import com.vhans.bus.website.service.ISiteConfigService;
import com.vhans.core.redis.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static com.vhans.core.constant.CommonConstant.FALSE;
import static com.vhans.core.constant.CommonConstant.TRUE;
import static com.vhans.core.constant.RedisConstant.COMMENT_LIKE_COUNT;
import static com.vhans.core.enums.CommentTypeEnum.QUIZ;
import static com.vhans.core.enums.CommentTypeEnum.RECORD;

/**
 * 评论业务接口实现类
 *
 * @author vhanss
 */
@Service("commentServiceImpl")
public class CommentServiceImpl implements ICommentService {

//    @Value("${agreement.url}")
//    private String websiteUrl;

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private AgreeRecordMapper recordMapper;

    @Autowired
    private QuizMapper quizMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ISiteConfigService siteConfigService;

    @Autowired
    private RedisService redisService;

//    @Autowired
//    private RabbitTemplate rabbitTemplate;

    @Override
    public List<Comment> listCommentVO(Comment.Query query) {
        // 查询评论列表
        List<Comment> commentVOS = commentMapper.listCommentVO(query);
        // 封装评论信息
        commentVOS.forEach(item -> {
            // 查询点赞量
            Integer likeNumber = redisService.getHash(COMMENT_LIKE_COUNT, item.getId().toString());
            // 设置当前点赞量为 持久点赞量 + 缓存点赞量
            item.setLikeNumber(item.getLikeNumber() + Optional.ofNullable(likeNumber).orElse(0));
        });
        return commentVOS;
    }

    @Override
    public int addComment(Comment comment) {
        // 校验评论参数
        verifyComment(comment);
        SiteConfig siteConfig = siteConfigService.getSiteConfig();
        Integer commentCheck = siteConfig.getCommentCheck();
        // 需要:toUid,typeId,type,parentId,replyId,content,isCheck
        comment.setIsCheck(commentCheck.equals(FALSE) ? TRUE : FALSE);
        comment.setFromUid(StpUtil.getLoginIdAsInt());
        comment.setLikeNumber(0);
        comment.setReplyList(new ArrayList<>());
        // 保存评论
        return commentMapper.insert(comment);
//        String fromNickname = userMapper.selectOne(new LambdaQueryWrapper<User>()
//                        .select(User::getNickname)
//                        .eq(User::getId, StpUtil.getLoginIdAsInt()))
//                .getNickname();
//        if (siteConfig.getEmailNotice().equals(TRUE)) {
//            // 异步通知用户
//            CompletableFuture.runAsync(() -> notice(newComment, fromNickname));
//        }
    }

    @Transactional
    @Override
    public void updateCommentCheck(CheckDTO check) {
        // 修改评论审核状态
        check.getIdList().forEach(item ->
                commentMapper.updateById(Comment.builder().id(item).isCheck(check.getIsCheck()).build()));

    }

    @Override
    public List<Comment> listRecentCommentVO() {
        List<Comment> recentCommentVOS = commentMapper.selectRecentComment();
        recentCommentVOS.forEach(item -> {
            // 查询点赞量
            Integer likeNumber = redisService.getHash(COMMENT_LIKE_COUNT, item.getId().toString());
            // 设置当前点赞量为 持久点赞量 + 缓存点赞量
            item.setLikeNumber(item.getLikeNumber() + Optional.ofNullable(likeNumber).orElse(0));
        });
        return recentCommentVOS;
    }

    @Override
    public List<Comment> listCommentHomeVO(Comment.Query query) {
        // 查询父评论
        List<Comment> commentHomeVOList = commentMapper.selectParentComment(query);
        // 封装评论数据
        commentHomeVOList.forEach(item -> {
            // 查询父评论点赞量
            Integer likeNumber = redisService.getHash(COMMENT_LIKE_COUNT, item.getId().toString());
            // 查询该父评论下的前三条子评论
            List<ReplyVO> replyVOS = commentMapper.selectReplyLimitByParentId(item.getId());
            replyVOS.forEach(reply -> {
                // 查询回复点赞量
                Integer rLikeNumber = redisService.getHash(COMMENT_LIKE_COUNT, reply.getId().toString());
                // 设置当前点赞量为 持久点赞量 + 缓存点赞量
                reply.setLikeNumber(reply.getLikeNumber() + Optional.ofNullable(rLikeNumber).orElse(0));
            });
            // 查询回复数量
            Long replyNum = commentMapper.selectCount(new LambdaQueryWrapper<Comment>()
                    .eq(Comment::getParentId, item.getId()));
            // 设置当前点赞量为 持久点赞量 + 缓存点赞量
            item.setLikeNumber(item.getLikeNumber() + Optional.ofNullable(likeNumber).orElse(0));
            item.setReplyList(replyVOS);
            item.setReplyNumber(Math.toIntExact(replyNum));
        });
        return commentHomeVOList;
    }

    @Override
    public Comment getCommentInfo(Integer commentId) {
        Comment comment = commentMapper.selectCommentById(commentId);
        // 查询评论点赞量
        Integer likeNumber = redisService.getHash(COMMENT_LIKE_COUNT, commentId.toString());
        // 设置当前点赞量为 持久点赞量 + 缓存点赞量
        comment.setLikeNumber(comment.getLikeNumber() + Optional.ofNullable(likeNumber).orElse(0));
        return comment;
    }

    @Override
    public List<ReplyVO> listReply(Integer commentId) {
        // 查询子评论
        List<ReplyVO> replyList = commentMapper.selectReplyByParentId(commentId);
        replyList.forEach(item -> {
            // 查询子评论点赞量
            Integer likeNumber = redisService.getHash(COMMENT_LIKE_COUNT, item.getId().toString());
            // 设置当前点赞量为 持久点赞量 + 缓存点赞量
            item.setLikeNumber(item.getLikeNumber() + Optional.ofNullable(likeNumber).orElse(0));
        });
        return replyList;
    }

    @Override
    public void removeByIds(List<Integer> commentIdList) {
        commentMapper.deleteBatchIds(commentIdList);
    }

    /**
     * 校验评论参数
     *
     * @param comment 评论信息
     */
    private void verifyComment(Comment comment) {
        if (comment.getType().equals(RECORD.getType())) {
            Assert.isTrue(recordMapper.exists(new LambdaQueryWrapper<AgreeRecord>()
                    .eq(AgreeRecord::getId, comment.getTypeId())), "记录不存在");
        }
        if (comment.getType().equals(QUIZ.getType())) {
            Assert.isTrue(quizMapper.exists(new LambdaQueryWrapper<Quiz>()
                    .eq(Quiz::getId, comment.getTypeId())), "题目不存在");
        }
        // 评论为子评论，判断信息
        Optional.ofNullable(comment.getParentId()).ifPresent(parentId -> {
            // 1.判断父评论是否存在
            Comment parentComment = commentMapper.selectOne(new LambdaQueryWrapper<Comment>()
                    .select(Comment::getId, Comment::getParentId, Comment::getType)
                    .eq(Comment::getId, parentId));
            Assert.notNull(parentComment, "父评论不存在");
            Assert.isNull(parentComment.getParentId(), "父评论不合法");
            Assert.isTrue(comment.getType().equals(parentComment.getType()),
                    "只能以同类型的评论作为父评论");
            // 2.判断回复的评论和用户是否存在
            Comment replyComment = commentMapper.selectOne(new LambdaQueryWrapper<Comment>()
                    .select(Comment::getId, Comment::getParentId, Comment::getFromUid, Comment::getType)
                    .eq(Comment::getId, comment.getReplyId()));
            Assert.notNull(replyComment, "回复的评论不存在");
            Assert.isTrue(userMapper.exists(new LambdaQueryWrapper<User>()
                    .select(User::getId).eq(User::getId, comment.getToUid())), "回复的用户不存在");
            Assert.isTrue(comment.getType().equals(replyComment.getType()),
                    "只能回复同类型的下的评论");
            if (Objects.nonNull(replyComment.getParentId())) {
                Assert.isTrue(replyComment.getParentId().equals(parentId),
                        "提交的评论父评论与当前回复评论两者父评论不一致");
            }
            Assert.isTrue(replyComment.getFromUid().equals(comment.getToUid()),
                    "提交的评论回复的用户与当前回复评论两者评论用户不一致");
            // 只能回复当前父评论及其子评论
            List<Integer> replyIdList = commentMapper.selectCommentIdByParentId(parentId);
            replyIdList.add(parentId);
            Assert.isTrue(replyIdList.contains(replyComment.getId()), "当前父评论下不存在该子评论");
        });
    }

//    /**
//     * 评论通知
//     *
//     * @param comment      评论
//     * @param fromNickname 评论用户昵称
//     */
//    private void notice(Comment comment, String fromNickname) {
//        // 自己回复自己不用提醒
//        if (comment.getFromUid().equals(comment.getToUid())) {
//            return;
//        }
//        // 邮件标题
//        String title = "约起评论通知!";
//        // 回复用户id
//        Integer toUid = BLOGGER_ID;
//        if (Objects.isNull(comment.getParentId())) {    // 是父评论
//            if (comment.getType().equals(RECORD.getType())) {
//                // 查询记录信息
//                AgreeRecord agreeRecord = recordMapper.selectOne(new LambdaQueryWrapper<AgreeRecord>()
//                        .select(AgreeRecord::getTitle, AgreeRecord::getUserId)
//                        .eq(AgreeRecord::getId, comment.getTypeId()));
//                title = agreeRecord.getTitle();
//                toUid = agreeRecord.getUserId();
//            }
//            if (comment.getType().equals(QUIZ.getType())) {
//                // 查询题目信息
//                Quiz quiz = quizMapper.selectOne(new LambdaQueryWrapper<Quiz>()
//                        .select(Quiz::getTitle, Quiz::getUserId)
//                        .eq(Quiz::getId, comment.getTypeId()));
//                title = quiz.getTitle();
//                toUid = quiz.getUserId();
//            }
//            // 自己评论自己的记录或者题目，不用提醒
//            if (comment.getFromUid().equals(toUid)) {
//                return;
//            }
//        } else {    // 是子评论
//            toUid = comment.getToUid();
//            if (comment.getType().equals(RECORD.getType())) {
//                // 查询记录标题
//                title = recordMapper.selectOne(new LambdaQueryWrapper<AgreeRecord>()
//                                .select(AgreeRecord::getTitle)
//                                .eq(AgreeRecord::getId, comment.getTypeId()))
//                        .getTitle();
//            }
//            if (comment.getType().equals(QUIZ.getType())) {
//                // 查询题目标题
//                title = quizMapper.selectOne(new LambdaQueryWrapper<Quiz>()
//                                .select(Quiz::getTitle)
//                                .eq(Quiz::getId, comment.getTypeId()))
//                        .getTitle();
//            }
//        }
//        // 查询回复用户邮箱、昵称、id
//        User toUser = userMapper.selectOne(new LambdaQueryWrapper<User>()
//                .select(User::getEmail, User::getNickname)
//                .eq(User::getId, toUid));
//        if (StringUtils.hasText(toUser.getEmail())) {   // 邮箱不为空
//            sendEmail(comment, toUser, title, fromNickname);
//        }
//    }

//    /**
//     * 发送邮件
//     *
//     * @param comment      评论
//     * @param toUser       回复用户信息
//     * @param title        标题
//     * @param fromNickname 评论用户昵称
//     */
//    private void sendEmail(Comment comment, User toUser, String title, String fromNickname) {
//        MailDTO mailDTO = new MailDTO();
//        if (comment.getIsCheck().equals(TRUE)) {
//            Map<String, Object> contentMap = new HashMap<>(7);
//            // 构造评论链接
//            String typeId = Optional.ofNullable(comment.getTypeId())
//                    .map(Object::toString)
//                    .orElse("");
//            String url = websiteUrl + getCommentPath(comment.getType()) + typeId;
//            if (Objects.isNull(comment.getParentId())) {     // 父评论则提醒发表者
//                mailDTO.setToEmail(toUser.getEmail());
//                mailDTO.setSubject(COMMENT_REMIND);
//                mailDTO.setTemplate(AUTHOR_TEMPLATE);
//                String createTime = DateUtil.formatLocalDateTime(comment.getCreateTime());
//                contentMap.put("time", createTime);
//                contentMap.put("url", url);
//                contentMap.put("title", title);
//                contentMap.put("nickname", fromNickname);
//                contentMap.put("content", comment.getContent());
//                mailDTO.setContentMap(contentMap);
//            } else {    // 子评论则提醒回复的用户
//                Comment parentComment = commentMapper.selectOne(new LambdaQueryWrapper<Comment>()
//                        .select(Comment::getContent, Comment::getCreateTime)
//                        .eq(Comment::getId, comment.getReplyId()));
//                mailDTO.setToEmail(toUser.getEmail());
//                mailDTO.setSubject(COMMENT_REMIND);
//                mailDTO.setTemplate(USER_TEMPLATE);
//                contentMap.put("url", url);
//                contentMap.put("title", title);
//                String createTime = DateUtil.formatLocalDateTime(comment.getCreateTime());
//                contentMap.put("time", createTime);
//                // 被回复用户昵称
//                contentMap.put("toUser", toUser.getNickname());
//                // 评论用户昵称
//                contentMap.put("fromUser", fromNickname);
//                // 被回复的评论内容
//                contentMap.put("parentComment", parentComment.getContent());
//                // 回复评论内容
//                contentMap.put("replyComment", comment.getContent());
//                mailDTO.setContentMap(contentMap);
//            }
//            // 发送HTML邮件
//            rabbitTemplate.convertAndSend(EMAIL_EXCHANGE, EMAIL_HTML_KEY, mailDTO);
//        } else {
//            // 审核提醒
//            String adminEmail = userMapper.selectOne(new LambdaQueryWrapper<User>()
//                    .select(User::getEmail)
//                    .eq(User::getId, BLOGGER_ID)).getEmail();
//            mailDTO.setToEmail(adminEmail);
//            mailDTO.setSubject(CHECK_REMIND);
//            mailDTO.setContent("您收到一条新的回复，请前往后台管理页面审核");
//            // 发送普通邮件
//            rabbitTemplate.convertAndSend(EMAIL_EXCHANGE, EMAIL_SIMPLE_KEY, mailDTO);
//        }
//    }
}




