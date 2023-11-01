package com.vhans.bus.data.strategy;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.data.domain.QuizAnswer;
import com.vhans.bus.data.mapper.QuizAnswerMapper;
import com.vhans.core.redis.RedisService;
import com.vhans.core.strategy.LikeStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.vhans.core.constant.CommonConstant.TRUE;
import static com.vhans.core.constant.RedisConstant.ANSWER_LIKE_COUNT;
import static com.vhans.core.constant.RedisConstant.USER_ANSWER_LIKE;

/**
 * 题目作答点赞策略
 *
 * @author vhans
 */
@Service("answerLikeStrategyImpl")
public class QuizAnswerLikeStrategyImpl implements LikeStrategy {

    @Autowired
    private RedisService redisService;

    @Autowired
    private QuizAnswerMapper answerMapper;

    @Override
    public void like(Integer answerId) {
        QuizAnswer answer = answerMapper.selectOne(new LambdaQueryWrapper<QuizAnswer>()
                .select(QuizAnswer::getId, QuizAnswer::getUserId)
                .eq(QuizAnswer::getIsCheck, TRUE)
                .eq(QuizAnswer::getId, answerId));
        Assert.notNull(answer, "题目不存在");
        // 用户id作为键，题目id作为值，记录用户点赞记录
        String userLikeQuizAnswerKey = USER_ANSWER_LIKE + StpUtil.getLoginIdAsInt();
        // 判断是否点赞
        if (redisService.hasSetValue(userLikeQuizAnswerKey, answerId)) {
            // 取消点赞则删除用户id中的题目id
            redisService.deleteSet(userLikeQuizAnswerKey, answerId);
            // 题目点赞量-1
            redisService.decrHash(ANSWER_LIKE_COUNT, answerId.toString(), 1L);
        } else {
            // 点赞则在用户id记录题目id
            redisService.setSet(userLikeQuizAnswerKey, answerId);
            // 题目点赞量+1
            redisService.incrHash(ANSWER_LIKE_COUNT, answerId.toString(), 1L);
        }
    }

}
