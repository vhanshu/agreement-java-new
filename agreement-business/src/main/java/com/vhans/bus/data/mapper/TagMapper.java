package com.vhans.bus.data.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.data.domain.Tag;
import com.vhans.bus.data.domain.vo.TagStatisticsVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【标签】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface TagMapper extends BaseMapper<Tag> {
    /**
     * 查询标签列表
     *
     * @param query 条件
     * @return 标签列表
     */
    List<Tag> selectTag(@Param("query") Tag.Query query);

    /**
     * 根据标签名查询已有的标签
     *
     * @param tagNameList 标签名列表
     * @return 标签
     */
    List<Tag> selectTagList(@Param("tagNameList") List<String> tagNameList);

    /**
     * 在相应文本类型下根据标签名列表查询文本ids
     *
     * @param tagNameList 标签名列表
     * @param type        文本类型
     * @return 文本ids
     */
    List<Integer> selectTextIds(@Param("tagNameList") List<String> tagNameList, @Param("type") Integer type);

    /**
     * 根据文本类型id查询相应类型的标签名称列表
     *
     * @param typeId 类型id
     * @param type   标签类型(1:记录标签,2:题目标签,3:商品标签)
     * @return 记录标签名称列表
     */
    List<String> selectTagNameByTypeId(@Param("typeId") Integer typeId, @Param("type") Integer type);

    /**
     * 根据文本类型id查询相应类型的标签列表
     *
     * @param typeId 类型id
     * @param type   标签类型(1:记录标签,2:题目标签,3:商品标签)
     * @return 记录标签
     */
    List<TagStatisticsVO> selectTagByTypeId(@Param("typeId") Integer typeId, @Param("type") Integer type);

    /**
     * 查询对应标签统计列表
     *
     * @param type 标签类型(1:记录标签,2:题目标签,3:商品标签)
     * @return 标签统计列表
     */
    List<TagStatisticsVO> selectTagVOList(@Param("type") Integer type);

    /**
     * 查询相应标签选项
     *
     * @param type 标签类型(1:记录标签,2:题目标签,3:商品标签)
     * @return 标签列表
     */
    List<TagStatisticsVO> selectTagOptionList(@Param("type") Integer type);

    /**
     * 查询所有标签选项
     *
     * @return 标签列表
     */
    List<TagStatisticsVO> selectTagOptionAllList();

}
