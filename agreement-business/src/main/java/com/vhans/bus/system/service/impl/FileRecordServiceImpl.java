package com.vhans.bus.system.service.impl;

import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.system.domain.FileRecord;
import com.vhans.bus.system.domain.dto.FolderDTO;
import com.vhans.bus.system.mapper.FileRecordMapper;
import com.vhans.bus.system.service.IFileRecordService;
import com.vhans.core.exception.ServiceException;
import com.vhans.core.strategy.context.UploadStrategyContext;
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
    @Value("${upload.local.url}")
    private String localPath;

    /**
     * 上传模式
     */
    @Value("${upload.strategy}")
    private String strategy;

    @Autowired
    private FileRecordMapper fileRecordMapper;

    @Autowired
    private UploadStrategyContext uploadStrategyContext;

    @Autowired
    private HttpServletResponse response;

    @Override
    public List<FileRecord> listFileRecordList(String filePath) {
        return fileRecordMapper.selectList(new LambdaQueryWrapper<FileRecord>()
                .eq(StringUtils.isNotEmpty(filePath), FileRecord::getFilePath, filePath));
    }

    @Override
    public void uploadFile(MultipartFile file, String path) {
        path = path.endsWith("/") ? path : path + "/";
        // 上传文件
        String url = uploadStrategyContext.executeUploadStrategy(file, path);
        Assert.isFalse(fileRecordMapper.exists(new LambdaQueryWrapper<FileRecord>()
                .eq(FileRecord::getFileUrl, url)), "已存在文件内容相同的文件");
        insertFileRecord(file, url, path);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void createFolder(FolderDTO folder) {
        String fileName = folder.getFileName();
        String filePath = folder.getFilePath().endsWith("/") ? folder.getFilePath() : folder.getFilePath() + "/";
        Assert.isFalse(fileRecordMapper.exists(new LambdaQueryWrapper<FileRecord>()
                .eq(FileRecord::getFilePath, filePath)
                .eq(FileRecord::getFileName, fileName)), "目录已存在");
        // 创建目录
        File directory = new File(localPath + filePath + fileName);
        if (FileUtils.mkdir(directory)) {
            fileRecordMapper.insert(FileRecord.builder()
                    .fileName(fileName)
                    .filePath(filePath)
                    .isDir(TRUE).build());
        } else {
            throw new ServiceException("创建目录失败");
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteFile(List<Integer> fileIdList) {
        List<FileRecord> fileRecords = fileRecordMapper.selectList(new LambdaQueryWrapper<FileRecord>()
                .select(FileRecord::getFileName, FileRecord::getFilePath, FileRecord::getExtendName, FileRecord::getIsDir)
                .in(FileRecord::getId, fileIdList));
        // 删除数据库中的文件信息
        fileRecordMapper.deleteBatchIds(fileIdList);
        fileRecords.forEach(item -> {
            File file;
            String fileName = localPath + item.getFilePath() + item.getFileName();
            if (item.getIsDir().equals(TRUE)) {
                // 删除数据库中目录下的子文件
                // 子目录 = 当前路径 + 文件名
                String filePath = item.getFilePath() + item.getFileName();
                fileRecordMapper.delete(new LambdaQueryWrapper<FileRecord>().eq(FileRecord::getFilePath, filePath));
                // 删除目录下的所有文件
                file = new File(fileName);
                if (file.exists()) {
                    FileUtils.deleteFile(file);
                }
            } else {
                // 删除文件
                file = new File(fileName + "." + item.getExtendName());
                if (file.exists()) {
                    file.delete();
                }
            }
        });
    }

    @Override
    public void downloadFile(Integer fileId) {
        // 查询文件信息
        FileRecord fileRecord = fileRecordMapper.selectOne(new LambdaQueryWrapper<FileRecord>()
                .select(FileRecord::getFilePath, FileRecord::getFileUrl, FileRecord::getFileName,
                        FileRecord::getExtendName, FileRecord::getIsDir)
                .eq(FileRecord::getId, fileId));
        Assert.notNull(fileRecord, "文件不存在");
        if (!"local".equals(strategy) && fileRecord.getIsDir().equals(FALSE)) {
            // 上传策略不是local并且不是目录,通过网络链接响应文件
            String fileName = fileRecord.getFileName() + "." + fileRecord.getExtendName();
            downloadFileByUrl(fileRecord.getFileUrl(), fileName);
            return;
        }
        String filePath = localPath + fileRecord.getFilePath();
        if (fileRecord.getIsDir().equals(FALSE)) {
            // 要下载的不是目录
            String fileName = fileRecord.getFileName() + "." + fileRecord.getExtendName();
            downloadFile(filePath, fileName);
        } else {
            // 下载的是目录则压缩下载
            String fileName = filePath + fileRecord.getFileName();
            File src = new File(fileName);
            // 本地缓存压缩文件
            File dest = new File(fileName + ".zip");
            try {
                ZipOutputStream zipOutputStream = new ZipOutputStream(new FileOutputStream(dest));
                // 压缩文件
                toZip(src, zipOutputStream, src.getName());
                zipOutputStream.close();
                // 下载压缩包
                downloadFile(filePath, fileRecord.getFileName() + ".zip");
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

    @Override
    public String uploadCommonFile(MultipartFile file, String path) {
        // 上传文件
        String url = uploadStrategyContext.executeUploadStrategy(file, path);
        // 记录新文件消息到数据库中
        if (!fileRecordMapper.exists(new LambdaQueryWrapper<FileRecord>()
                .eq(FileRecord::getFileUrl, url))) {
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

    /**
     * 下载文件
     *
     * @param filePath 文件路径
     * @param fileName 文件名
     */
    private void downloadFile(String filePath, String fileName) {
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
     * 根据文件URL下载文件
     *
     * @param fileUrl  文件URL
     * @param fileName 文件名
     */
    private void downloadFileByUrl(String fileUrl, String fileName) {
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
     * 压缩文件夹
     *
     * @param src             源文件
     * @param zipOutputStream 压缩输出流
     * @param name            文件名
     * @throws IOException IO异常
     */
    private static void toZip(File src, ZipOutputStream zipOutputStream, String name) throws IOException {
        for (File file : Objects.requireNonNull(src.listFiles())) {
            if (file.isFile()) {
                // 为文件，变成ZipEntry对象，放入到压缩包中
                ZipEntry zipEntry = new ZipEntry(name + "/" + file.getName());
                // 读取文件中的数据，写到压缩包
                zipOutputStream.putNextEntry(zipEntry);
                FileInputStream fileInputStream = new FileInputStream(file);
                int b;
                while ((b = fileInputStream.read()) != -1) {
                    zipOutputStream.write(b);
                }
                fileInputStream.close();
                zipOutputStream.closeEntry();
            } else {
                toZip(file, zipOutputStream, name + "/" + file.getName());
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
}




