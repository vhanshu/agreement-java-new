package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.vhans.bus.system.domain.FileRecord;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.bus.system.service.IFileRecordService;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 通用文件上传控制器
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
     * 上传文件
     *
     * @param file 文件
     * @param path 上传路径
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "上传文件")
    @ApiImplicitParam(name = "file", value = "文件", required = true, dataType = "MultipartFile")
    @PostMapping("/upload")
    public Result<String> uploadFile(@RequestParam("file") MultipartFile file, @RequestParam("path") String path) {
        return Result.success(fileService.uploadCommonFile(file, path));
    }

    /**
     * 响应文件
     *
     * @param fileId 文件id
     */
    @ApiOperation(value = "响应文件")
    @GetMapping("/download/{fileId}")
    public void downloadFile(@PathVariable("fileId") Integer fileId) {
        fileService.downloadFile(fileId);
    }

    /**
     * 查看文件列表
     *
     * @param filePath 文件路径
     * @return {@link FileRecord} 文件列表
     */
    @SaCheckLogin
    @ApiOperation(value = "查看文件列表")
    @GetMapping("/list")
    public TableDataInfo<FileRecord> listFileRecordList(String filePath) {
        startPage();
        List<FileRecord> list = fileService.listFileRecordHome(filePath);
        clearPage();
        return getDataTable(list);
    }
}