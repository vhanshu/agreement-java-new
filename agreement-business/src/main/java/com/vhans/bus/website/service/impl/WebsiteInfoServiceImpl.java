package com.vhans.bus.website.service.impl;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.vhans.bus.agree.domain.Activity;
import com.vhans.bus.agree.domain.Appointment;
import com.vhans.bus.agree.domain.Competition;
import com.vhans.bus.agree.domain.Help;
import com.vhans.bus.agree.service.IActivityService;
import com.vhans.bus.agree.service.IAppointmentService;
import com.vhans.bus.agree.service.ICompetitionService;
import com.vhans.bus.agree.service.IHelpService;
import com.vhans.bus.data.domain.AgreeRecord;
import com.vhans.bus.data.domain.Quiz;
import com.vhans.bus.data.domain.vo.RankVO;
import com.vhans.bus.data.domain.vo.StatisticsVO;
import com.vhans.bus.data.domain.vo.TagStatisticsVO;
import com.vhans.bus.data.mapper.AgreeRecordMapper;
import com.vhans.bus.data.mapper.QuizMapper;
import com.vhans.bus.data.mapper.TagMapper;
import com.vhans.bus.log.domain.vo.UserViewVO;
import com.vhans.bus.log.mapper.VisitLogMapper;
import com.vhans.bus.user.mapper.UserMapper;
import com.vhans.bus.website.domain.SiteConfig;
import com.vhans.bus.website.domain.vo.WebsiteInfoVO;
import com.vhans.bus.website.service.IWebsiteInfoService;
import com.vhans.core.redis.RedisService;
import com.vhans.core.utils.SpringUtils;
import com.vhans.core.utils.web.IpUtils;
import com.vhans.core.utils.web.UserAgentUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.*;

import static com.vhans.core.constant.CommonConstant.FALSE;
import static com.vhans.core.constant.NumberConstant.ONE;
import static com.vhans.core.constant.NumberConstant.THREE;
import static com.vhans.core.constant.RedisConstant.*;
import static com.vhans.core.enums.CheckStatusEnum.PASS;

/**
 * 网站信息业务接口实现类
 *
 * @author vhans
 **/
@Service
public class WebsiteInfoServiceImpl implements IWebsiteInfoService {

    @Autowired
    private AgreeRecordMapper agreeRecordMapper;

    @Autowired
    private QuizMapper quizMapper;

    @Autowired
    private TagMapper tagMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private VisitLogMapper visitLogMapper;

    @Autowired
    private RedisService redisService;

    @Autowired
    private HttpServletRequest request;

    @Override
    public void report() {
        // 获取用户ip
        String ipAddress = IpUtils.getIpAddress(request);
        Map<String, String> userAgentMap = UserAgentUtils.parseOsAndBrowser(request.getHeader("User-Agent"));
        // 获取访问设备
        String browser = userAgentMap.get("browser");
        String os = userAgentMap.get("os");
        // 生成唯一用户标识
        String uuid = ipAddress + browser + os;
        String md5 = DigestUtils.md5DigestAsHex(uuid.getBytes());
        // 判断是否访问
        if (!redisService.hasSetValue(UNIQUE_VISITOR, md5)) {
            // 访问量+1
            redisService.incr(WEBSITE_VIEW_COUNT, 1);
            // 保存唯一标识
            redisService.setSet(UNIQUE_VISITOR, md5);
        }
    }

    @Override
    public WebsiteInfoVO getWebsiteInfo() {
        // 访问量
        Integer viewCount = redisService.getObject(WEBSITE_VIEW_COUNT);
        // 用户量
        Long userCount = userMapper.selectCount(null);
        // 记录量
        Long recordCount = agreeRecordMapper.selectCount(new LambdaQueryWrapper<AgreeRecord>()
                .eq(AgreeRecord::getIsDelete, FALSE));
        // 题目量
        Long quizCount = quizMapper.selectCount(new LambdaQueryWrapper<Quiz>()
                .eq(Quiz::getIsCheck, PASS.getStatus()));
        // 正在进行的约起量(类型->数量)
        List<WebsiteInfoVO.AgreeCount> agreeCount = getAgreeCount();
        // 标签数据
        List<TagStatisticsVO> tagVOList = tagMapper.selectTagOptionAllList();
        // 查询前七天用户浏览
        DateTime startTime = DateUtil.beginOfDay(DateUtil.offsetDay(new Date(), -7));
        DateTime endTime = DateUtil.endOfDay(new Date());
        List<UserViewVO> userViewVOList = visitLogMapper.selectUserViewList(startTime, endTime);
        // 记录统计
        List<StatisticsVO> recordStatisticsList = agreeRecordMapper.selectRecordStatistics();
        // 题目统计
        List<StatisticsVO> quizStatisticsList = quizMapper.selectQuizStatistics();
        // 查询访问量前五的记录
        Map<Object, Double> recordMap = redisService.zReverseRangeWithScore(RECORD_VIEW_COUNT, 0, 4);
        // 查询访问量前五的题目
        Map<Object, Double> quizMap = redisService.zReverseRangeWithScore(QUIZ_VIEW_COUNT, 0, 4);
        WebsiteInfoVO websiteInfo = WebsiteInfoVO.builder()
                .tagList(tagVOList)
                .viewCount(viewCount)
                .userCount(userCount)
                .recordCount(recordCount)
                .quizCount(quizCount)
                .agreeCount(agreeCount)
                .recordStatisticsList(recordStatisticsList)
                .quizStatisticsList(quizStatisticsList)
                .userViewList(userViewVOList)
                .build();
        if (CollectionUtils.isNotEmpty(recordMap)) {
            // 查询记录排行
            List<RankVO> recordRankVOList = listRecordRank(recordMap);
            websiteInfo.setRecordRankList(recordRankVOList);
            // 查询题目排行
            List<RankVO> quizRankVOList = listQuizRank(quizMap);
            websiteInfo.setQuizRankList(quizRankVOList);
        }
        return websiteInfo;
    }

    @Override
    public SiteConfig getSiteConfig() {
        return redisService.getObject(SITE_SETTING);
    }

    /**
     * 获取正在进行的约起量
     *
     * @return Map:类型->数量
     */
    private List<WebsiteInfoVO.AgreeCount> getAgreeCount() {
        IAppointmentService appointmentService = SpringUtils.getBean("appointmentServiceImpl");
        IActivityService activityService = SpringUtils.getBean("activityServiceImpl");
        ICompetitionService competitionService = SpringUtils.getBean("competitionServiceImpl");
        IHelpService helpService = SpringUtils.getBean("helpServiceImpl");
        List<WebsiteInfoVO.AgreeCount> agreeCount = new ArrayList<>(4);
        agreeCount.add(new WebsiteInfoVO.AgreeCount("约会", appointmentService.count(new LambdaQueryWrapper<Appointment>()
                .in(Appointment::getStatus, Arrays.asList(ONE, THREE))
                .gt(Appointment::getTimeEnd, LocalDateTime.now()))));
        agreeCount.add(new WebsiteInfoVO.AgreeCount("活动", activityService.count(new LambdaQueryWrapper<Activity>()
                .in(Activity::getStatus, Arrays.asList(ONE, THREE))
                .gt(Activity::getTimeEnd, LocalDateTime.now()))));
        agreeCount.add(new WebsiteInfoVO.AgreeCount("赛事", competitionService.count(new LambdaQueryWrapper<Competition>()
                .in(Competition::getStatus, Arrays.asList(ONE, THREE))
                .gt(Competition::getTimeEnd, LocalDateTime.now()))));
        agreeCount.add(new WebsiteInfoVO.AgreeCount("帮助", helpService.count(new LambdaQueryWrapper<Help>()
                .in(Help::getStatus, Arrays.asList(ONE, THREE))
                .gt(Help::getTimeEnd, LocalDateTime.now()))));
        return agreeCount;
    }

    /**
     * 查询记录排行
     *
     * @param recordMap 记录浏览量信息
     * @return {@link List<RankVO>} 记录排行
     */
    private List<RankVO> listRecordRank(Map<Object, Double> recordMap) {
        // 提取记录id
        List<Integer> recordIdList = new ArrayList<>(recordMap.size());
        recordMap.forEach((key, value) -> recordIdList.add((Integer) key));
        // 查询记录信息
        List<AgreeRecord> agreeRecordList = agreeRecordMapper.selectList(new LambdaQueryWrapper<AgreeRecord>()
                .select(AgreeRecord::getId, AgreeRecord::getTitle)
                .in(AgreeRecord::getId, recordIdList));
        return agreeRecordList.stream()
                .map(item -> RankVO.builder()
                        .title(item.getTitle())
                        .viewCount(recordMap.get(item.getId()).intValue())
                        .build())
                .sorted(Comparator.comparingInt(RankVO::getViewCount).reversed())
                .toList();
    }

    /**
     * 查询题目排行
     *
     * @param quizMap 题目浏览量信息
     * @return {@link List<RankVO>} 题目排行
     */
    private List<RankVO> listQuizRank(Map<Object, Double> quizMap) {
        // 提取记录id
        List<Integer> quizIdList = new ArrayList<>(quizMap.size());
        quizMap.forEach((key, value) -> quizIdList.add((Integer) key));
        // 查询记录信息
        List<Quiz> quizList = quizMapper.selectList(new LambdaQueryWrapper<Quiz>()
                .select(Quiz::getId, Quiz::getTitle)
                .in(Quiz::getId, quizIdList));
        return quizList.stream()
                .map(item -> RankVO.builder()
                        .title(item.getTitle())
                        .viewCount(quizMap.get(item.getId()).intValue())
                        .build())
                .sorted(Comparator.comparingInt(RankVO::getViewCount).reversed())
                .toList();
    }
}
