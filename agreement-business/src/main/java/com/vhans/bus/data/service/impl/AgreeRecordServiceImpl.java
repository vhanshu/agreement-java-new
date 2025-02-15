package com.vhans.bus.data.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.data.domain.AgreeRecord;
import com.vhans.bus.data.domain.TagText;
import com.vhans.bus.data.domain.vo.OverviewVO;
import com.vhans.bus.data.domain.vo.TagStatisticsVO;
import com.vhans.bus.data.mapper.AgreeRecordMapper;
import com.vhans.bus.data.mapper.TagMapper;
import com.vhans.bus.data.mapper.TagTextMapper;
import com.vhans.bus.data.service.IAgreeRecordService;
import com.vhans.bus.data.service.ITagService;
import com.vhans.bus.subsidiary.model.dto.DeleteDTO;
import com.vhans.bus.subsidiary.model.dto.RecommendDTO;
import com.vhans.bus.subsidiary.model.dto.TopDTO;
import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import com.vhans.bus.user.domain.UserCollect;
import com.vhans.bus.user.domain.UserLike;
import com.vhans.bus.user.mapper.UserCollectMapper;
import com.vhans.bus.user.mapper.UserLikeMapper;
import com.vhans.bus.website.domain.SiteConfig;
import com.vhans.core.exception.ServiceException;
import com.vhans.core.redis.RedisService;
import com.vhans.core.strategy.context.SearchStrategyContext;
import com.vhans.core.utils.BeanUtils;
import com.vhans.core.utils.SpringUtils;
import com.vhans.core.utils.data.StringUtils;
import com.vhans.core.utils.web.PageUtils;
import com.vhans.core.web.model.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.Validator;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

import static com.vhans.core.constant.CommonConstant.FALSE;
import static com.vhans.core.constant.RedisConstant.*;
import static com.vhans.core.constant.TextContent.RECORD;

/**
 * 记录业务处理
 *
 * @author vhans
 */
@Service
public class AgreeRecordServiceImpl extends ServiceImpl<AgreeRecordMapper, AgreeRecord> implements IAgreeRecordService {

    @Autowired
    private AgreeRecordMapper recordMapper;

    @Autowired
    private TagTextMapper tagTextMapper;

    @Autowired
    private TagMapper tagMapper;

    @Autowired
    private UserCollectMapper userCollectMapper;

    @Autowired
    private UserLikeMapper userLikeMapper;

    @Autowired
    private ITagService tagService;

    @Autowired
    private RedisService redisService;

    @Autowired
    private SearchStrategyContext searchStrategyContext;

    @Override
    public List<AgreeRecord> listAgreeRecord(AgreeRecord.Query query) {
        // 查询记录信息
        List<AgreeRecord> records = recordMapper.selectAgreeRecord(query);
        // 封装记录信息
        return postRecord(records);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void addRecord(AgreeRecord record) {
        // 添加记录
        if (StringUtils.isBlank(record.getCover())) {
            SiteConfig siteConfig = redisService.getObject(SITE_SETTING);
            record.setCover(siteConfig.getCover());
        }
        record.setUserId(StpUtil.getLoginIdAsInt());
        recordMapper.insert(record);
        // 保存记录标签
        saveRecordTag(record);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteRecord(List<Integer> recordIdList) {
        // 删除记录标签
        tagTextMapper.delete(new LambdaQueryWrapper<TagText>()
                .in(TagText::getTypeId, recordIdList));
        // 删除记录
        recordMapper.deleteBatchIds(recordIdList);
    }

    @Transactional
    @Override
    public void updateRecordDelete(DeleteDTO delete) {
        // 批量更新记录删除状态
        List<AgreeRecord> agreeRecordList = delete.getIdList()
                .stream()
                .map(id -> AgreeRecord.builder()
                        .id(id)
                        .isDelete(delete.getIsDelete())
                        .isTop(FALSE)
                        .isRecommend(FALSE)
                        .likeNumber(0)
                        .collectNumber(0)
                        .build())
                .toList();
        this.updateBatchById(agreeRecordList);
        // 删除用户收藏和点赞
        List<Integer> recordIds = agreeRecordList.stream().map(AgreeRecord::getId).toList();
        userCollectMapper.delete(new LambdaQueryWrapper<UserCollect>()
                .in(UserCollect::getTypeId, recordIds));
        userLikeMapper.delete(new LambdaQueryWrapper<UserLike>()
                .eq(UserLike::getType, RECORD)
                .in(UserLike::getTypeId, recordIds));
    }

    @Override
    public void updateRecord(AgreeRecord record) {
        // 修改记录
        record.setUserId(StpUtil.getLoginIdAsInt());
        recordMapper.updateById(record);
        // 保存记录标签
        saveRecordTag(record);
    }

    @Override
    public AgreeRecord getRecordInfo(Integer recordId) {
        // 查询记录信息
        AgreeRecord record = recordMapper.selectRecordHomeById(recordId);
        Assert.notNull(record, "没有该记录,编号" + recordId);
        // 查询浏览量
        Double viewCount = Optional.ofNullable(redisService.getZsetScore(RECORD_VIEW_COUNT, recordId)).orElse((double) 0);
        // 查询点赞量
        Integer likeNumber = redisService.getHash(RECORD_LIKE_COUNT, recordId.toString());
        // 查询标签
        List<TagStatisticsVO> tags = Optional.ofNullable(tagMapper.selectTagByTypeId(recordId, RECORD)).orElse(new ArrayList<>());
        record.setViewCount(viewCount.intValue());
        // 设置当前点赞量为 持久点赞量 + 缓存点赞量
        record.setLikeNumber(record.getLikeNumber() + Optional.ofNullable(likeNumber).orElse(0));
        record.setTagList(tags);
        return record;
    }

    @Override
    public void updateRecordTop(TopDTO top) {
        // 修改记录置顶状态
        recordMapper.updateById(AgreeRecord.builder()
                .id(top.getId())
                .isTop(top.getIsTop())
                .build());
    }

    @Override
    public void updateRecordRecommend(RecommendDTO recommend) {
        // 修改记录推荐状态
        recordMapper.updateById(AgreeRecord.builder()
                .id(recommend.getId())
                .isRecommend(recommend.getIsRecommend())
                .build());
    }

    @Override
    public List<SearchVO> listRecordsBySearch(String keyword) {
        return searchStrategyContext.executeSearchStrategy(keyword, RECORD);
    }

    @Override
    public List<AgreeRecord> listRecordByTag(List<String> tagNames, boolean isInter) {
        if (isInter) {
            List<Integer> recordIds = tagMapper.selectTextIds(tagNames, RECORD);
            recordIds = recordIds.stream().filter(id -> {
                List<String> tagAllNames = tagMapper.selectTagNameByTypeId(id, RECORD);
                return new HashSet<>(tagAllNames).containsAll(tagNames);
            }).toList();
            PageUtils.startPage();
            return StringUtils.isNotEmpty(recordIds) ? postRecord(recordMapper.selectRecordHomeListByIds(recordIds)) : new ArrayList<>();
        } else {
            PageUtils.startPage();
            return postRecord(recordMapper.selectRecordByTag(tagNames));
        }
    }

    @Override
    public List<AgreeRecord> listHomeAgreeRecord(AgreeRecord.Query query) {
        // 查询首页记录
        List<AgreeRecord> records = recordMapper.listAgreeRecord(query);
        // 封装记录信息
        return postRecord(records);
    }

    @Override
    public AgreeRecord getRecordHomeById(Integer recordId) {
        // 查询记录信息
        AgreeRecord record = recordMapper.selectRecordHomeById(recordId);
        Assert.notNull(record, "没有该记录");
        // 浏览量+1
        redisService.incrZet(RECORD_VIEW_COUNT, recordId, 1D);
        // 查询上/下一篇记录
        PaginationVO lastRecord = recordMapper.selectLastRecord(recordId);
        PaginationVO nextRecord = recordMapper.selectNextRecord(recordId);
        // 查询浏览量
        Double viewCount = Optional.ofNullable(redisService.getZsetScore(RECORD_VIEW_COUNT, recordId)).orElse((double) 0);
        // 查询点赞量
        Integer likeNumber = redisService.getHash(RECORD_LIKE_COUNT, recordId.toString());
        // 查询标签
        List<TagStatisticsVO> tags = Optional.ofNullable(tagMapper.selectTagByTypeId(recordId, RECORD)).orElse(new ArrayList<>());
        record.setViewCount(viewCount.intValue());
        record.setLastRecord(lastRecord);
        record.setNextRecord(nextRecord);
        // 设置当前点赞量为 持久点赞量 + 缓存点赞量
        record.setLikeNumber(record.getLikeNumber() + Optional.ofNullable(likeNumber).orElse(0));
        record.setTagList(tags);
        return record;
    }

    @Override
    public List<OverviewVO> listRecordOverviewVO() {
        return recordMapper.selectOverviewRecordList();
    }

    @Override
    public List<AgreeRecord> listAgreeRecord() {
        List<AgreeRecord> records = recordMapper.listAgreeRecordR();
        return postRecord(records);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void collectRecord(Integer recordId) {
        AgreeRecord agreeRecord = recordMapper.selectOne(new LambdaQueryWrapper<AgreeRecord>()
                .eq(AgreeRecord::getId, recordId));
        Assert.notNull(agreeRecord, "记录不存在");
        // 判断用户是否收藏
        List<Integer> collect = userCollectMapper.selectList(new LambdaQueryWrapper<UserCollect>()
                        .select(UserCollect::getUserId, UserCollect::getTypeId)
                        .eq(UserCollect::getUserId, StpUtil.getLoginIdAsInt()))
                .stream()
                .map(UserCollect::getTypeId)
                .toList();
        if (collect.contains(recordId)) {
            // 取消收藏则删除用户的该收藏
            userCollectMapper.delete(new LambdaQueryWrapper<UserCollect>()
                    .eq(UserCollect::getUserId, StpUtil.getLoginIdAsInt())
                    .eq(UserCollect::getTypeId, recordId));
            // 记录收藏数-1
            agreeRecord.setCollectNumber(agreeRecord.getCollectNumber() - 1);
        } else {
            // 收藏则添加用户的该收藏
            userCollectMapper.saveUserCollect(StpUtil.getLoginIdAsInt(), RECORD, recordId);
            // 记录收藏数+1
            agreeRecord.setCollectNumber(agreeRecord.getCollectNumber() + 1);
        }
        recordMapper.updateById(agreeRecord);
    }

    @Override
    public String importData(List<AgreeRecord> list, Boolean isUpdate) {
        Assert.isTrue(StringUtils.isNotEmpty(list), "导入数据不能为空!");
        AtomicInteger successNum = new AtomicInteger();
        AtomicInteger failureNum = new AtomicInteger();
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        Validator validator = SpringUtils.getBean("validator");
        list.forEach(item -> {
            String mark = item.getTitle().substring(0, Math.min(5, item.getTitle().length()));
            try {
                if (!recordMapper.exists(new LambdaQueryWrapper<AgreeRecord>()
                        .eq(AgreeRecord::getTitle, item.getTitle()))) {
                    // 不存在这条数据
                    BeanUtils.validateWithException(validator, item);
                    recordMapper.insert(item);
                    successNum.getAndIncrement();
                    successMsg.append("<br/>").append(successNum).append("、数据 ").append(mark).append(" 导入成功");
                } else if (isUpdate) {
                    BeanUtils.validateWithException(validator, item);
                    successNum.getAndIncrement();
                    successMsg.append("<br/>").append(successNum).append("、数据 ").append(mark).append(" 更新成功");
                } else {
                    failureNum.getAndIncrement();
                    failureMsg.append("<br/>").append(failureNum).append("、数据 ").append(mark).append(" 已存在");
                }
            } catch (Exception e) {
                failureNum.getAndIncrement();
                String msg = "<br/>" + failureNum + "、数据 " + mark + " 导入失败：";
                failureMsg.append(msg).append(e.getMessage());
                log.error(msg, e);
            }
        });
        if (failureNum.get() > 0) {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

    /**
     * 封装记录信息
     *
     * @param list 原始记录列表
     * @return 封装后的记录列表
     */
    private List<AgreeRecord> postRecord(List<AgreeRecord> list) {
        list.forEach(item -> {
            // 查询记录浏览量
            Double viewCount = Optional.ofNullable(redisService.getZsetScore(RECORD_VIEW_COUNT, item.getId()))
                    .orElse((double) 0);
            // 查询记录点赞量
            Integer likeNumber = redisService.getHash(RECORD_LIKE_COUNT, item.getId().toString());
            // 查询记录标签
            List<TagStatisticsVO> tags = Optional.ofNullable(tagMapper.selectTagByTypeId(item.getId(), RECORD)).orElse(new ArrayList<>());
            item.setViewCount(viewCount.intValue());
            // 设置当前记录点赞量为 持久点赞量 + 缓存点赞量
            item.setLikeNumber(item.getLikeNumber() + Optional.ofNullable(likeNumber).orElse(0));
            item.setTagList(tags);
        });
        return list;
    }

    /**
     * 保存记录标签
     *
     * @param record 记录信息
     */
    private void saveRecordTag(AgreeRecord record) {
        // 删除记录标签
        tagTextMapper.delete(new LambdaQueryWrapper<TagText>()
                .eq(TagText::getType, RECORD)
                .eq(TagText::getTypeId, record.getId()));
        // 标签名列表
        List<String> tagNameList = record.getTagNameList();
        if (StringUtils.isNotEmpty(tagNameList)) {
            // 提供覆盖的标签
            List<Integer> coverTagIds = tagService.getCoverTag(tagNameList);
            // 将所有的新标签绑定到记录标签关联表
            tagTextMapper.saveBatchTag(RECORD, record.getId(), coverTagIds);
        }
    }
}
