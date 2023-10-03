package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.bus.system.service.IFileRecordService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
     * @param type 存储类型(1头像 2配置 3约起 4记录 5题目)
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "上传文件")
    @ApiImplicitParam(name = "file", value = "文件", required = true, dataType = "MultipartFile")
    @PostMapping("/upload")
    public Result<String> uploadFile(@RequestParam("file") MultipartFile file, @RequestParam("type") Integer type) {
        return Result.success(fileService.uploadCommonFile(file, type));
    }

    /**
     * 下载文件
     *
     * @param fileId 文件id
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "下载文件")
    @PostMapping("/download/{fileId}")
    public Result<?> downloadFile(@PathVariable("fileId") Integer fileId) {
        fileService.downloadFile(fileId);
        return Result.success();
    }
}