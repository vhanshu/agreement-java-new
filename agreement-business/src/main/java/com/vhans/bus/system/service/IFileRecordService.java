package com.vhans.bus.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.system.domain.dto.FolderDTO;
import com.vhans.bus.system.domain.FileRecord;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 文件业务接口
 * 说明:系统中用一个user的文件包下以userId命名的包表示前台某个用户的使用文件,前后端用户对文件的操作以此区分
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
     * 上传文件
     *
     * @param file 文件
     * @param path 文件路径
     */
    String uploadFile(MultipartFile file, String path);

    /**
     * 上传用户个人文件
     *
     * @param file 文件
     * @param path 文件路径,前面会添加"/user/userId"
     */
    String uploadUserFile(MultipartFile file, String path);

    /**
     * 根据文件url获取文件id
     *
     * @param fileUrl 文件url
     */
    Integer getFileIdByUrl(String fileUrl);

    /**
     * 创建文件夹
     *
     * @param folder 文件夹信息
     */
    FileRecord createFolder(FolderDTO folder);

    /**
     * 删除文件
     *
     * @param fileIdList 文件id列表
     * @param userPath   用户文件路径
     */
    void deleteFile(List<Integer> fileIdList, String userPath);

    /**
     * 下载文件
     *
     * @param fileId 文件id
     */
    void downloadFile(Integer fileId);
}
