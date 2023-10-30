package com.vhans.bapi;

import com.vhans.bus.transmit.NettyServer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * Spring框架的Netty服务器启动类
 * 在Spring应用程序上下文初始化或刷新时自动启动Netty服务器
 */
@Component
public class NettyBoater implements ApplicationListener<ContextRefreshedEvent> {

    @Value("${netty.port}")
    private int port;

    /**
     * Spring应用程序上下文初始化或刷新时，会触发onApplicationEvent方法
     */
    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        // 判断当前上下文是否为根上下文，是则启动Netty服务器
        if (event.getApplicationContext().getParent() == null) {
            try {
                // 启动了一个单例的Netty服务器实例
                NettyServer.getInstance().start(port);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
