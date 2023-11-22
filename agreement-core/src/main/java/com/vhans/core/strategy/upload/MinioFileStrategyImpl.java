package com.vhans.core.strategy.upload;

import com.vhans.core.config.properties.MinioProperties;
import com.vhans.core.exception.ServiceException;
import com.vhans.core.utils.data.StringUtils;
import io.minio.*;
import io.minio.messages.Item;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

/**
 * minio上传策略
 *
 * @author vhans
 */
@Slf4j
@Service("minioUploadStrategyImpl")
public class MinioFileStrategyImpl extends AbstractFileStrategyImpl {

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
    public String getFileAccessUrl(String filePath) {
        return minioProperties.getEndpointUrl() + "/" + minioProperties.getBucketName() + filePath;
    }

    @Override
    public void upload(String path, String fileName, InputStream inputStream) {
        MinioClient minioClient = getMinioClient();
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
    public void create(String creteObj) {
        MinioClient minioClient = getMinioClient();
        try {
            minioClient.putObject(PutObjectArgs.builder()
                    .bucket(minioProperties.getBucketName())
                    .object(creteObj)
                    .stream(new ByteArrayInputStream(new byte[]{}), 0, -1)
                    .build());
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        }
    }

    @Override
    public void delete(String deleteObj) throws Exception {
        MinioClient minioClient = getMinioClient();
        try {
            String bucketName = minioProperties.getBucketName();
            Iterable<Result<Item>> deletes = minioClient.listObjects(ListObjectsArgs.builder()
                    .bucket(bucketName)
                    .prefix(deleteObj)
                    .recursive(true)
                    .build());
            for (Result<Item> item : deletes) {
                minioClient.removeObject(RemoveObjectArgs.builder()
                        .bucket(bucketName)
                        .object(item.get().objectName())
                        .build());
            }
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        }
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
