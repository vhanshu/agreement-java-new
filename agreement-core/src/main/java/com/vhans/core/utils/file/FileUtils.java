package com.vhans.core.utils.file;

import lombok.extern.log4j.Log4j2;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.util.DigestUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Objects;

/**
 * 文件md5工具类
 *
 * @author vhans
 */
@Log4j2
public class FileUtils {

    /**
     * 获取文件md5值
     *
     * @param inputStream 文件输入流
     * @return {@link String} 文件md5值
     */
    public static String getMd5(InputStream inputStream) {
        String md5 = null;
        try {
            md5 = DigestUtils.md5DigestAsHex(inputStream);
        } catch (Exception e) {
            log.error("获取md5失败, {}", e.getMessage());
        }
        return md5;
    }

    /**
     * 获取文件名的后缀
     *
     * @param file 表单文件
     * @return 后缀名
     */
    public static String getExtension(MultipartFile file) {
        String extension = FilenameUtils.getExtension(file.getOriginalFilename());
        if (StringUtils.isEmpty(extension)) {
            String mimeType = Objects.requireNonNull(file.getContentType());
            extension = mimeType.substring(mimeType.indexOf("/") + 1);
        }
        return extension;
    }

    /**
     * 获取图片文件类型
     *
     * @param photoByte 文件字节码
     * @return 后缀（不含".")
     */
    public static String getFileExtendName(byte[] photoByte) {
        String strFileExtendName = "JPG";
        if ((photoByte[0] == 71) && (photoByte[1] == 73) && (photoByte[2] == 70) && (photoByte[3] == 56)
                && ((photoByte[4] == 55) || (photoByte[4] == 57)) && (photoByte[5] == 97)) {
            strFileExtendName = "GIF";
        } else if ((photoByte[6] == 74) && (photoByte[7] == 70) && (photoByte[8] == 73) && (photoByte[9] == 70)) {
            strFileExtendName = "JPG";
        } else if ((photoByte[0] == 66) && (photoByte[1] == 77)) {
            strFileExtendName = "BMP";
        } else if ((photoByte[1] == 80) && (photoByte[2] == 78) && (photoByte[3] == 71)) {
            strFileExtendName = "PNG";
        }
        return strFileExtendName;
    }

    /**
     * 转换file
     *
     * @param multipartFile 文件
     * @return {@link File} 临时文件
     */
    public static File multipartFileToFile(MultipartFile multipartFile) {
        File tempFile = null;
        try {
            // 获取文件md5值
            String md5 = getMd5(multipartFile.getInputStream());
            // 获取文件扩展名
            String extName = getExtension(multipartFile);
            // 重新生成文件名
            String fileName = md5 + extName;
            // 创建临时文件
            tempFile = File.createTempFile(fileName, extName);
            multipartFile.transferTo(tempFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return tempFile;
    }

    /**
     * 创建目录
     *
     * @param file 文件
     * @return 是否创建成功
     */
    public static boolean mkdir(File file) {
        if (file == null || file.exists()) {
            return false;
        }
        return file.mkdirs();
    }

    /**
     * 删除目录下的文件
     *
     * @param src 文件
     */
    public static void deleteFile(File src) {
        for (File file : Objects.requireNonNull(src.listFiles())) {
            if (file.isFile()) {
                file.delete();
            } else {
                deleteFile(file);
            }
        }
        src.delete();
    }

}
