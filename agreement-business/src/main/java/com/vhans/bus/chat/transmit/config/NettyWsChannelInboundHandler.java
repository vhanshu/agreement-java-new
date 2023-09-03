package com.vhans.bus.chat.transmit.config;

import cn.hutool.json.JSONUtil;
import com.vhans.bus.chat.domain.Friend;
import com.vhans.bus.chat.domain.GroupMsg;
import com.vhans.bus.chat.domain.Msg;
import com.vhans.bus.chat.domain.Request;
import com.vhans.bus.chat.service.*;
import com.vhans.bus.chat.transmit.model.DataContent;
import com.vhans.core.utils.SpringUtils;
import com.vhans.core.utils.data.StringUtils;
import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.util.concurrent.GlobalEventExecutor;
import lombok.extern.log4j.Log4j2;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import static com.vhans.core.constant.MsgActionConstant.*;

/**
 * 处理消息
 * TextWebSocketFrame: 在netty中，用于为websocket专门处理文本的对象，frame是消息的载体
 * SimpleChannelInboundHandler: 对于请求来讲，相当于入站
 *
 * @author vhans
 */
@Log4j2
public class NettyWsChannelInboundHandler extends SimpleChannelInboundHandler<TextWebSocketFrame> {

    /**
     * 获取业务处理bean: 好友、群组、用户消息、群消息、请求
     */
    private final IFriendService friendService = SpringUtils.getBean("friendServiceImpl");
    private final IGroupService groupService = SpringUtils.getBean("groupServiceImpl");
    private final IMsgService msgService = SpringUtils.getBean("msgServiceImpl");
    private final IGroupMsgService groupMsgService = SpringUtils.getBean("groupMsgServiceImpl");
    private final IRequestService requestService = SpringUtils.getBean("requestServiceImpl");

    /**
     * 用于记录和管理所有客户端的channel
     */
    public static ChannelGroup users = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);

    /**
     * 用户id -> Channel
     */
    private static final Map<Integer, Channel> manager = new ConcurrentHashMap<>();

    /**
     * 从channel缓冲区读数据,开始处理
     */
    @Override
    protected void channelRead0(ChannelHandlerContext ctx, TextWebSocketFrame msg) throws Exception {
        // 获得channel
        Channel currentChannel = ctx.channel();
        // 获取客户端发来的消息并转换JSON为entity
        DataContent dataContent = JSONUtil.toBean(msg.text(), DataContent.class);
        switch (dataContent.getAction()) {
            case CONNECT -> connect(dataContent, currentChannel);
            case CHAT -> chat(dataContent);
            case GROUP_MSG -> groupMsg(dataContent);
            case SEND_REQUEST -> sendRequest(dataContent);
            case DEAL_REQUEST -> dealRequest(dataContent);
            case KEEPALIVE -> keepalive(currentChannel);
            case CLOSE_GROUP -> closeGroup(dataContent);
            case FORWARD -> forward(dataContent);
            default -> log.info("非法操作 channelId={}", ctx.channel().id().asShortText());
        }
    }

    /**
     * 当客户端连接服务端之后（打开连接）
     * 获取客户端的channel，并且放到ChannelGroup中去进行管理
     */
    @Override
    public void handlerAdded(ChannelHandlerContext ctx) throws Exception {
        users.add(ctx.channel());
        log.info("channelId[ {} ]获得连接", ctx.channel().id().asShortText());
    }

    /**
     * 当触发handlerRemoved，ChannelGroup会自动移除对应客户端的channel
     */
    @Override
    public void handlerRemoved(ChannelHandlerContext ctx) throws Exception {
        users.remove(ctx.channel());
        removeByChannel(ctx.channel());
        log.info("客户端被移除,channelId={}", ctx.channel().id().asShortText());
    }

    /**
     * 发生异常之后关闭channel
     */
    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        cause.printStackTrace();
        ctx.channel().close();
        // 从ChannelGroup中移除channel
        users.remove(ctx.channel());
        removeByChannel(ctx.channel());
        log.info("连接异常!!!,channelId={}", ctx.channel().id().asShortText());
    }

    /**
     * 处理 websocket 第一次open的时候
     */
    private void connect(DataContent content, Channel channel) {
        // 把channel和userid关联起来
        manager.put(content.getExtend().getUserId(), channel);
        log.info("开始打印用户连接信息");
        for (Map.Entry<Integer, Channel> entry : manager.entrySet()) {
            log.info("UserId={},ChannelId={} 连接成功", entry.getKey(), entry.getValue().id().asLongText());
        }
    }

    /**
     * 单独聊天类型的消息，把聊天记录保存到数据库，同时标记消息的签收状态[数据库默认未签收]
     */
    private void chat(DataContent content) {
        Msg chatMsg = content.getChatMsg();
        // 保存消息到数据库
        content.setChatMsg(msgService.insertMsg(Msg.builder()
                .fromUid(chatMsg.getFromUid())
                .toUid(chatMsg.getToUid())
                .msgType(chatMsg.getMsgType())
                .content(chatMsg.getContent())
                .build()));
        // 给自己发送成功消息
        Channel fromUidChannel = manager.get(chatMsg.getFromUid());
        fromUidChannel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(content)));
        // 发送消息 从全局用户Channel关系中获取接受方的channel
        Channel chanel = getChanel(chatMsg.getToUid());
        if (StringUtils.isNotNull(chanel)) {
            // 用户在线
            chanel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(content)));
            log.info("发送单聊消息 fromUid={},toUid={}", chatMsg.getFromUid(), chatMsg.getToUid());
        } else {
            log.info("发送单聊消息(对方离线) fromUid={},toUid={}", chatMsg.getFromUid(), chatMsg.getToUid());
        }
    }

    /**
     * 发送群消息
     */
    private void groupMsg(DataContent content) {
        // 群消息发送
        GroupMsg chatGroupMsg = content.getChatGroupMsg();
        // 保存消息到数据库
        content.setChatGroupMsg(groupMsgService.insertGroupMsg(GroupMsg.builder()
                .groupId(chatGroupMsg.getGroupId())
                .userId(chatGroupMsg.getUserId())
                .msgType(chatGroupMsg.getMsgType())
                .content(chatGroupMsg.getContent())
                .build()));
        // 获取群用户ids
        List<Integer> userIds = groupService.getUserIds(chatGroupMsg.getGroupId());
        // 在指定群给所有在线群用户发送信息
        userIds.forEach(item -> {
            // 获取用户通道
            Channel chanel = getChanel(item);
            if (StringUtils.isNotNull(chanel)) {
                // 用户在线
                chanel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(content)));
            }
        });
        log.info("发送群聊消息 groupId={},userId={}", chatGroupMsg.getGroupId(), chatGroupMsg.getUserId());
    }

    /**
     * 发送请求
     */
    private void sendRequest(DataContent content) {
        Request chatRequest = content.getChatRequest();
        // 好友请求
        if (chatRequest.getType() == 1) {
            // 保存请求到数据库
            content.setChatRequest(requestService.insertRequest(Request.builder()
                    .type(chatRequest.getType())
                    .fromUid(chatRequest.getFromUid())
                    .toUid(chatRequest.getToUid())
                    .reason(chatRequest.getReason())
                    .build()));
            // 发送请求 从全局用户Channel关系中获取接受方的channel
            Channel chanel = getChanel(chatRequest.getToUid());
            if (StringUtils.isNotNull(chanel)) {
                // 用户在线
                chanel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(content)));
                log.info("发送好友请求 fromUid={},toUid={}", chatRequest.getFromUid(), chatRequest.getToUid());
            } else {
                log.info("发送好友请求(对方离线) fromUid={},toUid={}", chatRequest.getFromUid(), chatRequest.getToUid());
            }
        }
        // 入群请求
        else if (chatRequest.getType() == 2) {
            // 保存请求到数据库
            content.setChatRequest(requestService.insertRequest(Request.builder()
                    .groupId(chatRequest.getGroupId())
                    .type(chatRequest.getType())
                    .fromUid(chatRequest.getFromUid())
                    .toUid(chatRequest.getToUid())
                    .reason(chatRequest.getReason())
                    .build()));
            // 群主id
            Integer masterId = groupService.selectGroupInfoById(chatRequest.getGroupId()).getMasterId();
            // 发送请求 从全局用户Channel关系中获取群主的channel
            Channel chanel = getChanel(masterId);
            if (StringUtils.isNotNull(chanel)) {
                // 群主在线
                chanel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(content)));
                log.info("发送入群请求 fromUid={},masterId={}", chatRequest.getFromUid(), masterId);
            } else {
                log.info("发送入群请求(对方离线) fromUid={},masterId={}", chatRequest.getFromUid(), masterId);
            }
        }
    }

    /**
     * 处理请求
     */
    private void dealRequest(DataContent content) {
        Request chatRequest = content.getChatRequest();
        // 好友请求
        if (chatRequest.getType() == 1) {
            // 同意
            if (chatRequest.getRequestStatus() == 1) {
                // 添加好友入库,好友备注从扩展字段里取
                int row = friendService.insertFriend(Friend.builder()
                        .userId(chatRequest.getToUid())
                        .friendId(chatRequest.getFromUid())
                        .friendRemark(content.getExtend().getNickName()).build());
                if (row <= 0) {
                    log.info("同意好友请求失败 fromUid={},toUid={}", chatRequest.getFromUid(), chatRequest.getToUid());
                    return;
                }
                // 通知发送方同意请求
                // 获取发送方channel
                Channel chanel = getChanel(chatRequest.getFromUid());
                if (StringUtils.isNotNull(chanel)) {
                    // 发送方在线
                    chanel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(content)));
                    // 这里是通知发送方,ft反置
                    log.info("同意好友请求 fromUid={},toUid={}", chatRequest.getToUid(), chatRequest.getFromUid());
                } else {
                    log.info("同意好友请求(对方离线) fromUid={},toUid={}", chatRequest.getToUid(), chatRequest.getFromUid());
                }
            }
            // 拒绝
            else if (chatRequest.getRequestStatus() == 2) {
                // 通知发送方拒绝请求
                // 获取发送方channel
                Channel chanel = getChanel(chatRequest.getFromUid());
                if (StringUtils.isNotNull(chanel)) {
                    // 发送方在线
                    chanel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(content)));
                    // 这里是通知发送方,ft反置
                    log.info("拒绝好友请求 fromUid={},toUid={}", chatRequest.getToUid(), chatRequest.getFromUid());
                } else {
                    log.info("拒绝好友请求(对方离线) fromUid={},toUid={}", chatRequest.getToUid(), chatRequest.getFromUid());
                }
            }
            // 更改请求状态
            requestService.changeFriendRequestStatus(chatRequest.getId(), chatRequest.getRequestStatus());
        }
        // 入群请求
        else if (chatRequest.getType() == 2) {
            // 同意
            if (chatRequest.getRequestStatus() == 1) {
                // 添加群友入库并设置入群欢迎信息
                content.setChatGroupMsg(groupService.addNewGroupUser(Request.builder()
                        .groupId(chatRequest.getGroupId())
                        .fromUid(chatRequest.getFromUid()).build()));
                // 给发送方发送同意请求
                // 获取发送方channel
                Channel chanel = getChanel(chatRequest.getFromUid());
                if (StringUtils.isNotNull(chanel)) {
                    // 发送方在线
                    chanel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(content)));
                    // 这里是通知发送方,ft反置
                    log.info("同意入群请求 fromUid={},toUid={}", chatRequest.getToUid(), chatRequest.getFromUid());
                } else {
                    log.info("同意入群请求(对方离线) fromUid={},toUid={}", chatRequest.getToUid(), chatRequest.getFromUid());
                }
            }
            // 拒绝
            else if (chatRequest.getRequestStatus() == 2) {
                // 通知发送方拒绝请求
                // 获取发送方channel
                Channel chanel = getChanel(chatRequest.getFromUid());
                if (StringUtils.isNotNull(chanel)) {
                    // 发送方在线
                    chanel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(content)));
                    // 这里是通知发送方,ft反置
                    log.info("拒绝入群请求 fromUid={},toUid={}", chatRequest.getToUid(), chatRequest.getFromUid());
                } else {
                    log.info("拒绝入群请求(对方离线) fromUid={},toUid={}", chatRequest.getToUid(), chatRequest.getFromUid());
                }
            }
            // 更改请求状态
            requestService.changeFriendRequestStatus(chatRequest.getId(), chatRequest.getRequestStatus());
        }
    }

    /**
     * 心跳连接
     */
    private void keepalive(Channel channel) {
        log.info("收到来自channelId[" + channel.id().asShortText() + "]发送的心跳包");
    }

    /**
     * 退出或删除群聊,系统通知
     */
    private void closeGroup(DataContent content) {
        // 获取系统通知消息
        Msg chatMsg = content.getChatMsg();
        // 扩展字段里存放处理方式(quit退出 delete删除)
        String type = content.getExtend().getGroupDealType();
        // 退出群聊,通知群主
        if ("quit".equals(type)) {
            // 增加一条系统通知,chatMsg.getContent()存放用户信息
            content.setChatMsg(msgService.insertMsg(Msg.builder()
                    .msgType(0)
                    .fromUid(chatMsg.getFromUid())
                    .toUid(chatMsg.getToUid())
                    .content("群友" + chatMsg.getContent() + "退出群").build()));
            // 群主chanel
            Channel chanel = getChanel(chatMsg.getToUid());
            if (StringUtils.isNotNull(chanel)) {
                // 群主在线
                chanel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(content)));
                log.info("退出群聊 fromUid={},toUid={}", chatMsg.getFromUid(), chatMsg.getToUid());
            } else {
                log.info("退出群聊(群主离线) fromUid={},toUid={}", chatMsg.getFromUid(), chatMsg.getToUid());
            }
        }
        // 删除群聊,通知群友
        else if ("delete".equals(type)) {
            // 获取群友列表
            List<Integer> userIdList = groupService.getUserIds(content.getExtend().getGroupId());
            // 给所有在线群用户发送群删除的系统通知
            userIdList.forEach(item -> {
                // 增加一条系统通知,chatMsg.getContent()存放群信息
                content.setChatMsg(msgService.insertMsg(Msg.builder()
                        .msgType(0)
                        .fromUid(chatMsg.getFromUid())
                        .toUid(item)
                        .content(chatMsg.getContent() + "群已被删除").build()));
                Channel chanel = getChanel(item);
                if (StringUtils.isNotNull(chanel)) {
                    // 用户在线
                    chanel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(content)));
                }
            });
            log.info("删除群聊 masterId={}", chatMsg.getFromUid());
        }
    }

    /**
     * 处理转发
     */
    private void forward(DataContent content) {
        Msg chatMsg = content.getChatMsg();
        String forwardType = content.getExtend().getForwardType();
        Channel chanel = getChanel(chatMsg.getFromUid());
        if (StringUtils.isNotNull(chanel)) {
            chanel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(content)));
            log.info("{}转发 fromUid={},toUid={}", forwardType, chatMsg.getFromUid(), chatMsg.getToUid());
        }
    }

    /**
     * 获取用户的通道
     *
     * @param userId 用户id
     * @return 通道
     */
    private Channel getChanel(Integer userId) {
        Channel toChannel = manager.get(userId);
        return StringUtils.isNotNull(toChannel) ? users.find(toChannel.id()) : null;
    }

    /**
     * 删除断开的用户连接
     */
    private void removeByChannel(Channel channel) {
        Iterator<Map.Entry<Integer, Channel>> iterator = manager.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<Integer, Channel> entry = iterator.next();
            if (entry.getValue() == channel) {
                iterator.remove();
                break;
            }
        }
    }
}
