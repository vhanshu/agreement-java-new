package com.vhans.bus.data.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.data.domain.Tag;
import com.vhans.bus.data.domain.vo.TagOptionVO;
import com.vhans.bus.data.domain.vo.TagStatisticsVO;

import java.util.List;

/**
 * 标签业务接口
 *
 * @author vhans
 **/
public interface ITagService extends IService<Tag> {

    /**
     * 查看标签列表
     *
     * @param query 条件
     * @return 标签列表
     */
    List<Tag> listTagVO(Tag.Query query);

    /**
     * 添加标签
     *
     * @param tag 标签
     */
    void addTag(Tag tag);

    /**
     * 删除标签
     *
     * @param tagIdList 标签id集合
     */
    void deleteTag(List<Integer> tagIdList);

    /**
     * 修改标签
     *
     * @param tag 标签
     */
    void updateTag(Tag tag);

    /**
     * 搜索所有标签选项
     *
     * @return 标签列表
     */
    List<TagOptionVO> listTagAllOption();

    /**
     * 搜索相应类型的标签选项
     *
     * @param type 类型(1:记录标签,2:题目标签)
     * @return 标签列表
     */
    List<TagOptionVO> listTagOption(Integer type);

    /**
     * 查看相应标签统计列表
     *
     * @param type 类型(1:记录标签,2:题目标签)
     * @return 标签列表
     */
    List<TagStatisticsVO> listTagVO(Integer type);

    /**
     * 覆盖标签生成
     *
     * @param tagNameList 标签名列表
     * @return 覆盖标签ids
     */
    List<Integer> getCoverTag(List<String> tagNameList);
}