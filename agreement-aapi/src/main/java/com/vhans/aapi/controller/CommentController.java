package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.vhans.bus.data.domain.Comment;
import com.vhans.bus.data.service.ICommentService;
import com.vhans.bus.subsidiary.model.dto.CheckDTO;
import com.vhans.core.annotation.OptLogger;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.vhans.core.constant.OptTypeConstant.DELETE;
import static com.vhans.core.constant.OptTypeConstant.UPDATE;

/**
 * 评论控制器
 *
 * @author vhans
 **/
@Api(tags = "评论模块")
@RestController
@RequestMapping("/comment")
public class CommentController extends BaseController {

    @Autowired
    private ICommentService commentService;

    /**
     * 查看评论列表
     *
     * @param query 条件
     * @return {@link Comment} 评论
     */
    @ApiOperation(value = "查看评论列表")
    @SaCheckPermission("web:comment:list")
    @GetMapping("/list")
    public TableDataInfo<Comment> listCommentVO(Comment.Query query) {
        startPage();
        List<Comment> list = commentService.listCommentVO(query);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 删除评论
     *
     * @param commentIdList 评论id
     * @return 结果
     */
    @OptLogger(value = DELETE)
    @ApiOperation(value = "删除评论")
    @SaCheckPermission("web:comment:delete")
    @DeleteMapping("/delete")
    public Result<?> deleteComment(@RequestBody List<Integer> commentIdList) {
        commentService.removeByIds(commentIdList);
        return Result.success();
    }

    /**
     * 审核评论
     *
     * @param check 审核信息
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "审核评论")
    @SaCheckPermission("web:comment:pass")
    @PutMapping("/pass")
    public Result<?> updateCommentCheck(@Validated @RequestBody CheckDTO check) {
        commentService.updateCommentCheck(check);
        return Result.success();
    }
}