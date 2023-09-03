package com.vhans.aapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

/**
 * @author vhans
 */
@SpringBootApplication(scanBasePackages = {"com.vhans.core", "com.vhans.bus", "com.vhans.aapi"})
public class AApiApplication {
    public static void main(String[] args) {
        SpringApplication.run(AApiApplication.class, args);
    }

    // 加入restTemplate,第三方登录发送请求
    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}
