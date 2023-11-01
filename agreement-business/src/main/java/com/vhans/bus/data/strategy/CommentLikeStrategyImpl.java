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
    public void like(Integer id) {
        // 判断评论是否存在
        Comment obj = commentMapper.selectOne(new LambdaQueryWrapper<Comment>()
                .select(Comment::getId, Comment::getFromUid)
                .eq(Comment::getIsCheck, TRUE)
                .eq(Comment::getId, id));
        Assert.notNull(obj, "评论不存在");
        // 用户id作为键，评论id作为值，记录用户点赞记录
        String key = USER_COMMENT_LIKE + StpUtil.getLoginIdAsInt();
        if (redisService.hasSetValue(key, id)) {
            // 取消点赞则删除用户id中的评论id
            redisService.deleteSet(key, id);
            // 减少评论发布者热度
            userMapper.updateDegree(obj.getFromUid(), LIKE_SCORE * -1);
            // 评论点赞量-1
            redisService.decrHash(COMMENT_LIKE_COUNT, id.toString(), 1L);
        } else {
            // 点赞则在用户id中记录评论id
            redisService.setSet(key, id);
            // 增加评论发布者热度
            userMapper.updateDegree(obj.getFromUid(), LIKE_SCORE);
            // 评论点赞量+1
            redisService.incrHash(COMMENT_LIKE_COUNT, id.toString(), 1L);
        }
    }
}