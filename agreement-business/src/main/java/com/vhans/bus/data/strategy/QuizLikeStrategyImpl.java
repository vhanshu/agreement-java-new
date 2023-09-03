package com.vhans.bus.data.strategy;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.core.redis.RedisService;
import com.vhans.core.strategy.LikeStrategy;
import com.vhans.bus.data.domain.Quiz;
import com.vhans.bus.data.mapper.QuizMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.vhans.core.constant.RedisConstant.QUIZ_LIKE_COUNT;
import static com.vhans.core.constant.RedisConstant.USER_QUIZ_LIKE;

/**
 * 题目点赞策略
 *
 * @author vhans
 */
@Service("quizLikeStrategyImpl")
public class QuizLikeStrategyImpl implements LikeStrategy {

    @Autowired
    private RedisService redisService;

    @Autowired
    private QuizMapper quizMapper;

    @Override
    public void like(Integer quizId) {
        Quiz quiz = quizMapper.selectOne(new LambdaQueryWrapper<Quiz>()
                .select(Quiz::getId)
                .eq(Quiz::getId, quizId));
        Assert.notNull(quiz, "题目不存在");
        // 用户id作为键，题目id作为值，记录用户点赞记录
        String userLikeQuizKey = USER_QUIZ_LIKE + StpUtil.getLoginIdAsInt();
        // 判断是否点赞
        if (redisService.hasSetValue(userLikeQuizKey, quizId)) {
            // 取消点赞则删除用户id中的题目id
            redisService.deleteSet(userLikeQuizKey, quizId);
            // 题目点赞量-1
            redisService.decrHash(QUIZ_LIKE_COUNT, quizId.toString(), 1L);
        } else {
            // 点赞则在用户id记录题目id
            redisService.setSet(userLikeQuizKey, quizId);
            // 题目点赞量+1
            redisService.incrHash(QUIZ_LIKE_COUNT, quizId.toString(), 1L);
        }
    }

}
