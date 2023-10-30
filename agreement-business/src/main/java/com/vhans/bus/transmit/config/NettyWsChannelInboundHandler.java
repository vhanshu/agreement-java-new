package com.vhans.bus.transmit.config;

import cn.hutool.json.JSONUtil;
import com.vhans.bus.chat.domain.Friend;
import com.vhans.bus.chat.domain.GroupMsg;
import com.vhans.bus.chat.domain.Msg;
import com.vhans.bus.chat.domain.Request;
import com.vhans.bus.chat.service.*;
import com.vhans.bus.data.domain.Comment;
import com.vhans.bus.data.service.ICommentService;
import com.vhans.bus.transmit.model.DataContent;
import com.vhans.bus.transmit.model.Forward;
import com.vhans.bus.transmit.model.Revoke;
import com.vhans.bus.system.service.IFileRecordService;
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
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;

import static com.vhans.core.constant.MsgActionConstant.*;
import static com.vhans.core.constant.NumberConstant.THREE;
import static com.vhans.core.constant.NumberConstant.TWO;

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
     * 获取业务处理bean: 好友、群组、用户消息、群消息、请求、文件、评论
     */
    private final IFriendService friendService = SpringUtils.getBean("friendServiceImpl");
    private final IGroupService groupService = SpringUtils.getBean("groupServiceImpl");
    private final IMsgService msgService = SpringUtils.getBean("msgServiceImpl");
    private final IGroupMsgService groupMsgService = SpringUtils.getBean("groupMsgServiceImpl");
    private final IRequestService requestService = SpringUtils.getBean("requestServiceImpl");
    private final IFileRecordService fileRecordService = SpringUtils.getBean("fileRecordServiceImpl");
    private final ICommentService commentService = SpringUtils.getBean("commentServiceImpl");

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
    protected void channelRead0(ChannelHandlerContext ctx, TextWebSocketFrame msg) {
        // 获得当前channel
        Channel currentChannel = ctx.channel();
        // 获取客户端发来的消息并转换JSON为entity
        try {
            DataContent dataContent = JSONUtil.toBean(msg.text(), DataContent.class);
            switch (dataContent.getAction()) {
                case KEEPALIVE -> keepalive(currentChannel);
                case CONNECT -> connect(Integer.valueOf(dataContent.getData()), currentChannel);
                case CHAT -> chat(JSONUtil.toBean(dataContent.getData(), Msg.class));
                case GROUP_MSG -> groupChat(JSONUtil.toBean(dataContent.getData(), GroupMsg.class));
                case SEND_REQUEST -> sendRequest(JSONUtil.toBean(dataContent.getData(), Request.class));
                case DEAL_REQUEST -> dealRequest(JSONUtil.toBean(dataContent.getData(), Request.class));
                case DELETE_GROUP -> deleteGroup(JSONUtil.toBean(dataContent.getData(), GroupMsg.class));
                case QUIT_GROUP -> quitGroup(JSONUtil.toBean(dataContent.getData(), GroupMsg.class));
                case FORWARD -> forward(JSONUtil.toBean(dataContent.getData(), Forward.class));
                case REVOKE -> revoke(JSONUtil.toBean(dataContent.getData(), Revoke.class));
                case COMMENT -> comment(JSONUtil.toBean(dataContent.getData(), Comment.class));
                default -> currentChannel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(DataContent.fail())));
            }
        } catch (Exception e) {
            currentChannel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(DataContent.fail())));
        }
    }

    /**
     * 当客户端连接服务端之后（打开连接）
     * 获取客户端的channel，并且放到ChannelGroup中去进行管理
     */
    @Override
    public void handlerAdded(ChannelHandlerContext ctx) {
        users.add(ctx.channel());
        log.info("获得连接,channelId={}", ctx.channel().id().asShortText());
    }

    /**
     * 当触发handlerRemoved，ChannelGroup会自动移除对应客户端的channel
     */
    @Override
    public void handlerRemoved(ChannelHandlerContext ctx) {
        users.remove(ctx.channel());
        removeByChannel(ctx.channel());
        log.info("客户端被移除,channelId={}", ctx.channel().id().asShortText());
    }

    /**
     * 发生异常之后关闭channel
     */
    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        cause.printStackTrace();
        ctx.channel().close();
        // 从ChannelGroup中移除channel
        users.remove(ctx.channel());
        removeByChannel(ctx.channel());
        log.info("连接异常!!!,channelId={}", ctx.channel().id().asShortText());
    }

    /**
     * 心跳连接
     */
    private void keepalive(Channel channel) {
        log.info("收到来自channelId[" + channel.id().asShortText() + "]发送的心跳包");
    }

    /**
     * 处理 websocket 第一次open的时候,绑定channel和userid,同时发送用户在线ids
     */
    private void connect(Integer userId, Channel channel) {
        // 把channel和userid关联起来
        manager.put(userId, channel);
        sendTo(userId, JSONUtil.toJsonStr(DataContent.success(CONNECT, JSONUtil.toJsonStr(getOnlineUserIds()))), true);
        log.info("userId={} 绑定通道成功", userId);
    }

    /**
     * 单独聊天类型的消息，把聊天记录保存到数据库，同时标记消息的签收状态[数据库默认未签收]
     */
    private void chat(Msg msg) {
        if(msg.getMsgType() == TWO || msg.getMsgType() == THREE){
            // 文件消息获取文件id并设置
            Integer fileId = fileRecordService.getFileIdByUrl(msg.getFileUrl());
            if(fileId != null){
                msg.setFileId(fileId);
            } else {
                sendTo(msg.getFromUid(), null, false);
            }
        }
        // 保存消息到数据库
        int row = msgService.insertMsg(msg);
        String jsonData = JSONUtil.toJsonStr(DataContent.success(CHAT, JSONUtil.toJsonStr(msg)));
        // 给自己发送响应消息
        sendTo(msg.getFromUid(), jsonData, row > 0);
        // 发送消息
        if (row > 0) {
            sendTo(msg.getToUid(), jsonData, true);
        }
    }

    /**
     * 发送群消息
     */
    private void groupChat(GroupMsg groupMsg) {
        if(groupMsg.getMsgType() == TWO || groupMsg.getMsgType() == THREE){
            // 文件消息获取文件id并设置
            Integer fileId = fileRecordService.getFileIdByUrl(groupMsg.getFileUrl());
            if(fileId != null){
                groupMsg.setFileId(fileId);
            } else {
                sendTo(groupMsg.getFromUid(), null, false);
            }
        }
        // 保存消息到数据库
        int row = groupMsgService.insertGroupMsg(groupMsg);
        String jsonData = JSONUtil.toJsonStr(DataContent.success(GROUP_MSG, JSONUtil.toJsonStr(groupMsg)));
        // 给自己发送响应消息
        sendTo(groupMsg.getFromUid(), jsonData, row > 0);
        if (row > 0) {
            // 获取群用户ids
            List<Integer> userIds = groupService.getUserIds(groupMsg.getToUid());
            // 在指定群给所有在线群用户发送信息
            userIds.forEach(item -> {
                if (!Objects.equals(item, groupMsg.getFromUid())) {
                    sendTo(item, jsonData, true);
                }
            });
        }
    }

    /**
     * 发送请求
     */
    private void sendRequest(Request request) {
        // 保存请求到数据库
        int row = requestService.insertRequest(request);
        String jsonData = JSONUtil.toJsonStr(DataContent.success(SEND_REQUEST, JSONUtil.toJsonStr(request)));
        // 给自己发送响应消息
        sendTo(request.getFromUid(), jsonData, row > 0);
        if (row > 0) {
            // 给接收方发送请求
            sendTo(request.getToUid(), jsonData, true);
        }
    }

    /**
     * 处理请求
     */
    private void dealRequest(Request request) {
        String jsonData = JSONUtil.toJsonStr(DataContent.success(DEAL_REQUEST, JSONUtil.toJsonStr(request)));
        if (request.getStatus() == 1) { // 同意
            // 添加好友或者群友
            int row = request.getType() == 1 ? friendService.insertFriend(
                    Friend.builder().userId(request.getToUid())
                            .friendId(request.getFromUid())
                            .friendRemark(request.getNickname()).build()) :
                    (request.getType() == 2 ? groupService.addNewGroupUser(
                            Request.builder().groupId(request.getGroupId())
                                    .fromUid(request.getFromUid()).build()) : 0);
            // 给自己发送响应消息
            sendTo(request.getFromUid(), jsonData, row > 0);
            if (row > 0) {
                // 通知发送方,你的请求我同意了
                sendTo(request.getFromUid(), jsonData, true);
            }
        } else if (request.getStatus() == 2) { // 拒绝
            // 给自己发送响应消息
            sendTo(request.getFromUid(), jsonData, true);
            // 通知发送方,你的请求我拒绝了
            sendTo(request.getFromUid(), jsonData, true);
        }
        // 更改请求状态
        requestService.changeFriendRequestStatus(request.getId(), request.getStatus());
    }

    /**
     * 删除群聊
     */
    private void deleteGroup(GroupMsg groupMsg) {
        // 获取群友ids
        List<Integer> userIdList = groupService.getUserIds(groupMsg.getToUid());
        // 给所有在线群用户发送群删除的系统通知
        userIdList.forEach(item -> {
            // 增加一条系统通知,groupMsg.getContent()存放群信息
            Msg sysMsg = Msg.builder()
                    .msgType(0)
                    .fromUid(groupMsg.getFromUid())
                    .toUid(item)
                    .content(groupMsg.getContent() + "群已被删除").build();
            int row = msgService.insertMsg(sysMsg);
            if (row > 0) {
                String jsonData = JSONUtil.toJsonStr(DataContent.success(DELETE_GROUP, JSONUtil.toJsonStr(sysMsg)));
                sendTo(item, jsonData, true);
            }
        });
    }

    /**
     * 退出群聊,在请求退群接口后执行
     */
    private void quitGroup(GroupMsg groupMsg) {
        // 增加一条系统通知来通知群主,groupMsg.getContent存放用户信息
        // 获取群主id
        int masterId = groupService.getGroupMasterId(groupMsg.getToUid());
        Msg sysMsg = Msg.builder()
                .msgType(0)
                .fromUid(groupMsg.getFromUid())
                .toUid(masterId)
                .content("群友" + groupMsg.getContent() + "退出群").build();
        int row = msgService.insertMsg(sysMsg);
        if (row > 0) {
            String jsonData = JSONUtil.toJsonStr(DataContent.success(QUIT_GROUP, JSONUtil.toJsonStr(sysMsg)));
            sendTo(masterId, jsonData, true);
        }
    }

    /**
     * 处理转发
     */
    private void forward(Forward forward) {
        //转发至单聊或者群聊
        if (forward.getType() == 1) {
            chat(Msg.builder()
                    .fromUid(forward.getFromUid())
                    .toUid(forward.getToUid())
                    .msgType(forward.getMsgType())
                    .content(forward.getContent())
                    .build());
        } else if (forward.getType() == 2) {
            groupChat(GroupMsg.builder()
                    .fromUid(forward.getFromUid())
                    .toUid(forward.getToUid())
                    .msgType(forward.getMsgType())
                    .content(forward.getContent())
                    .build());
        }
    }

    /**
     * 撤销消息
     */
    private void revoke(Revoke revoke) {
        int row = 0;
        String jsonData = JSONUtil.toJsonStr(DataContent.success(REVOKE, JSONUtil.toJsonStr(revoke)));
        if(revoke.getType() == 1) {
            row = msgService.deleteMsg(revoke.getMsgId());
            // 发送消息
            if (row > 0) {
                sendTo(revoke.getToUid(), jsonData, true);
            }
        } else if (revoke.getType() == 2) {
            row = groupMsgService.deleteGroupMsg(revoke.getMsgId());
            // 在指定群给所有在线群用户发送信息
            if (row > 0) {
                sendTo(revoke.getToUid(), jsonData, true);
                // 获取群用户ids
                List<Integer> userIds = groupService.getUserIds(revoke.getToUid());
                userIds.forEach(item -> {
                    if (!Objects.equals(item, revoke.getFromUid())) {
                        sendTo(item, jsonData, true);
                    }
                });
            }
        }
        // 给自己发送响应消息
        sendTo(revoke.getFromUid(), jsonData, row > 0);
    }

    /**
     * 评论
     */
    private void comment(Comment comment) {
        // 保存消息到数据库
        int row = commentService.addComment(comment);
        // 这里额外需要:avatar,fromNickname,toNickname
        String jsonData = JSONUtil.toJsonStr(DataContent.success(COMMENT, JSONUtil.toJsonStr(comment)));
        // 给自己发送响应消息
        sendTo(comment.getFromUid(), jsonData, row > 0);
        if (row > 0) {
            List<Integer> onlineUserIds = getOnlineUserIds();
            // 在所有在线群用户发送信息
            onlineUserIds.forEach(item -> {
                if (!Objects.equals(item, comment.getFromUid())) {
                    sendTo(item, jsonData, true);
                }
            });
        }
    }

    /**
     * 给指定用户发送数据
     *
     * @param userId 用户id
     * @param data   数据
     * @param isOk   是否成功
     */
    private void sendTo(Integer userId, String data, Boolean isOk) {
        Channel channel = manager.get(userId);
        if (StringUtils.isNotNull(channel)) {
            String jsonData = isOk ? data : JSONUtil.toJsonStr(DataContent.fail());
            channel.writeAndFlush(new TextWebSocketFrame(jsonData));
        }
    }

    /**
     * 获取在线用户ids
     */
    private List<Integer> getOnlineUserIds() {
        return manager.keySet().stream().toList();
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
