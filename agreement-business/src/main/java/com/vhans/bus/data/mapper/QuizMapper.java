package com.vhans.bus.data.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.data.domain.vo.OverviewVO;
import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import com.vhans.bus.data.domain.vo.StatisticsVO;
import com.vhans.core.web.model.vo.SearchVO;
import com.vhans.bus.data.domain.Quiz;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【题目】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface QuizMapper extends BaseMapper<Quiz> {
    /**
     * 查询题目列表
     *
     * @param query 条件
     * @return 题目列表
     */
    List<Quiz> selectQuizVO(@Param("query") Quiz.Query query);

    /**
     * 题目搜索
     *
     * @param keyword 关键字
     * @return 题目列表
     */
    List<SearchVO> searchQuiz(@Param("keyword") String keyword);

    /**
     * 查询前台题目列表
     *
     * @return 题目列表
     */
    List<Quiz> selectQuizHomeList();

    /**
     * 根据id查询前台题目
     *
     * @param recordId 题目id
     * @return 题目信息
     */
    Quiz selectQuizHomeById(Integer recordId);

    /**
     * 查询上一篇题目
     *
     * @param recordId 题目id
     * @return 上一篇题目
     */
    PaginationVO selectLastQuiz(Integer recordId);

    /**
     * 查询下一篇题目
     *
     * @param recordId 题目id
     * @return 下一篇题目
     */
    PaginationVO selectNextQuiz(Integer recordId);

    /**
     * 查询题目总览
     *
     * @return 题目归档
     */
    List<OverviewVO> selectQuizList();

    /**
     * 查看最新的题目
     *
     * @return 最新的题目
     */
    List<Quiz> selectQuizLatest();

    /**
     * 查询题目统计
     *
     * @return 题目统计
     */
    List<StatisticsVO> selectQuizStatistics();
}
