package com.vhans.bus.chat.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.chat.domain.Request;
import com.vhans.bus.chat.mapper.RequestMapper;
import com.vhans.bus.chat.service.IRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.vhans.core.constant.NumberConstant.ZERO;

/**
 * 好友请求Service业务层处理
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
        // 下面可以扩展信息delete
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
                .requestStatus(status).build());
    }

    @Override
    public Request insertRequest(Request request) {
        if (!requestMapper.exists(new LambdaQueryWrapper<Request>()
                .select(Request::getId)
                .eq(Request::getFromUid, request.getFromUid())
                .eq(Request::getToUid, request.getToUid())
                .eq(Request::getRequestStatus, ZERO))) {
            // 添加好友请求
            requestMapper.insert(request);
            return request;
        }
        return null;
    }
}
