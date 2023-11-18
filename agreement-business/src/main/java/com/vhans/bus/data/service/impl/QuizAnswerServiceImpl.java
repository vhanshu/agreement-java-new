package com.vhans.bus.data.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.data.domain.QuizAnswer;
import com.vhans.bus.data.mapper.QuizAnswerMapper;
import com.vhans.bus.data.mapper.QuizMapper;
import com.vhans.bus.data.service.IQuizAnswerService;
import com.vhans.core.redis.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

import static com.vhans.core.constant.RedisConstant.ANSWER_LIKE_COUNT;

/**
 * 题目作答Service业务层处理
 *
 * @author vhans
 * @date 2023-11-01
 */
@Service
public class QuizAnswerServiceImpl extends ServiceImpl<QuizAnswerMapper, QuizAnswer> implements IQuizAnswerService {

    @Autowired
    private QuizAnswerMapper quizAnswerMapper;

    @Autowired
    private QuizMapper quizMapper;

    @Autowired
    private RedisService redisService;

    @Override
    public List<QuizAnswer> selectAnswerList(QuizAnswer.Query query) {
        return quizAnswerMapper.selectAnswerList(query);
    }

    @Override
    public int insertAnswer(QuizAnswer answer) {
        // 题目作答数+1
        quizMapper.updateAnswerNumber(answer.getQuizId(), 1);
        answer.setLikeNumber(0);
        answer.setUserId(StpUtil.getLoginIdAsInt());
        return quizAnswerMapper.insert(answer);
    }

    @Override
    public QuizAnswer selectAnswerById(Integer id) {
        QuizAnswer quizAnswer = quizAnswerMapper.selectAnswerById(id);
        // 查询点赞量
        Integer likeNumber = redisService.getHash(ANSWER_LIKE_COUNT, id.toString());
        // 设置当前点赞量为 持久点赞量 + 缓存点赞量
        quizAnswer.setLikeNumber(quizAnswer.getLikeNumber() + Optional.ofNullable(likeNumber).orElse(0));
        return quizAnswer;
    }

    @Override
    public int updateAnswer(QuizAnswer answer) {
        return quizAnswerMapper.updateById(answer);
    }

    @Override
    public int deleteAnswer(Integer id) {
        // 题目作答数-1
        quizMapper.updateAnswerNumber(id, -1);
        return quizAnswerMapper.deleteById(id);
    }

    @Override
    public List<QuizAnswer> selectAnswerHomeList(Integer quizId) {
        List<QuizAnswer> list = quizAnswerMapper.selectAnswerHomeList(quizId);
        list.forEach(item -> {
            // 查询点赞量
            Integer likeNumber = redisService.getHash(ANSWER_LIKE_COUNT, item.getId().toString());
            // 设置当前点赞量为 持久点赞量 + 缓存点赞量
            item.setLikeNumber(item.getLikeNumber() + Optional.ofNullable(likeNumber).orElse(0));
        });
        return list;
    }
}
