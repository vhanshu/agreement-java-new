package com.vhans.bus.data.strategy;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.transmit.config.NettyWsChannelInboundHandler;
import com.vhans.bus.transmit.model.PushData;
import com.vhans.bus.user.mapper.UserMapper;
import com.vhans.core.redis.RedisService;
import com.vhans.core.strategy.LikeStrategy;
import com.vhans.bus.data.domain.AgreeRecord;
import com.vhans.bus.data.mapper.AgreeRecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.vhans.core.constant.CommonConstant.FALSE;
import static com.vhans.core.constant.CommonConstant.TRUE;
import static com.vhans.core.constant.PushTypeConstant.PUSH_LIKE;
import static com.vhans.core.constant.RedisConstant.RECORD_LIKE_COUNT;
import static com.vhans.core.constant.RedisConstant.USER_RECORD_LIKE;
import static com.vhans.core.constant.ScoreConstant.LIKE_SCORE;

/**
 * 记录点赞策略
 *
 * @author vhans
 */
@Service("recordLikeStrategyImpl")
public class RecordLikeStrategyImpl implements LikeStrategy {
    @Autowired
    private RedisService redisService;

    @Autowired
    private AgreeRecordMapper recordMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public void like(Integer id) {
        // 判断记录是否存在或者是否进入回收站
        AgreeRecord obj = recordMapper.selectOne(new LambdaQueryWrapper<AgreeRecord>()
                .select(AgreeRecord::getUserId)
                .eq(AgreeRecord::getIsDelete, FALSE)
                .eq(AgreeRecord::getIsCheck, TRUE)
                .eq(AgreeRecord::getId, id));
        Assert.notNull(obj, "记录不存在或已回收");
        // 用户id作为键，记录id作为值，记录用户点赞记录
        String key = USER_RECORD_LIKE + StpUtil.getLoginIdAsInt();
        // 判断是否点赞
        if (redisService.hasSetValue(key, id)) {
            // 取消点赞则删除用户id中的记录id
            redisService.deleteSet(key, id);
            // 减少记录发布者热度
            userMapper.updateDegree(obj.getUserId(), LIKE_SCORE * -1);
            // 记录点赞量-1
            redisService.decrHash(RECORD_LIKE_COUNT, id.toString(), 1L);
            // 推送点赞量变化-1
            NettyWsChannelInboundHandler.pushInfo(PushData.builder().type(PUSH_LIKE).data("record#" + id + "#-1").build());
        } else {
            // 点赞则在用户id中记录记录id
            redisService.setSet(key, id);
            // 增加记录发布者热度
            userMapper.updateDegree(obj.getUserId(), LIKE_SCORE);
            // 记录点赞量+1
            redisService.incrHash(RECORD_LIKE_COUNT, id.toString(), 1L);
            // 推送点赞量变化+1
            NettyWsChannelInboundHandler.pushInfo(PushData.builder().type(PUSH_LIKE).data("record#" + id + "#1").build());
        }
    }
}
