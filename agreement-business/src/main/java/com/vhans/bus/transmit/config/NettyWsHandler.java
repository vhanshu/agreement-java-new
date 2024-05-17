package com.vhans.bus.transmit.config;

import cn.hutool.json.JSONUtil;
import com.vhans.bus.chat.domain.*;
import com.vhans.bus.chat.service.*;
import com.vhans.bus.system.service.IFileRecordService;
import com.vhans.bus.transmit.model.DataContent;
import com.vhans.bus.transmit.model.Forward;
import com.vhans.bus.transmit.model.PushData;
import com.vhans.bus.transmit.model.Revoke;
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

import java.time.LocalDateTime;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;

import static com.vhans.core.constant.MsgActionConstant.*;
import static com.vhans.core.constant.NumberConstant.*;
import static com.vhans.core.constant.PushTypeConstant.PUSH_ONLINE;
import static com.vhans.core.constant.PushTypeConstant.PUSH_WORLD;

/**
 * 处理消息
 * TextWebSocketFrame: 在netty中，用于为websocket专门处理文本的对象，frame是消息的载体
 * SimpleChannelInboundHandler: 对于请求来讲，相当于入站
 *
 * @author vhans
 */
@Log4j2
public class NettyWsHandler extends SimpleChannelInboundHandler<TextWebSocketFrame> {

    /**
     * 获取业务处理bean: 好友、群组、用户消息、群消息、请求、文件、评论
     */
    private final IFriendService friendService = SpringUtils.getBean("friendServiceImpl");
    private final IGroupService groupService = SpringUtils.getBean("groupServiceImpl");
    private final IMsgService msgService = SpringUtils.getBean("msgServiceImpl");
    private final IGroupMsgService groupMsgService = SpringUtils.getBean("groupMsgServiceImpl");
    private final IRequestService requestService = SpringUtils.getBean("requestServiceImpl");
    private final IFileRecordService fileRecordService = SpringUtils.getBean("fileRecordServiceImpl");

    /**
     * 用于记录和管理所有客户端的channel
     */
    public static ChannelGroup users = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);

    /**
     * 用户id -> Channel
     */
    private static final Map<Integer, Channel> manager = new ConcurrentHashMap<>();

    /**
     * 系统主动推送
     */
    public static void pushInfo(Integer type, String data, Integer userId) {
        PushData pushData = PushData.builder().type(type).data(data).build();
        String jsonData = JSONUtil.toJsonStr(DataContent.success(PUSH, JSONUtil.toJsonStr(pushData)));
        if (userId == 0) {
            // 给所有在线用户发送消息
            manager.forEach((item, value) -> value.writeAndFlush(new TextWebSocketFrame(jsonData)));
        } else {
            // 给指定用户发送消息
            Channel channel = manager.get(userId);
            if (StringUtils.isNotNull(channel)) {
                channel.writeAndFlush(new TextWebSocketFrame(jsonData));
            }
        }
    }

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
                case QUIT_GROUP -> quitGroup(JSONUtil.toBean(dataContent.getData(), Request.class));
                case FORWARD -> forward(JSONUtil.toBean(dataContent.getData(), Forward.class));
                case REVOKE -> revoke(JSONUtil.toBean(dataContent.getData(), Revoke.class));
                case DELETE_FRIEND -> deleteFriend(JSONUtil.toBean(dataContent.getData(), Request.class));
                case JOIN_GROUP -> joinGroup(JSONUtil.toBean(dataContent.getData(), Group.class));
                case PUSH -> pushInfo(PUSH_WORLD, dataContent.getData(), 0);
                default -> currentChannel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(DataContent.fail())));
            }
        } catch (Exception e) {
            currentChannel.writeAndFlush(new TextWebSocketFrame(JSONUtil.toJsonStr(DataContent.fail(e.getMessage()))));
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
        // 给该用户发送成功信息
        sendTo(userId, JSONUtil.toJsonStr(DataContent.success(CONNECT)), true);
        // 给所有人发送在线用户ids
        pushInfo(PUSH_ONLINE, JSONUtil.toJsonStr(getOnlineUserIds()), 0);
        log.info("userId={} 绑定通道成功", userId);
    }

    /**
     * 单独聊天类型的消息，把聊天记录保存到数据库，同时标记消息的签收状态[数据库默认未签收]
     */
    private void chat(Msg msg) {
        if (msg.getMsgType() == TWO || msg.getMsgType() == THREE) {
            // 文件消息获取文件id并设置
            Integer fileId = fileRecordService.getFileIdByUrl(msg.getFileUrl());
            if (fileId != null) {
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
        if (groupMsg.getMsgType() == TWO || groupMsg.getMsgType() == THREE) {
            // 文件消息获取文件id并设置
            Integer fileId = fileRecordService.getFileIdByUrl(groupMsg.getFileUrl());
            if (fileId != null) {
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
        request.setUpdateTime(LocalDateTime.now());
        String jsonData = JSONUtil.toJsonStr(DataContent.success(DEAL_REQUEST, JSONUtil.toJsonStr(request)));
        if (request.getStatus() == 1) { // 同意
            if (request.getType() == 1) {
                //添加好友
                int row = friendService.insertFriend(Friend.builder()
                        .userId(request.getToUid())
                        .friendId(request.getFromUid())
                        .friendRemark(request.getNickname())
                        .build());
                // 给自己发送响应消息
                sendTo(request.getToUid(), jsonData, row > 0);
                if (row > 0) {
                    // 给请求方发送新增好友通知
                    sendTo(request.getFromUid(), jsonData, true);
                }
            } else {
                //添加群友
                int row = groupService.addNewGroupUser(Request.builder()
                        .groupId(request.getGroupId())
                        .fromUid(request.getFromUid())
                        .nickname(request.getNickname()).build());
                // 给自己发送响应消息
                sendTo(request.getToUid(), jsonData, row > 0);
                if (row > 0) {
                    GroupMsg groupMsg = GroupMsg.builder()
                            .msgType(ONE)
                            .fromUid(request.getFromUid())
                            .toUid(request.getGroupId())
                            .content("【" + request.getNickname() + "】加入群,热烈欢迎🎉🎉🎉")
                            .avatar(request.getAvatar())
                            .nickname(request.getNickname())
                            .fileUrl(request.getReason()) // fileUrl与request.reason一致,均存放群名称
                            .createTime(LocalDateTime.now()).build();
                    String jsonDataM = JSONUtil.toJsonStr(DataContent.success(JOIN_GROUP, JSONUtil.toJsonStr(groupMsg)));
                    // 给请求方发送新入群通知
                    sendTo(request.getFromUid(), jsonDataM, true);
                    // 给群中其他群用户发送加入群信息
                    List<Integer> userIdList = groupService.getUserIds(request.getGroupId());
                    userIdList.forEach(id -> {
                        if (!Objects.equals(id, request.getFromUid())) {
                            sendTo(id, jsonDataM, true);
                        }
                    });
                }
            }
        } else if (request.getStatus() == 2) { // 拒绝
            // 给自己发送响应消息
            sendTo(request.getToUid(), jsonData, true);
            // 通知发送方,你的请求我拒绝了
            sendTo(request.getFromUid(), jsonData, true);
        }
        // 更改请求状态
        requestService.changeFriendRequestStatus(request);
    }

    /**
     * 删除群聊
     */
    private void deleteGroup(GroupMsg groupMsg) {
        // 获取群友ids
        List<Integer> userIdList = groupService.getUserIds(groupMsg.getToUid());
        // 给所有在线群用户发送群删除的系统通知
        userIdList.forEach(item -> {
            // 增加一条系统通知,groupMsg.getContent()存放群名称
            Msg sysMsg = Msg.builder()
                    .msgType(0)
                    .fromUid(groupMsg.getFromUid())
                    .toUid(item)
                    .content("【" + groupMsg.getContent() + "】群已被删除").build();
            int row = msgService.insertMsg(sysMsg);
            if (row > 0) {
                String jsonData = JSONUtil.toJsonStr(DataContent.success(DELETE_GROUP, JSONUtil.toJsonStr(sysMsg)));
                sendTo(item, jsonData, true);
            }
        });
    }

    /**
     * 离开群聊,在请求退群接口后执行
     */
    private void quitGroup(Request request) {
        int row = groupService.quitGroup(request.getFromUid(), request.getGroupId());
        if (row > 0) {
            // 增加系统通知
            if (request.getType() == 1) {
                // 用户主动退出群,通知群主,这里toNickname为填入的群聊名称,同时先给该用户发送退群成功的信息
                String jsonData = JSONUtil.toJsonStr(DataContent.success(QUIT_GROUP, JSONUtil.toJsonStr(request)));
                sendTo(request.getFromUid(), jsonData, true);
                msgService.insertMsg(Msg.builder()
                        .msgType(0)
                        .fromUid(request.getFromUid()) // 群友id
                        .toUid(request.getToUid()) // 群主id
                        .content(StringUtils.format("群友【{}】退出群【{}】", request.getNickname(), request.getToNickname())).build());
            } else {
                // 群主移除群友,通知该群友
                msgService.insertMsg(Msg.builder()
                        .msgType(0)
                        .fromUid(request.getToUid()) // 群主id
                        .toUid(request.getFromUid()) // 群友id
                        .content("您已被移出群聊【" + request.getToNickname() + "】").build());
            }
        }
        // 线上通知还在群的所有群用户
        List<Integer> userIdList = groupService.getUserIds(request.getGroupId());
        userIdList.forEach(item -> {
            String jsonData = JSONUtil.toJsonStr(DataContent.success(QUIT_GROUP, JSONUtil.toJsonStr(request)));
            sendTo(item, jsonData, true);
        });
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
        if (revoke.getType() == 1) {
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
     * 删除好友
     */
    private void deleteFriend(Request request) {
        // 给我与好友发送删除的系统通知
        // 1.删除数据库好友信息
        int row = friendService.deleteFriend(request.getFromUid(), request.getToUid());
        if (row > 0) {
            // 2.增加我与好友的系统通知,并发送通知信息
            Msg sysMsgI = Msg.builder().msgType(0).fromUid(request.getToUid()).toUid(request.getFromUid())
                    .content(StringUtils.format("成功删除好友【{}】", request.getToNickname())).build();
            Msg sysMsgF = Msg.builder().msgType(0).fromUid(request.getFromUid()).toUid(request.getToUid())
                    .content(StringUtils.format("您已被【{}】解除好友关系", request.getNickname())).build();
            int rowI = msgService.insertMsg(sysMsgI);
            if (rowI > 0) {
                String jsonDataI = JSONUtil.toJsonStr(DataContent.success(DELETE_FRIEND, JSONUtil.toJsonStr(sysMsgI)));
                sendTo(request.getFromUid(), jsonDataI, true);
            }
            int rowF = msgService.insertMsg(sysMsgF);
            if (rowF > 0) {
                String jsonDataF = JSONUtil.toJsonStr(DataContent.success(DELETE_FRIEND, JSONUtil.toJsonStr(sysMsgF)));
                sendTo(request.getToUid(), jsonDataF, true);
            }
        }
    }

    /**
     * 拉入群友
     */
    private void joinGroup(Group group) {
        List<Integer> oldUserIds = groupService.getUserIds(group.getId());
        group.getUserList().forEach(item -> {
            //添加群友至数据库
            int row = groupService.addNewGroupUser(Request.builder()
                    .groupId(group.getId())
                    .fromUid(item.getId())
                    .nickname(item.getNickname()).build());
            if (row > 0) {
                GroupMsg groupMsg = GroupMsg.builder()
                        .msgType(ONE)
                        .fromUid(item.getId())
                        .toUid(group.getId())
                        .content("【" + item.getNickname() + "】加入群,热烈欢迎🎉🎉🎉")
                        .avatar(item.getAvatar())
                        .nickname(item.getNickname())
                        .fileUrl(group.getName()) // 用fileUrl存放群名称
                        .createTime(LocalDateTime.now()).build();
                String jsonData = JSONUtil.toJsonStr(DataContent.success(JOIN_GROUP, JSONUtil.toJsonStr(groupMsg)));
                //给本人发送新入群通知
                sendTo(item.getId(), jsonData, true);
                //给群中其他群用户发送加入群信息
                oldUserIds.forEach(id -> sendTo(id, jsonData, true));
            }
        });

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
        users.remove(channel);
        Iterator<Map.Entry<Integer, Channel>> iterator = manager.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<Integer, Channel> entry = iterator.next();
            if (entry.getValue() == channel) {
                iterator.remove();
                break;
            }
        }
        //更新在线用户ids
        pushInfo(PUSH_ONLINE, JSONUtil.toJsonStr(getOnlineUserIds()), 0);
    }
}
