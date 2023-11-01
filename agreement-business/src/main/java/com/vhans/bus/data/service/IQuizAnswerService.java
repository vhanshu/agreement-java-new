package com.vhans.bus.data.service;

import com.vhans.bus.data.domain.QuizAnswer;

import java.util.List;

/**
 * 题目作答Service接口
 *
 * @author vhans
 * @date 2023-11-01
 */
public interface IQuizAnswerService {

    /**
     * 查询题目作答列表
     *
     * @param query 条件
     * @return 题目作答集合
     */
    List<QuizAnswer> selectAnswerList(QuizAnswer.Query query);

    /**
     * 新增题目作答
     *
     * @param answer 题目作答
     * @return 影响行
     */
    int insertAnswer(QuizAnswer answer);

    /**
     * 获取题目作答信息
     *
     * @param id 题目作答主键
     * @return 题目作答
     */
    QuizAnswer selectAnswerById(Integer id);

    /**
     * 修改题目作答
     *
     * @param answer 题目作答
     * @return 影响行
     */
    int updateAnswer(QuizAnswer answer);

    /**
     * 删除题目作答
     *
     * @param id 需要删除的题目作答主键
     * @return 影响行
     */
    int deleteAnswer(Integer id);

    /**
     * 查询前台某个题目的作答列表
     *
     * @param quizId 题目id
     * @return 题目作答集合
     */
    List<QuizAnswer> selectAnswerHomeList(Integer quizId);
}
