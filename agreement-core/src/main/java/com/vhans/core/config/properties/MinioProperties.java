package com.vhans.core.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * oss配置属性
 *
 * @author vhans
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "upload.minio")
public class MinioProperties {

    /**
     * minio域名
     */
    private String endpointUrl;

    /**
     * 账号
     */
    private String accessKey;

    /**
     * 密钥
     */
    private String secretKey;

    /**
     * bucket名称
     */
    private String bucketName;
}