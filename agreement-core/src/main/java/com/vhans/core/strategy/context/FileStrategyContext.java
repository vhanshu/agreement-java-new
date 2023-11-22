package com.vhans.core.strategy.context;

import com.vhans.core.strategy.FileStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

import static com.vhans.core.enums.UploadModeEnum.getStrategy;

/**
 * 系统文件策略上下文
 *
 * @author vhans
 */
@Service
public class FileStrategyContext {
    /**
     * 上传模式
     */
    @Value("${upload.strategy}")
    private String uploadStrategy;

    @Autowired
    private Map<String, FileStrategy> uploadStrategyMap;

    /**
     * 上传文件
     *
     * @param file 文件
     * @param path 路径
     * @return {@link String} 文件地址
     */
    public String executeUploadStrategy(MultipartFile file, String path) {
        return uploadStrategyMap.get(getStrategy(uploadStrategy)).uploadFile(file, path);
    }

    /**
     * 创建目录
     *
     * @param path       路径
     * @param folderName 目录名
     */
    public void executeCreateStrategy(String path, String folderName) {
        uploadStrategyMap.get(getStrategy(uploadStrategy)).createFolder(path, folderName);
    }

    /**
     * 删除文件
     *
     * @param deleteObj 删除key
     */
    public void executeDeleteStrategy(String deleteObj) {
        uploadStrategyMap.get(getStrategy(uploadStrategy)).deleteFile(deleteObj);
    }

}