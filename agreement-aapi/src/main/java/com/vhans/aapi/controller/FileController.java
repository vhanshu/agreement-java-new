package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.vhans.bus.system.domain.dto.FolderDTO;
import com.vhans.bus.system.domain.FileRecord;
import com.vhans.bus.system.service.IFileRecordService;
import com.vhans.core.annotation.OptLogger;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import static com.vhans.core.constant.OptTypeConstant.*;

/**
 * 文件控制器
 *
 * @author vhans
 **/
@Api(tags = "文件模块")
@RestController
@RequestMapping("/file")
public class FileController extends BaseController {

    @Autowired
    private IFileRecordService fileService;

    /**
     * 查看文件列表
     *
     * @param filePath 文件路径
     * @return {@link FileRecord} 文件列表
     */
    @ApiOperation(value = "查看文件列表")
    @SaCheckPermission("system:file:list")
    @GetMapping("/list")
    public TableDataInfo<FileRecord> listFileRecordList(String filePath) {
        startPage();
        List<FileRecord> list = fileService.listFileRecordList(filePath);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 上传文件
     *
     * @param file 文件
     * @return 结果
     */
    @OptLogger(value = UPLOAD)
    @ApiOperation(value = "上传文件")
    @ApiImplicitParam(name = "file", value = "文件", required = true, dataType = "MultipartFile")
    @SaCheckPermission("system:file:upload")
    @PostMapping("/upload")
    public Result<String> uploadFile(@RequestParam("file") MultipartFile file, @RequestParam("path") String path) {
        return Result.success(fileService.uploadFile(file, path));
    }

    /**
     * 下载或响应文件
     *
     * @param fileId 文件id
     */
    @ApiOperation(value = "下载或响应文件")
    @GetMapping("/download/{fileId}")
    public void downloadFile(@PathVariable("fileId") Integer fileId) {
        fileService.downloadFile(fileId);
    }

    /**
     * 创建目录
     *
     * @param folder 目录信息
     * @return 结果
     */
    @OptLogger(value = ADD)
    @ApiOperation(value = "创建目录")
    @SaCheckPermission("system:file:folder")
    @PostMapping("/createFolder")
    public Result<FileRecord> createFolder(@Validated @RequestBody FolderDTO folder) {
        return Result.success(fileService.createFolder(folder));
    }

    /**
     * 删除文件
     *
     * @param fileIdList 文件id列表
     * @return 结果
     */
    @OptLogger(value = DELETE)
    @ApiOperation(value = "删除文件")
    @SaCheckPermission("system:file:delete")
    @DeleteMapping("/delete")
    public Result<?> deleteFile(@RequestBody List<Integer> fileIdList) {
        fileService.deleteFile(fileIdList, null);
        return Result.success();
    }

}