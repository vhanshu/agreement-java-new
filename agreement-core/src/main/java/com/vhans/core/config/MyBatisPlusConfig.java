package com.vhans.core.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

/**
 * MybatisPlus配置
 *
 * @author vhans
 */
@Configuration
@MapperScan("com.vhans.bus.*.mapper")
public class MyBatisPlusConfig {
}