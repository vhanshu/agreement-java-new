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
     * 批量保存标签
     *
     * @param type      文本类型
     * @param typeId    文本id
     * @param tagIdList 标签id列表
     */
    void saveBatchTag(@Param("type") Integer type, @Param("typeId") Integer typeId, List<Integer> tagIdList);
}
