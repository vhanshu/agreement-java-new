package com.vhans.core.strategy.upload;

import cn.hutool.core.lang.Assert;
import com.vhans.core.exception.ServiceException;
import com.vhans.core.strategy.FileStrategy;
import com.vhans.core.utils.file.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;

/**
 * 抽象上传模板
 *
 * @author vhans
 */
public abstract class AbstractFileStrategyImpl implements FileStrategy {

    @Override
    public String uploadFile(MultipartFile file, String path) {
        path = path.startsWith("/") ? path : "/" + path;
        path = path.endsWith("/") ? path : path + "/";
        try {
            // 获取文件md5值
            String md5 = FileUtils.getMd5(file.getInputStream());
            // 获取文件扩展名
            String extName = FileUtils.getExtension(file);
            // 重新生成文件名
            String fileName = md5 + "." + extName;
            // 判断文件是否已存在
            if (!exists(path + fileName)) {
                // 不存在则继续上传
                upload(path, fileName, file.getInputStream());
            }
            // 返回文件访问路径
            return getFileAccessUrl(path + fileName);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException("文件上传失败");
        }
    }

    @Override
    public void createFolder(String path, String folderName) {
        path = path.startsWith("/") ? path : "/" + path;
        path = path.endsWith("/") ? path : path + "/";
        if (exists(path + folderName)) {
            return;
        }
        try {
            // 后边加一个"/bug.txt",避免多创建一个包的bug
            create(path + folderName + "/bug.txt");
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException("创建目录失败");
        }
    }

    @Override
    public void deleteFile(String filePath) {
        Assert.isFalse("/".equals(filePath), "不能删除所有文件");
        filePath = filePath.replaceFirst("^/", "");
        try {
            delete(filePath);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException("删除文件失败");
        }
    }

    /**
     * 判断文件是否存在
     *
     * @param filePath 文件路径
     * @return {@link Boolean}
     */
    public abstract Boolean exists(String filePath);

    /**
     * 获取文件访问url
     *
     * @param filePath 文件路径
     * @return {@link String} 文件url
     */
    public abstract String getFileAccessUrl(String filePath);

    /**
     * 上传
     *
     * @param path        路径
     * @param fileName    文件名
     * @param inputStream 输入流
     * @throws IOException io异常
     */
    public abstract void upload(String path, String fileName, InputStream inputStream) throws IOException;


    /**
     * 创建文件夹
     */
    public abstract void create(String creteObj) throws Exception;

    /**
     * 删除文件
     */
    public abstract void delete(String deleteObj) throws Exception;
}
