package com.vhans.bus.data.strategy;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.data.domain.Comment;
import com.vhans.core.redis.RedisService;
import com.vhans.core.strategy.LikeStrategy;
import com.vhans.bus.data.mapper.CommentMapper;
import com.vhans.bus.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.vhans.core.constant.CommonConstant.TRUE;
import static com.vhans.core.constant.RedisConstant.COMMENT_LIKE_COUNT;
import static com.vhans.core.constant.RedisConstant.USER_COMMENT_LIKE;
import static com.vhans.core.constant.ScoreConstant.LIKE_SCORE;

/**
 * 评论点赞策略
 *
 * @author vhans
 */
@Service("commentLikeStrategyImpl")
public class CommentLikeStrategyImpl implements LikeStrategy {

    @Autowired
    private RedisService redisService;

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public void like(Integer commentId) {
        int userId = StpUtil.getLoginIdAsInt();
        // 判断评论是否存在
        Assert.isTrue(commentMapper.exists(new LambdaQueryWrapper<Comment>()
                .eq(Comment::getIsCheck, TRUE)
                .eq(Comment::getId, commentId)),"评论不存在");
        // 用户id作为键，评论id作为值，记录用户点赞记录
        String userLikeCommentKey = USER_COMMENT_LIKE + userId;
        if (redisService.hasSetValue(userLikeCommentKey, commentId)) {
            // 取消点赞则删除用户id中的评论id
            redisService.deleteSet(userLikeCommentKey, commentId);
            // 减少用户热度
            userMapper.updateDegree(userId, LIKE_SCORE * -1);
            // 评论点赞量-1
            redisService.decrHash(COMMENT_LIKE_COUNT, commentId.toString(), 1L);
        } else {
            // 点赞则在用户id记录评论id
            redisService.setSet(userLikeCommentKey, commentId);
            // 增加用户热度
            userMapper.updateDegree(userId, LIKE_SCORE);
            // 评论点赞量+1
            redisService.incrHash(COMMENT_LIKE_COUNT, commentId.toString(), 1L);
        }
    }
}