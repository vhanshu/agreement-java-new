package com.vhans.bus.chat.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.chat.domain.Request;
import com.vhans.bus.chat.mapper.RequestMapper;
import com.vhans.bus.chat.service.IRequestService;
import com.vhans.core.exception.ServiceException;
import com.vhans.core.utils.data.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.vhans.core.constant.NumberConstant.*;

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
    public void changeFriendRequestStatus(Integer requestId, Integer status) {
        requestMapper.updateById(Request.builder()
                .id(requestId)
                .status(status).build());
    }

    @Override
    public int insertRequest(Request request) {
        //这里要考虑之前请求的情况
        Request oldRequest = requestMapper.selectOne(new LambdaQueryWrapper<Request>()
                .select(Request::getId, Request::getStatus)
                .eq(Request::getFromUid, request.getFromUid())
                .eq(Request::getToUid, request.getToUid()));
        if (StringUtils.isNull(oldRequest)) {
            // 添加好友请求
            return requestMapper.insert(request);
        } else {
            switch (oldRequest.getStatus()) {
                case ZERO -> throw new ServiceException("已发送请求,等待对方同意");
                case ONE -> throw new ServiceException("对方已同意,无需发送");
                case TWO -> throw new ServiceException("已被对方拒绝,请3天后尝试再次请求");
            }
            return 0;
        }
    }
}
