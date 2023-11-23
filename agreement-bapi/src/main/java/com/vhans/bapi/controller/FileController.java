package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.stp.StpUtil;
import com.vhans.bus.system.domain.FileRecord;
import com.vhans.bus.system.domain.dto.FolderDTO;
import com.vhans.bus.system.service.IFileRecordService;
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
     * 查看用户文件列表
     *
     * @param filePath 文件路径
     * @return {@link FileRecord} 用户文件列表
     */
    @SaCheckLogin
    @ApiOperation(value = "查看用户文件列表")
    @GetMapping("/list")
    public TableDataInfo<FileRecord> listFileRecordList(String filePath) {
        if (!filePath.startsWith("/")) {
            filePath = "/" + filePath;
        }
        filePath = "/user/" + StpUtil.getLoginIdAsInt() + filePath;
        startPage();
        List<FileRecord> list = fileService.listFileRecordList(filePath);
        clearPage();
        return getDataTable(list);
    }

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
        return Result.success(fileService.uploadFile(file, path));
    }

    /**
     * 上传用户个人文件
     *
     * @param file 文件
     * @param path 上传路径
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "上传用户个人文件")
    @ApiImplicitParam(name = "file", value = "文件", required = true, dataType = "MultipartFile")
    @PostMapping("/uploadUser")
    public Result<String> uploadUserFile(@RequestParam("file") MultipartFile file, @RequestParam("path") String path) {
        return Result.success(fileService.uploadUserFile(file, path));
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
     * 创建用户目录
     *
     * @param folder 目录信息
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "创建用户目录")
    @PostMapping("/createFolder")
    public Result<FileRecord> createFolder(@Validated @RequestBody FolderDTO folder) {
        if (!folder.getFilePath().startsWith("/")) {
            folder.setFilePath("/" + folder.getFilePath());
        }
        folder.setFilePath("/user/" + StpUtil.getLoginIdAsInt() + folder.getFilePath());
        return Result.success(fileService.createFolder(folder));
    }

    /**
     * 删除用户文件
     *
     * @param fileIdList 文件id列表
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "删除用户文件")
    @DeleteMapping("/delete")
    public Result<?> deleteFile(@RequestBody List<Integer> fileIdList) {
        String userPath = "/user/" + StpUtil.getLoginIdAsInt();
        fileService.deleteFile(fileIdList, userPath);
        return Result.success();
    }
}