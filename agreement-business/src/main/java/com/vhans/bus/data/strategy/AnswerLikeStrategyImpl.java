package com.vhans.bus.data.strategy;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.data.domain.QuizAnswer;
import com.vhans.bus.data.mapper.QuizAnswerMapper;
import com.vhans.bus.transmit.config.NettyWsHandler;
import com.vhans.bus.user.mapper.UserMapper;
import com.vhans.core.redis.RedisService;
import com.vhans.core.strategy.LikeStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.vhans.core.constant.CommonConstant.TRUE;
import static com.vhans.core.constant.PushTypeConstant.PUSH_LIKE;
import static com.vhans.core.constant.RedisConstant.ANSWER_LIKE_COUNT;
import static com.vhans.core.constant.RedisConstant.USER_ANSWER_LIKE;
import static com.vhans.core.constant.ScoreConstant.LIKE_SCORE;

/**
 * 题目作答点赞策略
 *
 * @author vhans
 */
@Service("answerLikeStrategyImpl")
public class AnswerLikeStrategyImpl implements LikeStrategy {

    @Autowired
    private RedisService redisService;

    @Autowired
    private QuizAnswerMapper answerMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public void like(Integer id) {
        QuizAnswer obj = answerMapper.selectOne(new LambdaQueryWrapper<QuizAnswer>()
                .select(QuizAnswer::getId, QuizAnswer::getUserId, QuizAnswer::getQuizId)
                .eq(QuizAnswer::getIsCheck, TRUE)
                .eq(QuizAnswer::getId, id));
        Assert.notNull(obj, "作答不存在");
        // 用户id作为键，作答id作为值，记录用户点赞记录
        String key = USER_ANSWER_LIKE + StpUtil.getLoginIdAsInt();
        if (redisService.hasSetValue(key, id)) {
            // 取消点赞则删除用户id中的作答id
            redisService.deleteSet(key, id);
            // 减少作答者热度
            userMapper.updateDegree(obj.getUserId(), LIKE_SCORE * -1);
            // 作答点赞量-1
            redisService.decrHash(ANSWER_LIKE_COUNT, id.toString(), 1L);
            // 推送点赞量变化-1
            NettyWsHandler.pushInfo(PUSH_LIKE, "answer#" + id + "#-1#" + obj.getQuizId(), 0);
        } else {
            // 点赞则在用户id中记录作答id
            redisService.setSet(key, id);
            // 增加作答者热度
            userMapper.updateDegree(obj.getUserId(), LIKE_SCORE);
            // 作答点赞量+1
            redisService.incrHash(ANSWER_LIKE_COUNT, id.toString(), 1L);
            // 推送点赞量变化+1
        NettyWsHandler.pushInfo(PUSH_LIKE, "answer#" + id + "#1#" + obj.getQuizId(), 0);
        }
    }
}
