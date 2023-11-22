package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.stp.StpUtil;
import com.vhans.bus.system.domain.FileRecord;
import com.vhans.bus.system.domain.dto.FolderDTO;
import com.vhans.core.annotation.OptLogger;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.bus.system.service.IFileRecordService;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import static com.vhans.core.constant.OptTypeConstant.ADD;
import static com.vhans.core.constant.OptTypeConstant.DELETE;

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
     * @param path 文件路径
     * @return {@link FileRecord} 用户文件列表
     */
    @SaCheckLogin
    @ApiOperation(value = "查看用户文件列表")
    @GetMapping("/list")
    public TableDataInfo<FileRecord> listFileRecordList(String path) {
        path = "/user/" + StpUtil.getLoginIdAsInt() + "/" + path.replaceAll("^/?(.*?)/?$", "$1") + "/";
        startPage();
        List<FileRecord> list = fileService.listFileRecordList(path);
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
        path = "/user/" + StpUtil.getLoginIdAsInt() + "/" + path.replaceAll("^/?(.*?)/?$", "$1") + "/";
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
     * 创建用户目录
     *
     * @param folder 目录信息
     * @return 结果
     */
    @OptLogger(value = ADD)
    @ApiOperation(value = "创建用户目录")
    @PostMapping("/createFolder")
    public Result<?> createFolder(@Validated @RequestBody FolderDTO folder) {
        if (!folder.getFilePath().startsWith("/")) {
            folder.setFilePath("/" + folder.getFilePath());
        }
        folder.setFilePath("/user/" + StpUtil.getLoginIdAsInt() + folder.getFilePath());
        fileService.createFolder(folder);
        return Result.success();
    }

    /**
     * 删除用户文件
     *
     * @param fileIdList 文件id列表
     * @return 结果
     */
    @OptLogger(value = DELETE)
    @ApiOperation(value = "删除用户文件")
    @SaCheckPermission("system:file:delete")
    @DeleteMapping("/delete")
    public Result<?> deleteFile(@RequestBody List<Integer> fileIdList) {
        String userPath = "/user/" + StpUtil.getLoginIdAsInt();
        fileService.deleteFile(fileIdList, userPath);
        return Result.success();
    }
}