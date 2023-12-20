package com.vhans.bus.chat.service;

import com.vhans.bus.chat.domain.Request;

import java.util.List;

/**
 * 好友请求Service接口
 *
 * @author vhans
 * @date 2023-05-21
 */
public interface IRequestService {

    /**
     * 查询好友请求列表
     *
     * @param query 条件
     * @return 好友请求集合
     */
    List<Request> selectRequestList(Request.Query query);

    /**
     * 获取好友请求编辑信息
     *
     * @param id 好友请求主键
     * @return 好友请求
     */
    Request selectRequestInfoById(Integer id);

    /**
     * 用户删除好友请求
     *
     * @param id 需要删除的好友请求主键
     * @return 影响行
     */
    int deleteRequestById(Integer id);

    /**
     * 批量删除好友请求
     *
     * @param idList 需要删除的好友请求主键列表
     * @return 影响行
     */
    int deleteRequestByIdIdList(List<Integer> idList);

    /**
     * 查询用户的好友请求列表
     *
     * @return 好友请求
     */
    List<Request> selectUserRequestList();

    /**
     * 查询我的请求列表
     *
     * @return 好友请求
     */
    List<Request> selectIRequestList();

    /**
     * 改变请求的状态
     * @param request 对方的请求
     */
    void changeFriendRequestStatus(Request request);

    /**
     * 新增请求
     *
     * @param request 请求
     * @return 影响行
     */
    int insertRequest(Request request);

}
