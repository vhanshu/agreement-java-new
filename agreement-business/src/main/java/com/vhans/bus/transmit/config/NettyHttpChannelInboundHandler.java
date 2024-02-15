package com.vhans.bus.transmit.config;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.*;
import io.netty.util.CharsetUtil;
import lombok.extern.log4j.Log4j2;

/**
 * 自定义httpHandler
 *
 * @author vhans
 */
@Log4j2
public class NettyHttpChannelInboundHandler extends SimpleChannelInboundHandler<HttpObject> {

    @Override
    protected void channelRead0(ChannelHandlerContext ctx, HttpObject msg) throws Exception {
        // 获得消息
        String msgStr = msg.toString();
        log.info("msgStr = " + msgStr);
        ByteBuf msgByteBuf = Unpooled.copiedBuffer("hello netty", CharsetUtil.UTF_8);
        //msgByteBuf
        DefaultFullHttpResponse response = new DefaultFullHttpResponse(HttpVersion.HTTP_1_1, HttpResponseStatus.OK, msgByteBuf);
        // 为响应增加数据类型和长度
        response.headers().set(HttpHeaderNames.CONTENT_TYPE, "text/plain");
        response.headers().set(HttpHeaderNames.CONTENT_LENGTH, msgByteBuf.readableBytes());
        // 把响应返回客户端
        ctx.writeAndFlush(response);
    }
}
