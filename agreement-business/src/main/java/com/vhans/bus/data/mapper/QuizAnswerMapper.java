package com.vhans.bus.data.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.data.domain.QuizAnswer;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 题目作答Mapper接口
 *
 * @author vhans
 * @date 2023-11-01
 */
@Repository
public interface QuizAnswerMapper extends BaseMapper<QuizAnswer> {

    /**
     * 查询题目作答列表
     *
     * @param query 查询条件
     * @return 题目作答集合
     */
    List<QuizAnswer> selectAnswerList(@Param("query") QuizAnswer.Query query);

    /**
     * 通过主键查询题目作答信息
     *
     * @param id 题目作答ID
     * @return 结果
     */
    QuizAnswer selectAnswerById(@Param("id") Integer id);

    /**
     * 查询前台某个题目的作答列表
     *
     * @param quizId 题目id
     * @return 作答列表
     */
    List<QuizAnswer> selectAnswerHomeList(@Param("quizId") Integer quizId);

}
