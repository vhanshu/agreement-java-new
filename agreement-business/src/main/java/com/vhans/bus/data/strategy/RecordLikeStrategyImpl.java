package com.vhans.bus.data.strategy;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.core.redis.RedisService;
import com.vhans.core.strategy.LikeStrategy;
import com.vhans.core.utils.data.StringUtils;
import com.vhans.bus.data.domain.AgreeRecord;
import com.vhans.bus.data.mapper.AgreeRecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.vhans.core.constant.CommonConstant.TRUE;
import static com.vhans.core.constant.RedisConstant.RECORD_LIKE_COUNT;
import static com.vhans.core.constant.RedisConstant.USER_RECORD_LIKE;

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

    @Override
    public void like(Integer recordId) {
        // 判断记录是否存在或者是否进入回收站
        AgreeRecord agreeRecord = recordMapper.selectOne(new LambdaQueryWrapper<AgreeRecord>()
                .select(AgreeRecord::getId, AgreeRecord::getIsDelete)
                .eq(AgreeRecord::getId, recordId));
        Assert.isFalse(StringUtils.isNull(agreeRecord) || agreeRecord.getIsDelete().equals(TRUE), "记录不存在");
        // 用户id作为键，记录id作为值，记录用户点赞记录
        String userLikeRecordKey = USER_RECORD_LIKE + StpUtil.getLoginIdAsInt();
        // 判断是否点赞
        if (redisService.hasSetValue(userLikeRecordKey, recordId)) {
            // 取消点赞则删除用户id中的记录id
            redisService.deleteSet(userLikeRecordKey, recordId);
            // 记录点赞量-1
            redisService.decrHash(RECORD_LIKE_COUNT, recordId.toString(), 1L);
        } else {
            // 点赞则在用户id记录记录id
            redisService.setSet(userLikeRecordKey, recordId);
            // 记录点赞量+1
            redisService.incrHash(RECORD_LIKE_COUNT, recordId.toString(), 1L);
        }
    }
}
