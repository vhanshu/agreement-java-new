package com.vhans.bus.data.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.data.domain.TagText;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【标签与文本】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface TagTextMapper extends BaseMapper<TagText> {
    /**
     * 批量保存记录标签
     *
     * @param recordId 记录id
     * @param tagIdList 标签id列表
     */
    void saveBatchRecordTag(@Param("recordId") Integer recordId, List<Integer> tagIdList);

    /**
     * 批量保存题目标签
     *
     * @param quizId 题目id
     * @param tagIdList 标签id列表
     */
    void saveBatchQuizTag(@Param("quizId") Integer quizId, List<Integer> tagIdList);
}
