package com.vhans.bus.data.service.impl;

import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.data.domain.Tag;
import com.vhans.bus.data.domain.TagText;
import com.vhans.bus.data.mapper.TagMapper;
import com.vhans.bus.data.mapper.TagTextMapper;
import com.vhans.bus.data.service.ITagService;
import com.vhans.bus.data.domain.vo.TagOptionVO;
import com.vhans.bus.data.domain.vo.TagStatisticsVO;
import com.vhans.core.utils.data.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 标签业务接口实现类
 *
 * @author vhans
 **/
@Service
public class TagServiceImpl extends ServiceImpl<TagMapper, Tag> implements ITagService {

    @Autowired
    private TagMapper tagMapper;

    @Autowired
    private TagTextMapper tagTextMapper;

    @Override
    public List<Tag> listTagVO(Tag.Query query) {
        Assert.isFalse(StringUtils.isNull(query.getType()), "未指定标签类型");
        Assert.isTrue(query.getType() == 1 || query.getType() == 2,
                "指定标签类型错误");
        return tagMapper.selectTag(query);
    }

    @Override
    public void addTag(Tag tag) {
        // 标签是否存在
        Tag existTag = tagMapper.selectOne(new LambdaQueryWrapper<Tag>()
                .select(Tag::getId)
                .ne(Tag::getId, tag.getId())
                .eq(Tag::getTagName, tag.getTagName()));
        Assert.isNull(existTag, tag.getTagName() + "标签已存在");
        // 添加新标签
        Tag newTag = Tag.builder()
                .tagName(tag.getTagName())
                .build();
        baseMapper.insert(newTag);
    }

    @Override
    public void deleteTag(List<Integer> tagIdList) {
        Assert.isFalse(tagTextMapper.exists(new LambdaQueryWrapper<TagText>()
                .in(TagText::getTagId, tagIdList)), "删除失败，有标签正在使用");
        // 批量删除标签
        tagMapper.deleteBatchIds(tagIdList);
    }

    @Override
    public void updateTag(Tag tag) {
        Assert.isFalse(tagMapper.exists(new LambdaQueryWrapper<Tag>()
                        .eq(Tag::getTagName, tag.getTagName())
                        .ne(Tag::getId, tag.getId())),
                tag.getTagName() + " 标签已存在");
        // 修改标签
        baseMapper.updateById(tag);
    }

    @Override
    public List<TagOptionVO> listTagAllOption() {
        return tagMapper.selectTagOptionAllList();
    }

    @Override
    public List<TagOptionVO> listTagOption(Integer type) {
        return tagMapper.selectTagOptionList(type);
    }

    @Override
    public List<TagStatisticsVO> listTagVO(Integer type) {
        Assert.isTrue(StringUtils.isNotNull(type), "请提供标签类型");
        return tagMapper.selectTagVOList(type);
    }

    /**
     * 根据标签ids获取标签名列表
     *
     * @param tagIds 标签ids
     * @return 标签名
     */
    private List<String> getTagNames(List<Integer> tagIds) {
        List<Tag> tags = tagMapper.selectList(new LambdaQueryWrapper<Tag>()
                .select(Tag::getTagName)
                .in(Tag::getId, tagIds));
        List<String> tagNames = new ArrayList<>();
        if (StringUtils.isNotEmpty(tags)) {
            tags.forEach(
                    tag -> tagNames.add(tag.getTagName())
            );
        }
        return tagNames;
    }

    /**
     * 覆盖标签生成
     *
     * @param tagNameList 标签名列表
     */
    public List<Integer> getCoverTag(List<String> tagNameList) {
        // 查询出已存在的标签
        List<Tag> existTagList = tagMapper.selectTagList(tagNameList);
        List<String> existTagNameList = existTagList.stream()
                .map(Tag::getTagName)
                .toList();
        List<Integer> existTagIdList = existTagList.stream()
                .map(Tag::getId)
                .collect(Collectors.toList());
        // 移除已存在的标签列表
        tagNameList.removeAll(existTagNameList);
        // 有新标签
        if (StringUtils.isNotEmpty(tagNameList)) {
            // 新标签列表
            List<Tag> newTagList = tagNameList.stream()
                    .map(item -> Tag.builder().tagName(item).build())
                    .toList();
            // 批量保存新标签
            newTagList.forEach(item -> tagMapper.insert(item));
            // 获取新标签id列表
            List<Integer> newTagIdList = newTagList.stream().map(Tag::getId).toList();
            // 新标签id添加到已有标签的id列表
            existTagIdList.addAll(newTagIdList);
        }
        return existTagIdList;
    }
}