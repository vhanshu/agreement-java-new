package com.vhans.bus.transmit;

import com.vhans.bus.transmit.config.NettyChannelInitializer;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * netty 服务
 *
 * @author vhans
 */
@Log4j2
@Component
public class NettyServer {

    @Value("${netty.ssl}")
    private boolean ssl;

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
                .childHandler(new NettyChannelInitializer(ssl));
    }

    /**
     * 启动netty
     */
    public void start(int port) {
        server.bind(port);
        log.info("netty服务启动完毕 port=" + port + " ssl=" + ssl);
    }
}
