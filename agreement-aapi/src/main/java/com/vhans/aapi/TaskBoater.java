package com.vhans.aapi;

import com.vhans.bus.website.service.ITaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * 定时任务服务器启动类
 * 在Spring应用程序上下文初始化或刷新时自动启动定时任务服务器
 */
@Component
public class TaskBoater implements ApplicationListener<ContextRefreshedEvent> {

    @Autowired
    private ITaskService taskService;

    /**
     * Spring应用程序上下文初始化或刷新时，会触发onApplicationEvent方法
     */
    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        // 判断当前上下文是否为根上下文，是则启动定时任务服务器
        if (event.getApplicationContext().getParent() == null) {
            try {
                // 启动了一个定时任务服务器
                taskService.init();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}