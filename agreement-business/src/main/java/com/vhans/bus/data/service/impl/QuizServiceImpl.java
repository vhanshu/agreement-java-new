package com.vhans.bus.data.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.data.domain.Quiz;
import com.vhans.bus.data.domain.TagText;
import com.vhans.bus.data.domain.vo.OverviewVO;
import com.vhans.bus.data.domain.vo.TagOptionVO;
import com.vhans.bus.data.mapper.QuizMapper;
import com.vhans.bus.data.mapper.TagMapper;
import com.vhans.bus.data.mapper.TagTextMapper;
import com.vhans.bus.data.service.IQuizService;
import com.vhans.bus.data.service.ITagService;
import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import com.vhans.bus.user.domain.UserCollect;
import com.vhans.bus.user.mapper.UserCollectMapper;
import com.vhans.bus.website.domain.SiteConfig;
import com.vhans.core.redis.RedisService;
import com.vhans.core.strategy.context.SearchStrategyContext;
import com.vhans.core.utils.data.StringUtils;
import com.vhans.core.web.model.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import static com.vhans.core.constant.RedisConstant.*;
import static com.vhans.core.constant.TextContent.QUIZ;

/**
 * 题目业务处理
 *
 * @author vhans
 */
@Service
public class QuizServiceImpl extends ServiceImpl<QuizMapper, Quiz> implements IQuizService {

    @Autowired
    private QuizMapper quizMapper;

    @Autowired
    private TagTextMapper tagTextMapper;

    @Autowired
    private TagMapper tagMapper;

    @Autowired
    private UserCollectMapper userCollectMapper;

    @Autowired
    private ITagService tagService;

    @Autowired
    private RedisService redisService;

    @Autowired
    private SearchStrategyContext searchStrategyContext;

    @Override
    public List<Quiz> listQuiz(Quiz.Query query) {
        // 查询题目信息
        List<Quiz> quizVOList = quizMapper.selectQuizVO(query);
        return postQuiz(quizVOList);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void addQuiz(Quiz quiz) {
        // 添加题目
        if (StringUtils.isBlank(quiz.getCover())) {
            SiteConfig siteConfig = redisService.getObject(SITE_SETTING);
            quiz.setCover(siteConfig.getCover());
        }
        quiz.setUserId(StpUtil.getLoginIdAsInt());
        baseMapper.insert(quiz);
        // 保存题目标签
        saveQuizTag(quiz);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteQuiz(List<Integer> quizIdList) {
        // 删除题目标签
        tagTextMapper.delete(new LambdaQueryWrapper<TagText>()
                .in(TagText::getTypeId, quizIdList));
        // 删除题目
        quizMapper.deleteBatchIds(quizIdList);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateQuiz(Quiz quiz) {
        // 修改题目
        quiz.setUserId(StpUtil.getLoginIdAsInt());
        quizMapper.updateById(quiz);
        // 保存题目标签
        saveQuizTag(quiz);
    }

    @Override
    public Quiz getQuizInfo(Integer quizId) {
        // 查询题目信息
        Quiz quiz = quizMapper.selectById(quizId);
        Assert.notNull(quiz, "没有该题目,编号" + quizId);
        // 查询浏览量
        Double viewCount = Optional.ofNullable(redisService.getZsetScore(QUIZ_VIEW_COUNT, quizId)).orElse((double) 0);
        // 查询点赞量
        Integer likeNumber = redisService.getHash(QUIZ_LIKE_COUNT, quizId.toString());
        // 查询标签
        List<TagOptionVO> tags = Optional.ofNullable(tagMapper.selectTagByTypeId(quizId, QUIZ)).orElse(new ArrayList<>());
        quiz.setViewCount(viewCount.intValue());
        // 设置当前点赞量为 持久点赞量 + 缓存点赞量
        quiz.setLikeNumber(quiz.getLikeNumber() + Optional.ofNullable(likeNumber).orElse(0));
        quiz.setTagList(tags);
        return quiz;
    }

    @Override
    public List<SearchVO> listQuizBySearch(String keyword) {
        return searchStrategyContext.executeSearchStrategy(keyword, QUIZ);
    }

    @Override
    public List<Quiz> listQuizByTag(List<String> tagNames, boolean isInter) {
        if (isInter) {
            List<Integer> quizIds = tagMapper.selectTextIds(tagNames, QUIZ); //这里已被分页
            quizIds = quizIds.stream().filter(id -> {
                List<String> tagAllNames = tagMapper.selectTagNameByTypeId(id, QUIZ);
                return new HashSet<>(tagAllNames).containsAll(tagNames);
            }).toList();
            return StringUtils.isNotEmpty(quizIds) ? postQuiz(quizMapper.selectQuizHomeListByIds(quizIds)) : new ArrayList<>();
        } else {
            return postQuiz(quizMapper.selectQuizByTag(tagNames));
        }
    }

    @Override
    public List<Quiz> listQuizHome(Quiz.Query query) {
        // 查询前台题目
        List<Quiz> quizList = quizMapper.selectQuizHomeList(query);
        return postQuiz(quizList);
    }

    @Override
    public Quiz getQuizHomeById(Integer quizId) {
        // 查询题目信息
        Quiz quiz = quizMapper.selectQuizHomeById(quizId);
        Assert.notNull(quiz, "没有该题目");
        // 浏览量+1
        redisService.incrZet(QUIZ_VIEW_COUNT, quizId, 1D);
        // 查询上/下一篇题目
        PaginationVO lastQuiz = quizMapper.selectLastQuiz(quizId);
        PaginationVO nextQuiz = quizMapper.selectNextQuiz(quizId);
        // 查询浏览量
        Double viewCount = Optional.ofNullable(redisService.getZsetScore(QUIZ_VIEW_COUNT, quizId)).orElse((double) 0);
        // 查询点赞量
        Integer likeNumber = redisService.getHash(QUIZ_LIKE_COUNT, quizId.toString());
        // 查询标签
        List<TagOptionVO> tags = Optional.ofNullable(tagMapper.selectTagByTypeId(quizId, QUIZ)).orElse(new ArrayList<>());
        quiz.setLastQuiz(lastQuiz);
        quiz.setNextQuiz(nextQuiz);
        quiz.setViewCount(viewCount.intValue());
        // 设置当前点赞量为 持久点赞量 + 缓存点赞量
        quiz.setLikeNumber(quiz.getLikeNumber() + Optional.ofNullable(likeNumber).orElse(0));
        quiz.setTagList(tags);
        return quiz;
    }

    @Override
    public List<OverviewVO> listQuizOverviewVO() {
        return quizMapper.selectQuizList();
    }

    @Override
    public List<Quiz> listQuizLatest() {
        return quizMapper.selectQuizLatest();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void collectQuiz(Integer quizId) {
        Quiz quiz = quizMapper.selectOne(new LambdaQueryWrapper<Quiz>()
                .eq(Quiz::getId, quizId));
        Assert.notNull(quiz, "题目不存在");
        // 判断用户是否收藏
        List<Integer> collect = userCollectMapper.selectList(new LambdaQueryWrapper<UserCollect>()
                        .select(UserCollect::getUserId, UserCollect::getTypeId)
                        .eq(UserCollect::getUserId, StpUtil.getLoginIdAsInt()))
                .stream()
                .map(UserCollect::getTypeId)
                .toList();
        if (collect.contains(quizId)) {
            // 取消收藏则删除用户的该收藏
            userCollectMapper.delete(new LambdaQueryWrapper<UserCollect>()
                    .eq(UserCollect::getUserId, StpUtil.getLoginIdAsInt())
                    .eq(UserCollect::getTypeId, quizId));
            // 题目收藏数-1
            quiz.setCollectNumber(quiz.getCollectNumber() - 1);
        } else {
            // 收藏则添加用户的该收藏
            userCollectMapper.saveUserCollect(StpUtil.getLoginIdAsInt(), QUIZ, quizId);
            // 题目收藏数+1
            quiz.setCollectNumber(quiz.getCollectNumber() + 1);
        }
        quizMapper.updateById(quiz);
    }

    /**
     * 封装题目信息
     *
     * @param list 原始题目列表
     * @return 封装后的题目列表
     */
    private List<Quiz> postQuiz(List<Quiz> list) {
        list.forEach(item -> {
            // 查询浏览量
            Double viewCount = Optional.ofNullable(redisService.getZsetScore(QUIZ_VIEW_COUNT, item.getId()))
                    .orElse((double) 0);
            // 查询点赞量
            Integer likeNumber = redisService.getHash(QUIZ_LIKE_COUNT, item.getId().toString());
            // 查询标签
            List<TagOptionVO> tags = Optional.ofNullable(tagMapper.selectTagByTypeId(item.getId(), QUIZ)).orElse(new ArrayList<>());
            item.setViewCount(viewCount.intValue());
            // 设置当前点赞量为 持久点赞量 + 缓存点赞量
            item.setLikeNumber(item.getLikeNumber() + Optional.ofNullable(likeNumber).orElse(0));
            item.setTagList(tags);
        });
        return list;
    }

    /**
     * 保存题目标签
     *
     * @param quiz 题目信息
     */
    private void saveQuizTag(Quiz quiz) {
        // 删除题目标签
        tagTextMapper.delete(new LambdaQueryWrapper<TagText>()
                .eq(TagText::getTypeId, quiz.getId()));
        // 标签名列表
        List<String> tagNameList = quiz.getTagNameList();
        if (StringUtils.isNotEmpty(tagNameList)) {
            // 提供覆盖的标签
            List<Integer> coverTagIds = tagService.getCoverTag(tagNameList);
            // 将所有的新标签绑定到题目标签关联表
            tagTextMapper.saveBatchTag(quiz.getId(), QUIZ, coverTagIds);
        }
    }
}
