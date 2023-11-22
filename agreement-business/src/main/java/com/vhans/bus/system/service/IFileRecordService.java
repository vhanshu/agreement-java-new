package com.vhans.bus.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.system.domain.dto.FolderDTO;
import com.vhans.bus.system.domain.FileRecord;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 文件业务接口
 *
 * @author vhans
 */
public interface IFileRecordService extends IService<FileRecord> {

    /**
     * 查看文件列表
     *
     * @param filePath 文件路径
     * @return 文件列表
     */
    List<FileRecord> listFileRecordList(String filePath);

    /**
     * 查看前台文件列表
     *
     * @param filePath 文件路径
     * @return 文件列表
     */
    List<FileRecord> listFileRecordHome(String filePath);

    /**
     * 上传文件
     *
     * @param file 文件
     * @param path 文件路径
     */
    void uploadFile(MultipartFile file, String path);

    /**
     * 创建文件夹
     *
     * @param folder 文件夹信息
     */
    void createFolder(FolderDTO folder);

    /**
     * 删除文件
     *
     * @param fileIdList 文件id列表
     */
    void deleteFile(List<Integer> fileIdList);

    /**
     * 下载文件
     *
     * @param fileId 文件id
     */
    void downloadFile(Integer fileId);

    /**
     * 系统通用文件上传
     *
     * @param file 文件
     * @param path 上传路径
     * @return 文件url
     */
    String uploadCommonFile(MultipartFile file, String path);

    /**
     * 根据文件url获取文件id
     * @param fileUrl 文件url
     */
    Integer getFileIdByUrl(String fileUrl);
}
