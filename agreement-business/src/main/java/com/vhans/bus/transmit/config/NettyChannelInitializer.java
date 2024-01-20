package com.vhans.bus.transmit.config;

import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
import io.netty.handler.ssl.SslContext;
import io.netty.handler.ssl.SslContextBuilder;
import io.netty.handler.stream.ChunkedWriteHandler;
import io.netty.handler.timeout.IdleStateHandler;
import lombok.extern.log4j.Log4j2;
import org.springframework.core.io.ClassPathResource;

/**
 * 管道初始化
 *
 * @author vhans
 */
@Log4j2
public class NettyChannelInitializer extends ChannelInitializer<SocketChannel> {

    // 设置最大帧长度为1MB
    private static final int MAX_FRAME_LENGTH = 1024 * 1024;

    @Override
    protected void initChannel(SocketChannel ch) throws Exception {
        log.info("管道初始化中...");
        ChannelPipeline pipeline = ch.pipeline();
        ClassPathResource pem = new ClassPathResource("/ssl/agree.vhans.cloud_bundle.pem");
        ClassPathResource key = new ClassPathResource("/ssl/server.key");
        //添加ssl证书支持wss
        SslContext sslCtx = SslContextBuilder.forServer(pem.getInputStream(), key.getInputStream()).build();
        pipeline.addLast(sslCtx.newHandler(ch.alloc()));

        // 添加websocket的http编解码器
        pipeline.addLast("HttpServerCodec", new HttpServerCodec());
        // 提供写大数据流支持
        pipeline.addLast(new ChunkedWriteHandler());
        // 对httpMessage进行聚合，聚合成FullHttpRequest或FullHttpResponse
        pipeline.addLast(new HttpObjectAggregator(1024 * 64));

        // 增加心跳支持 start
        // 针对客户端，如果在1分钟时没有向服务端发送读写心跳(ALL)，则主动断开
        // 如果是读空闲或者写空闲，不处理
        pipeline.addLast(new IdleStateHandler(8, 10, 12));
//        pipeline.addLast(new HttpObjectAggregator(65536 * 2));
        // 以下是支持httpWebsocket 路由; 处理握手动作: handshaking（close, ping, pong） ping + pong = 心跳
        pipeline.addLast(new WebSocketServerProtocolHandler("/ws", null, true, MAX_FRAME_LENGTH));
        // 自定义的wsHandler
		pipeline.addLast(new NettyWsChannelInboundHandler());
        // 自定义 http
		pipeline.addLast(new NettyHttpChannelInboundHandler());
    }
}
