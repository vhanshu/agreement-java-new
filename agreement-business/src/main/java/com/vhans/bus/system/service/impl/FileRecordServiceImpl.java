package com.vhans.bus.system.service.impl;

import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.system.domain.FileRecord;
import com.vhans.bus.system.domain.dto.FolderDTO;
import com.vhans.bus.system.mapper.FileRecordMapper;
import com.vhans.bus.system.service.IFileRecordService;
import com.vhans.core.exception.ServiceException;
import com.vhans.core.strategy.context.FileStrategyContext;
import com.vhans.core.utils.data.StringUtils;
import com.vhans.core.utils.file.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Objects;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import static com.vhans.core.constant.CommonConstant.FALSE;
import static com.vhans.core.constant.CommonConstant.TRUE;

/**
 * 文件业务接口实现类
 *
 * @author vhans
 */
@Service("fileRecordServiceImpl")
public class FileRecordServiceImpl extends ServiceImpl<FileRecordMapper, FileRecord> implements IFileRecordService {
    /**
     * 本地路径
     */
    @Value("${upload.local.path}")
    private String localPath;

    /**
     * 上传模式
     */
    @Value("${upload.strategy}")
    private String strategy;

    @Autowired
    private FileRecordMapper fileRecordMapper;

    @Autowired
    private FileStrategyContext fileStrategyContext;

    @Autowired
    private HttpServletResponse response;

    @Override
    public List<FileRecord> listFileRecordList(String filePath) {
        filePath = "/" + filePath.replaceAll("^/?(.*?)/?$", "$1") + "/";
        return fileRecordMapper.selectList(new LambdaQueryWrapper<FileRecord>()
                .eq(StringUtils.isNotEmpty(filePath), FileRecord::getFilePath, filePath));
    }

    @Override
    public String uploadFile(MultipartFile file, String path) {
        // 上传文件
        String url = fileStrategyContext.executeUploadStrategy(file, path);
        // 记录新文件消息到数据库中
        if (!fileRecordMapper.exists(new LambdaQueryWrapper<FileRecord>().eq(FileRecord::getFileUrl, url))) {
            insertFileRecord(file, url, path);
        }
        return url;
    }

    @Override
    public Integer getFileIdByUrl(String fileUrl) {
        FileRecord fileRecord = fileRecordMapper.selectOne(new LambdaQueryWrapper<FileRecord>()
                .select(FileRecord::getId)
                .eq(FileRecord::getFileUrl, fileUrl));
        if (Objects.isNull(fileRecord)) {
            return null;
        }
        return fileRecord.getId();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void createFolder(FolderDTO folder) {
        String fileName = folder.getFileName();
        String path = folder.getFilePath().endsWith("/") ? folder.getFilePath() : folder.getFilePath() + "/";
        path = path.startsWith("/") ? path : "/" + path;
        Assert.isFalse(fileRecordMapper.exists(new LambdaQueryWrapper<FileRecord>()
                .eq(FileRecord::getIsDir, TRUE)
                .eq(FileRecord::getFilePath, path)
                .eq(FileRecord::getFileName, fileName)), "目录已存在");
        // 创建目录
        fileStrategyContext.executeCreateStrategy(path, fileName);
        fileRecordMapper.insert(FileRecord.builder()
                .fileName(fileName)
                .fileUrl("")
                .filePath(path)
                .extendName("")
                .fileSize(0)
                .isDir(TRUE).build());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteFile(List<Integer> fileIdList, String userPath) {
        List<FileRecord> fileRecords = fileRecordMapper.selectList(new LambdaQueryWrapper<FileRecord>()
                .select(FileRecord::getFileName, FileRecord::getFilePath, FileRecord::getExtendName,
                        FileRecord::getIsDir, FileRecord::getFileUrl)
                .likeRight(userPath != null, FileRecord::getFilePath, userPath)
                .in(FileRecord::getId, fileIdList));
        fileRecords.forEach(item -> {
            if (item.getIsDir().equals(TRUE)) {
                String filePath = item.getFilePath() + item.getFileName() + "/";
                // 删除文件服务器上的父/子文件和子目录
                fileStrategyContext.executeDeleteStrategy(filePath);
                // 删除数据库中目录下的父/子文件和子目录
                fileRecordMapper.delete(new LambdaQueryWrapper<FileRecord>().likeRight(FileRecord::getFilePath, filePath));
            } else {
                // 删除文件服务器上的文件(文件名md5)
                String fileName = item.getFileUrl().substring(item.getFileUrl().lastIndexOf("/") + 1);
                fileStrategyContext.executeDeleteStrategy(item.getFilePath() + fileName);
            }
        });
        // 删除数据库中的文件信息
        fileRecordMapper.deleteBatchIds(fileIdList);
    }

    @Override
    public void downloadFile(Integer fileId) {
        // 查询文件信息
        FileRecord fileRecord = fileRecordMapper.selectOne(new LambdaQueryWrapper<FileRecord>()
                .select(FileRecord::getFilePath, FileRecord::getFileUrl, FileRecord::getFileName,
                        FileRecord::getExtendName, FileRecord::getIsDir)
                .eq(FileRecord::getId, fileId));
        Assert.notNull(fileRecord, "文件不存在");
        // 本地文件路径
        String localFilePath = localPath + fileRecord.getFilePath();
        if (fileRecord.getIsDir().equals(FALSE)) {
            // 要下载的是一个文件
            String fileName = fileRecord.getFileName() + "." + fileRecord.getExtendName();
            if ("local".equals(strategy)) {
                //本地下载
                responseFile(localFilePath, fileName);
            } else {
                //云端下载
                responseFileByUrl(fileRecord.getFileUrl(), fileName);
            }
        } else {
            // 下载的是目录则压缩下载
            // 本地缓存压缩文件
            String cacheFileName = localFilePath + fileRecord.getFileName();
            File dest = new File(cacheFileName + ".zip");
            try {
                // 压缩文件
                ZipOutputStream zipOutputStream = new ZipOutputStream(new FileOutputStream(dest));
                if ("local".equals(strategy)) {
                    // 本地压缩
                    File src = new File(cacheFileName);
                    toLocalZip(src, zipOutputStream, src.getName());
                } else {
                    // 云端压缩(这里不区分上下级,直接压缩所有子文件入一个包)
                    List<FileRecord> fileRecords = fileRecordMapper.selectList(new LambdaQueryWrapper<FileRecord>()
                            .select(FileRecord::getFileUrl, FileRecord::getFileName, FileRecord::getExtendName)
                            .eq(FileRecord::getIsDir, FALSE)
                            .likeRight(FileRecord::getFilePath, fileRecord.getFilePath() + fileRecord.getFileName() + "/"));
                    Assert.notEmpty(fileRecords, "该目录下没有任何文件");
                    toCloudZip(fileRecords, zipOutputStream, fileRecord.getFileName());
                }
                zipOutputStream.close();
                // 下载压缩包
                responseFile(localFilePath, fileRecord.getFileName() + ".zip");
            } catch (IOException e) {
                throw new ServiceException(e.getMessage());
            } finally {
                // 删除本地缓存压缩文件
                if (dest.exists()) {
                    dest.delete();
                }
            }
        }
    }

    /**
     * 数据库中新增文件记录
     *
     * @param file 上传的文件
     * @param url  访问链接
     * @param path 文件路径
     */
    private void insertFileRecord(MultipartFile file, String url, String path) {
        path = "/" + path.replaceAll("^/?(.*?)/?$", "$1") + "/";
        // 获取文件名和扩展名
        String fileName = Objects.requireNonNull(file.getOriginalFilename()).substring(0, file.getOriginalFilename().lastIndexOf("."));
        String extName = FileUtils.getExtension(file);
        // 保存文件信息
        fileRecordMapper.insert(FileRecord.builder()
                .fileUrl(url)
                .fileName(fileName)
                .filePath(path)
                .extendName(extName)
                .fileSize((int) file.getSize())
                .isDir(FALSE).build());
    }

    /**
     * 响应本地文件内容
     *
     * @param filePath 文件路径
     * @param fileName 文件名
     */
    private void responseFile(String filePath, String fileName) {
        FileInputStream fileInputStream = null;
        ServletOutputStream outputStream = null;
        try {
            // 设置文件名
            response.addHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode(fileName, StandardCharsets.UTF_8));
            fileInputStream = new FileInputStream(filePath + fileName);
            outputStream = response.getOutputStream();
            IOUtils.copyLarge(fileInputStream, outputStream);
        } catch (IOException e) {
            throw new ServiceException("文件下载失败");
        } finally {
            IOUtils.closeQuietly(fileInputStream);
            IOUtils.closeQuietly(outputStream);
        }
    }

    /**
     * 根据文件URL响应文件
     *
     * @param fileUrl  文件URL
     * @param fileName 文件名
     */
    private void responseFileByUrl(String fileUrl, String fileName) {
        HttpURLConnection connection = null;
        InputStream inputStream = null;
        ServletOutputStream outputStream = null;
        try {
            // 提供文件阅览
            URL url = new URL(fileUrl);
            // 打开连接
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(5000);
            // 获取输入流
            inputStream = connection.getInputStream();
            // 设置文件名
            response.addHeader("Content-Disposition", "attachment; fileName=" + URLEncoder.encode(fileName, StandardCharsets.UTF_8));
            outputStream = response.getOutputStream();
            IOUtils.copyLarge(inputStream, outputStream);
        } catch (IOException e) {
            throw new ServiceException("文件下载失败");
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
            IOUtils.closeQuietly(inputStream);
            IOUtils.closeQuietly(outputStream);
        }
    }

    /**
     * 压缩本地文件夹
     *
     * @param src             源文件
     * @param zipOutputStream 压缩输出流
     * @param fileName        文件名
     */
    private static void toLocalZip(File src, ZipOutputStream zipOutputStream, String fileName) throws IOException {
        for (File file : Objects.requireNonNull(src.listFiles())) {
            if (file.isFile()) {
                // 为文件，变成ZipEntry对象，放入到压缩包中
                ZipEntry zipEntry = new ZipEntry(fileName + "/" + file.getName());
                // 绑定压缩文件到压缩包
                zipOutputStream.putNextEntry(zipEntry);
                // 读取本地文件中的数据
                FileInputStream fileInputStream = new FileInputStream(file);
                int b;
                while ((b = fileInputStream.read()) != -1) {
                    zipOutputStream.write(b);
                }
                fileInputStream.close();
                zipOutputStream.closeEntry();
            } else {
                toLocalZip(file, zipOutputStream, fileName + "/" + file.getName());
            }
        }
    }

    /**
     * 压缩云端文件夹
     *
     * @param fileList        文件列表
     * @param zipOutputStream 压缩输出流
     * @param fileName        文件名
     */
    private static void toCloudZip(List<FileRecord> fileList, ZipOutputStream zipOutputStream, String fileName) throws IOException {
        for (FileRecord fileRecord : fileList) {
            String currentName = fileRecord.getFileName() + "." + fileRecord.getExtendName();
            // 要放入的压缩文件
            ZipEntry zipEntry = new ZipEntry(fileName + "/" + currentName);
            // 绑定压缩文件
            zipOutputStream.putNextEntry(zipEntry);
            // 下载文件并写入 ZipOutputStream
            downloadFile(fileRecord.getFileUrl(), zipOutputStream);
            zipOutputStream.closeEntry();
        }

    }

    /**
     * 根据网络url下载文件
     *
     * @param fileUrl      文件url
     * @param outputStream 输出流
     */
    private static void downloadFile(String fileUrl, OutputStream outputStream) throws IOException {
        URL url = new URL(fileUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        //将获取到的数据写入输出流
        try (InputStream inputStream = connection.getInputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }
    }
}




