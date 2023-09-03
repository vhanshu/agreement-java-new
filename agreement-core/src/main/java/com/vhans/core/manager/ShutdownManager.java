package com.vhans.core.manager;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Component;

import javax.annotation.PreDestroy;

/**
 * 确保应用退出时能关闭后台线程
 *
 * @author vhans
 */
@Component
@Log4j2
public class ShutdownManager {

    /**
     * 停止异步执行任务
     */
    @PreDestroy
    public void destroy() {
        try {
            log.info("====关闭后台任务任务线程池====");
            AsyncManager.getInstance().shutdown();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }
}
