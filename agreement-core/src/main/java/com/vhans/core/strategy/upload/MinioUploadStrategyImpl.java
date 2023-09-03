package com.vhans.core.strategy.upload;

import com.vhans.core.config.properties.MinioProperties;
import com.vhans.core.exception.ServiceException;
import com.vhans.core.utils.data.StringUtils;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import io.minio.StatObjectArgs;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;

/**
 * minio上传策略
 *
 * @author vhans
 */
@Slf4j
@Service("minioUploadStrategyImpl")
public class MinioUploadStrategyImpl extends AbstractUploadStrategyImpl {

    @Autowired
    private MinioProperties minioProperties;

    @Override
    public Boolean exists(String filePath) {
        MinioClient minioClient = getMinioClient();
        try {
            return StringUtils.isNotNull(minioClient.statObject(StatObjectArgs.builder()
                    .bucket(minioProperties.getBucketName())
                    .object(filePath)
                    .build()));
        } catch (Exception e) {
            // 未找到对象
            return false;
        }
    }

    @Override
    public void upload(String path, String fileName, InputStream inputStream) {
        MinioClient minioClient = getMinioClient();
        path = path.endsWith("/") ? path : path + "/";
        try {
            minioClient.putObject(PutObjectArgs.builder()
                    .bucket(minioProperties.getBucketName())
                    .object(path + fileName)
                    .stream(inputStream, -1, PutObjectArgs.MIN_MULTIPART_SIZE)
                    .build());
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        }
    }

    @Override
    public String getFileAccessUrl(String filePath) {
        return minioProperties.getEndpointUrl() + "/" + minioProperties.getBucketName() + "/" + filePath;
    }

    /**
     * 获取minioClient
     *
     * @return {@link MinioClient} minioClient
     */
    private MinioClient getMinioClient() {
        return MinioClient.builder()
                .endpoint(minioProperties.getEndpointUrl())
                .credentials(minioProperties.getAccessKey(), minioProperties.getSecretKey())
                .build();
    }
}
