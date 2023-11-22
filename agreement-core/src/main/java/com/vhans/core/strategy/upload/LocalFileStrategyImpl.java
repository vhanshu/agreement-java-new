package com.vhans.core.strategy.upload;

import com.vhans.core.exception.ServiceException;
import com.vhans.core.utils.file.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.*;

/**
 * 本地上传策略
 *
 * @author vhans
 */
@Service
public class LocalFileStrategyImpl extends AbstractFileStrategyImpl {

    /**
     * 本地路径
     */
    @Value("${upload.local.path}")
    private String localPath;

    /**
     * 访问url
     */
    @Value("${upload.local.url}")
    private String localUrl;

    @Override
    public Boolean exists(String filePath) {
        return new File(localPath + filePath).exists();
    }

    @Override
    public String getFileAccessUrl(String filePath) {
        return localUrl + filePath;
    }

    @Override
    public void upload(String path, String fileName, InputStream inputStream) throws IOException {
        // 目录不存在则创建
        File directory = new File(localPath + path);
        if (!directory.exists()) {
            if (!directory.mkdirs()) {
                throw new ServiceException("创建目录失败");
            }
        }
        // 写入文件
        File file = new File(localPath + path + fileName);
        if (file.createNewFile()) {
            try (BufferedInputStream bis = new BufferedInputStream(inputStream);
                 BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file))) {
                byte[] bytes = new byte[4096];
                int length;
                while ((length = bis.read(bytes)) != -1) {
                    bos.write(bytes, 0, length);
                }
            }
        }
    }

    @Override
    public void create(String creteObj) throws Exception {
        File directory = new File(localPath + creteObj);
        if (!directory.mkdirs()) {
            throw new ServiceException("创建目录失败");
        }
    }

    @Override
    public void delete(String deleteObj) throws Exception {
        File file = new File(deleteObj);
        if (file.exists()) {
            FileUtils.deleteFile(file);
        }
    }

}
