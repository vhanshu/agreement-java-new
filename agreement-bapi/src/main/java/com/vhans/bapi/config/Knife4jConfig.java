package com.vhans.bapi.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2WebMvc;

import java.util.Collections;

/**
 * Knife4j配置(访问doc.html)
 *
 * @author vhans
 */
@Configuration
@EnableSwagger2WebMvc
public class Knife4jConfig {

    @Bean
    public Docket createRestBApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("agreement-bApi")
                .protocols(Collections.singleton("https"))
                .host("https://agreement.vhans.cloud")
                .apiInfo(bApiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.vhans.bapi.controller"))
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo bApiInfo() {
        return new ApiInfoBuilder()
                .title("三缺一前台API文档")
                .description("校园学生交流项目")
                .termsOfServiceUrl("https://agreement.vhans.cloud/bapi")
                .contact(new Contact("Vhans", "https://gitee.com/v-function", "2873585297@qq.com"))
                .version("1.0.0")
                .build();
    }
}