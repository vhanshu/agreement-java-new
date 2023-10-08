package com.vhans.bus.chat.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.vhans.bus.chat.domain.Msg;
import com.vhans.bus.chat.mapper.MsgMapper;
import com.vhans.bus.chat.service.IMsgService;
import com.vhans.core.utils.data.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.vhans.core.constant.CommonConstant.FALSE;
import static com.vhans.core.constant.CommonConstant.TRUE;
import static com.vhans.core.constant.NumberConstant.*;

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
        Msg msg = msgMapper.selectOne(new LambdaQueryWrapper<Msg>()
                .select(Msg::getContent, Msg::getMsgType, Msg::getCreateTime)
                .eq(Msg::getFromUid, friendId)
                .eq(Msg::getToUid, userId)
                .or()
                .eq(Msg::getFromUid, userId)
                .eq(Msg::getToUid, friendId)
                .orderByDesc(Msg::getCreateTime)
                .last("LIMIT 1"));
        if (StringUtils.isNull(msg)) {
            return Msg.builder().content("初次相约,打个招呼吧").build();
        } else {
            switch (msg.getMsgType()) {
                case THREE -> msg.setContent("[图片]");
                case FOUR -> msg.setContent("[视频]");
                case FIVE -> msg.setContent("[语音]");
            }
            return msg;
        }
    }

    @Override
    public List<Msg> getRecentMsg(Integer friendId) {
        return msgMapper.selectRecentMsg(StpUtil.getLoginIdAsInt(), friendId);
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
        int userId = StpUtil.getLoginIdAsInt();
        Msg msg = msgMapper.selectById(msgId);
        if (msg.getFromUid().equals(userId)) {
            // 是自己的信息
            return msgMapper.deleteById(msgId);
        } else {
            return 0;
        }
    }

    @Override
    public int deleteMsgByIdIdList(List<Integer> idList) {
        // 删除用户聊天信息
        return msgMapper.deleteBatchIds(idList);
    }
}
