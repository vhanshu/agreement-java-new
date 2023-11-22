package com.vhans.core.strategy.upload;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.model.OSSObjectSummary;
import com.aliyun.oss.model.ObjectListing;
import com.vhans.core.config.properties.OssProperties;
import com.vhans.core.exception.ServiceException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;

/**
 * oss上传策略
 *
 * @author vhans
 */
@Service
@Slf4j
public class OssFileStrategyImpl extends AbstractFileStrategyImpl {

    @Autowired
    private OssProperties ossProperties;

    @Override
    public Boolean exists(String filePath) {
        return getOssClient().doesObjectExist(ossProperties.getBucketName(), filePath);
    }

    @Override
    public String getFileAccessUrl(String filePath) {
        return ossProperties.getUrl() + filePath;
    }

    @Override
    public void upload(String path, String fileName, InputStream inputStream) {
        OSS ossClient = getOssClient();
        try {
            // 调用oss方法上传
            ossClient.putObject(ossProperties.getBucketName(), path + fileName, inputStream);
        } catch (OSSException oe) {
            log.error("错误消息:" + oe.getErrorMessage());
            log.error("错误码:" + oe.getErrorCode());
            log.info("请求ID:" + oe.getRequestId());
            log.info("主机ID:" + oe.getHostId());
        } catch (ClientException ce) {
            log.error("捕获到ClientException, 错误消息:" + ce.getMessage());
        } finally {
            if (ossClient != null) {
                ossClient.shutdown();
            }
        }
    }

    @Override
    public void create(String creteObj) {
        OSS ossClient = getOssClient();
        try {
            ossClient.putObject(ossProperties.getBucketName(), creteObj, (InputStream) null);
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        } finally {
            ossClient.shutdown();
        }
    }

    @Override
    public void delete(String deleteObj) throws Exception {
        OSS ossClient = getOssClient();
        try {
            String bucketName = ossProperties.getBucketName();
            ObjectListing listing = ossClient.listObjects(bucketName, deleteObj);
            for (OSSObjectSummary summary : listing.getObjectSummaries()) {
                ossClient.deleteObject(bucketName, summary.getKey());
            }
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * 获取ossClient
     *
     * @return {@link OSS} ossClient
     */
    private OSS getOssClient() {
        return new OSSClientBuilder().build(ossProperties.getEndpoint(), ossProperties.getAccessKeyId(), ossProperties.getAccessKeySecret());
    }
}
