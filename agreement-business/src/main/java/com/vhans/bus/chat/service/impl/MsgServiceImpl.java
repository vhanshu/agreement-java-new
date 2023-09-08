package com.vhans.bus.chat.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.chat.domain.Msg;
import com.vhans.bus.chat.mapper.MsgMapper;
import com.vhans.bus.chat.service.IMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.vhans.core.constant.CommonConstant.FALSE;
import static com.vhans.core.constant.CommonConstant.TRUE;

/**
 * 用户聊天信息Service业务层处理
 *
 * @author vhans
 * @date 2023-05-21
 */
@Service("msgServiceImpl")
public class MsgServiceImpl implements IMsgService {

    @Autowired
    private MsgMapper msgMapper;

    @Override
    public List<Msg> selectMsgList(Msg.Query query) {
        // 查询用户聊天信息信息
        return msgMapper.selectMsgList(query);
    }

    @Override
    public Msg getLastMsg(Integer userId, Integer friendId) {
        // 查询最后一条消息
        return msgMapper.selectOne(new LambdaQueryWrapper<Msg>()
                .select(Msg::getId, Msg::getMsgType, Msg::getContent, Msg::getCreateTime)
                .eq(Msg::getFromUid, friendId)
                .eq(Msg::getToUid, userId)
                .or()
                .eq(Msg::getFromUid, userId)
                .eq(Msg::getToUid, friendId)
                .orderByDesc(Msg::getCreateTime)
                .last("LIMIT 1"));
    }

    @Override
    public List<Msg> getRecentMsg(Integer friendId) {
        Assert.notNull(friendId, "好友不能为空");
        int userId = StpUtil.getLoginIdAsInt();
        return msgMapper.selectList(new LambdaQueryWrapper<Msg>()
                .eq(Msg::getFromUid, userId)
                .eq(Msg::getToUid, friendId)
                .or()
                .eq(Msg::getFromUid, friendId)
                .eq(Msg::getToUid, userId));
    }

    @Override
    public void batchReadMsg(Integer friendId) {
        // 读取我的未读消息
        msgMapper.selectList(new LambdaQueryWrapper<Msg>()
                .select(Msg::getId)
                .eq(Msg::getFromUid, friendId)
                .eq(Msg::getToUid, StpUtil.getLoginIdAsInt())
                .eq(Msg::getIsRead, FALSE)).forEach(item ->
                msgMapper.updateById(Msg.builder().id(item.getId()).isRead(TRUE).build()));
    }

    @Override
    public int insertMsg(Msg msg) {
        return msgMapper.insert(msg);
    }

    @Override
    public int deleteMsg(Integer msgId) {
        return msgMapper.deleteById(msgId);
    }

    @Override
    public int deleteMsgByIdIdList(List<Integer> idList) {
        // 删除用户聊天信息
        return msgMapper.deleteBatchIds(idList);
    }
}
