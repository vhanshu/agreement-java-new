package com.vhans.bus.chat.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.chat.domain.Request;
import com.vhans.bus.chat.mapper.RequestMapper;
import com.vhans.bus.chat.service.IRequestService;
import com.vhans.core.exception.TransmitException;
import com.vhans.core.redis.RedisService;
import com.vhans.core.utils.data.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.vhans.core.constant.NumberConstant.*;
import static com.vhans.core.constant.RedisConstant.REQUEST_REJECT;

/**
 * 请求Service业务层处理
 *
 * @author vhans
 * @date 2023-05-21
 */
@Service("requestServiceImpl")
public class RequestServiceImpl implements IRequestService {

    @Autowired
    private RequestMapper requestMapper;

    @Autowired
    private RedisService redisService;

    @Override
    public List<Request> selectRequestList(Request.Query query) {
        // 查询好友请求信息
        return requestMapper.selectRequestList(query);
    }

    @Override
    public Request selectRequestInfoById(Integer id) {
        // 查询好友请求信息
        Request cRequest = requestMapper.selectById(id);
        Assert.notNull(cRequest, "没有该好友请求");
        return cRequest;
    }

    @Override
    public int deleteRequestById(Integer id) {
        int userId = StpUtil.getLoginIdAsInt();
        Request oldRequest = requestMapper.selectById(id);
        Assert.notNull(oldRequest, "没有该好友请求");
        Assert.isTrue(oldRequest.getFromUid() == userId || oldRequest.getToUid() == userId, "没有权限删除该好友请求");
        if (oldRequest.getDelStatus() == 0) {
            int delStatus = oldRequest.getFromUid() == userId ? ONE : TWO;
            return requestMapper.updateById(Request.builder().id(id).delStatus(delStatus).build());
        } else {
            return requestMapper.deleteById(id);
        }
    }

    @Override
    public int deleteRequestByIdIdList(List<Integer> idList) {
        // 删除好友请求
        return requestMapper.deleteBatchIds(idList);
    }

    @Override
    public List<Request> selectUserRequestList() {
        int userId = StpUtil.getLoginIdAsInt();
        return requestMapper.selectUserRequestList(userId);
    }

    @Override
    public List<Request> selectIRequestList() {
        int userId = StpUtil.getLoginIdAsInt();
        return requestMapper.selectIRequestList(userId);
    }

    @Override
    public void changeFriendRequestStatus(Request request) {
        if (request.getStatus() == TWO && !redisService.hasSetValue(REQUEST_REJECT, request.getFromUid() + "_" + request.getToUid())) {
            // 更新Redis缓存中对方的拒绝用户ids
            redisService.setSet(REQUEST_REJECT, request.getFromUid() + "_" + request.getToUid());
        }
        requestMapper.updateById(Request.builder()
                .id(request.getId())
                .status(request.getStatus()).build());
    }

    @Override
    public int insertRequest(Request request) {
        if (requestMapper.exists(new LambdaQueryWrapper<Request>()
                .eq(Request::getFromUid, request.getToUid())
                .eq(Request::getToUid, request.getFromUid()))) {
            throw new TransmitException("对方已发送请求给你,快去看看吧");
        }
        //这里要考虑之前请求的情况
        Request oldRequest = requestMapper.selectOne(new LambdaQueryWrapper<Request>()
                .select(Request::getId, Request::getStatus)
                .eq(Request::getFromUid, request.getFromUid())
                .eq(Request::getToUid, request.getToUid()));
        if (StringUtils.isNull(oldRequest)) {
            // 缓存中查找对方最近是否拒绝我
            if (redisService.hasSetValue(REQUEST_REJECT, request.getToUid() + request.getFromUid())) {
                throw new TransmitException("对方已拒绝,请3天后尝试再次请求");
            }
            // 添加好友请求
            return requestMapper.insert(request);
        } else {
            switch (oldRequest.getStatus()) {
                case ONE -> throw new TransmitException("对方已同意,无需发送");
                case TWO -> throw new TransmitException("已被对方拒绝,请3天后尝试再次请求");
                case THREE -> throw new TransmitException("已发送请求,等待对方同意");
            }
            return 0;
        }
    }
}
