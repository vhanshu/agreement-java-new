package com.vhans.bus.website.quartz;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.vhans.bus.agree.domain.Activity;
import com.vhans.bus.agree.domain.Appointment;
import com.vhans.bus.agree.domain.Competition;
import com.vhans.bus.agree.domain.Help;
import com.vhans.bus.agree.mapper.ActivityMapper;
import com.vhans.bus.agree.mapper.AppointmentMapper;
import com.vhans.bus.agree.mapper.CompetitionMapper;
import com.vhans.bus.agree.mapper.HelpMapper;
import com.vhans.bus.data.domain.AgreeRecord;
import com.vhans.bus.data.domain.Comment;
import com.vhans.bus.data.domain.Quiz;
import com.vhans.bus.data.domain.QuizAnswer;
import com.vhans.bus.data.mapper.AgreeRecordMapper;
import com.vhans.bus.data.mapper.CommentMapper;
import com.vhans.bus.data.mapper.QuizAnswerMapper;
import com.vhans.bus.data.mapper.QuizMapper;
import com.vhans.bus.log.mapper.VisitLogMapper;
import com.vhans.bus.user.mapper.UserLikeMapper;
import com.vhans.core.redis.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

import static com.vhans.core.constant.NumberConstant.*;
import static com.vhans.core.constant.RedisConstant.*;

/**
 * 执行定时任务
 *
 * @author vhans
 */
@SuppressWarnings(value = "all")
@Component("timedTask")
public class TimedTask {

    @Autowired
    private VisitLogMapper visitLogMapper;

    @Autowired
    private AppointmentMapper appointmentMapper;

    @Autowired
    private ActivityMapper activityMapper;

    @Autowired
    private CompetitionMapper competitionMapper;

    @Autowired
    private HelpMapper helpMapper;

    @Autowired
    private AgreeRecordMapper recordMapper;

    @Autowired
    private QuizMapper quizMapper;

    @Autowired
    private QuizAnswerMapper quizAnswerMapper;

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private UserLikeMapper userLikeMapper;

    @Autowired
    private RedisService redisService;

    /**
     * 清除平台访问记录
     */
    public void clear() {
        redisService.deleteObject(UNIQUE_VISITOR);
    }

    /**
     * 清除一周前的访问日志
     */
    public void clearVistiLog() {
        DateTime endTime = DateUtil.beginOfDay(DateUtil.offsetDay(new Date(), -7));
        visitLogMapper.deleteVisitLog(endTime);
    }

    /**
     * 每周设置持久点赞量
     */
    public void setLike() {
        // 用户id
        int userId = StpUtil.getLoginIdAsInt();
        // 获取用户点赞的记录ids及清除缓存
        String userLikeRecordKey = USER_RECORD_LIKE + userId;
        List<Integer> recordIds = redisService.getSet(userLikeRecordKey)
                .stream().map(item -> Integer.valueOf(item.toString())).toList();
        redisService.deleteSet(userLikeRecordKey);
        // 获取用户点赞的题目ids及清除缓存
        String userLikeQuizKey = USER_RECORD_LIKE + userId;
        List<Integer> quizIds = redisService.getSet(userLikeQuizKey)
                .stream().map(item -> Integer.valueOf(item.toString())).toList();
        redisService.deleteSet(userLikeQuizKey);
        // 获取用户点赞的评论ids及清除缓存
        String userLikeCommentKey = USER_RECORD_LIKE + userId;
        List<Integer> commentIds = redisService.getSet(userLikeCommentKey)
                .stream().map(item -> Integer.valueOf(item.toString())).toList();
        // 获取用户点赞的题目作答ids及清除缓存
        String userLikeAnswerKey = USER_ANSWER_LIKE + userId;
        List<Integer> answerIds = redisService.getSet(userLikeAnswerKey)
                .stream().map(item -> Integer.valueOf(item.toString())).toList();
        redisService.deleteSet(userLikeAnswerKey);
        // 将记录、题目、评论、题目作答的点赞信息添加入用户点赞数据库
        userLikeMapper.saveBatchUserLike(userId, ONE, recordIds);
        userLikeMapper.saveBatchUserLike(userId, TWO, quizIds);
        userLikeMapper.saveBatchUserLike(userId, THREE, commentIds);
        userLikeMapper.saveBatchUserLike(userId, FOUR, commentIds);
        // 设置记录、题目、评论的点赞量
        recordIds.forEach(item -> {
            Integer likeNumber = redisService.getHash(RECORD_LIKE_COUNT, item.toString());
            recordMapper.updateById(AgreeRecord.builder().id(item).likeNumber(likeNumber).build());
        });
        quizIds.forEach(item -> {
            Integer likeNumber = redisService.getHash(QUIZ_LIKE_COUNT, item.toString());
            quizMapper.updateById(Quiz.builder().id(item).likeNumber(likeNumber).build());
        });
        commentIds.forEach(item -> {
            Integer likeNumber = redisService.getHash(COMMENT_LIKE_COUNT, item.toString());
            commentMapper.updateById(Comment.builder().id(item).likeNumber(likeNumber).build());
        });
        answerIds.forEach(item -> {
            Integer likeNumber = redisService.getHash(ANSWER_LIKE_COUNT, item.toString());
            quizAnswerMapper.updateById(QuizAnswer.builder().id(item).likeNumber(likeNumber).build());
        });
    }

    /**
     * 每小时设置约起过期
     */
    public void setExpire() {
        List<Integer> appointmentIds = appointmentMapper.selectAppointmentExpire();
        List<Integer> activityIds = activityMapper.selectActivityExpire();
        List<Integer> competitionIds = competitionMapper.selectCompetitionExpire();
        List<Integer> helpIds = helpMapper.selectHelpExpire();
        appointmentIds.forEach(item -> {
            appointmentMapper.updateById(Appointment.builder().id(item).status(5).build());
        });
        activityIds.forEach(item -> {
            activityMapper.updateById(Activity.builder().id(item).status(5).build());
        });
        competitionIds.forEach(item -> {
            competitionMapper.updateById(Competition.builder().id(item).status(5).build());
        });
        helpIds.forEach(item -> {
            helpMapper.updateById(Help.builder().id(item).status(5).build());
        });
    }
}