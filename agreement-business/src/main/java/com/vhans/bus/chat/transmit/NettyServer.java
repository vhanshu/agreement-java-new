package com.vhans.bus.chat.transmit;

import com.vhans.bus.chat.transmit.config.NettyChannelInitializer;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * netty 服务
 *
 * @author vhans
 */
@Component
public class NettyServer {

    private static final Logger log = LoggerFactory.getLogger(NettyServer.class);

    /**
     * netty服务
     */
    private final ServerBootstrap server;

    /**
     * 单例netty
     */
    private static class SingletonWSServer {
        static final NettyServer instance = new NettyServer();
    }

    /**
     * 获取单例netty
     */
    public static NettyServer getInstance() {
        return SingletonWSServer.instance;
    }

    /**
     * 初始化
     */
    public NettyServer() {
        EventLoopGroup mainGroup = new NioEventLoopGroup();
        EventLoopGroup subGroup = new NioEventLoopGroup();
        server = new ServerBootstrap();
        server.group(mainGroup, subGroup)
                .channel(NioServerSocketChannel.class)
                .childHandler(new NettyChannelInitializer());
    }

    /**
     * 启动netty
     */
    public void start(int port) {
        ChannelFuture future = server.bind(port);
        log.info("netty服务启动完毕 port=" + port);
    }

}
