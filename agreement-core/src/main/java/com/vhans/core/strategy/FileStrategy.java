package com.vhans.core.strategy;

import org.springframework.web.multipart.MultipartFile;

/**
 * 上传策略
 *
 * @author vhans
 */
public interface FileStrategy {
    /**
     * 上传文件
     *
     * @param file 文件
     * @param path 上传路径
     * @return {@link String} 文件地址
     */
    String uploadFile(MultipartFile file, String path);

    /**
     * 创建目录
     *
     * @param path       基本路径
     * @param folderName 目录名称
     */
    void createFolder(String path, String folderName);

    /**
     * 删除文件
     *
     * @param filePath 文件具体路径,如果是文件路径前缀表示要删除的文件夹
     */
    void deleteFile(String filePath);
}
