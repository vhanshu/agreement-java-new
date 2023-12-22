package com.vhans.bus.data.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.data.domain.Quiz;
import com.vhans.bus.data.domain.vo.OverviewVO;
import com.vhans.core.web.model.vo.SearchVO;

import java.util.List;

/**
 * 题目业务接口
 *
 * @author vhans
 **/
public interface IQuizService extends IService<Quiz> {

    /**
     * 查看题目列表
     *
     * @param query 条件
     * @return 题目列表
     */
    List<Quiz> listQuiz(Quiz.Query query);

    /**
     * 添加题目
     *
     * @param quiz 题目
     */
    void addQuiz(Quiz quiz);

    /**
     * 删除题目
     *
     * @param quizIdList 题目id
     */
    void deleteQuiz(List<Integer> quizIdList);

    /**
     * 修改题目
     *
     * @param quiz 题目
     */
    void updateQuiz(Quiz quiz);

    /**
     * 编辑题目
     *
     * @param quizId 题目id
     * @return 题目
     */
    Quiz getQuizInfo(Integer quizId);

    /**
     * 搜索题目
     *
     * @param keyword 关键字
     * @return 题目列表
     */
    List<SearchVO> listQuizBySearch(String keyword);

    /**
     * 根据标签查找题目列表
     * @param tagNames 标签名列表
     * @param isInter 是否相交
     * @return 题目列表
     */
    List<Quiz> listQuizByTag(List<String> tagNames, boolean isInter);

    /**
     * 查看前台题目列表
     *
     * @return 题目列表
     */
    List<Quiz> listQuizHome(Quiz.Query query);

    /**
     * 查看题目
     *
     * @param quizId 题目id
     * @return 题目
     */
    Quiz getQuizHomeById(Integer quizId);

    /**
     * 查看题目总览
     *
     * @return 题目总览
     */
    List<OverviewVO> listQuizOverviewVO();

    /**
     * 查看最新题目
     *
     * @return 最新题目
     */
    List<Quiz> listQuizLatest();

    /**
     * 收藏题目
     *
     * @param quizId 题目id
     */
    void collectQuiz(Integer quizId);
}
