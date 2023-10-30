package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.vhans.bus.data.domain.Comment;
import com.vhans.bus.data.service.ICommentService;
import com.vhans.bus.data.domain.vo.ReplyVO;
import com.vhans.core.enums.LikeTypeEnum;
import com.vhans.core.strategy.context.LikeStrategyContext;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    @Autowired
    private LikeStrategyContext likeStrategyContext;

    /**
     * 添加评论
     *
     * @param comment 评论信息
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "添加评论")
    @PostMapping("/add")
    public Result<?> addComment(@Validated @RequestBody Comment comment) {
        commentService.addComment(comment);
        return Result.success();
    }

    /**
     * 点赞评论
     *
     * @param commentId 评论id
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "点赞评论")
    @PostMapping("/like/{commentId}")
    public Result<?> likeComment(@PathVariable("commentId") Integer commentId) {
        likeStrategyContext.executeLikeStrategy(LikeTypeEnum.COMMENT, commentId);
        return Result.success();
    }

    /**
     * 查看最新评论
     *
     * @return {@link List<Comment>}
     */
    @ApiOperation(value = "查看最新评论")
    @GetMapping("/recent")
    public Result<List<Comment>> listRecentCommentVO() {
        return Result.success(commentService.listRecentCommentVO());
    }

    /**
     * 查看评论列表
     *
     * @param query 条件
     * @return {@link Comment} 评论列表
     */
    @ApiOperation(value = "查看评论列表")
    @GetMapping("/list")
    public TableDataInfo<Comment> listCommentVO(Comment.Query query) {
        startPage();
        List<Comment> list = commentService.listCommentHomeVO(query);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 查看回复评论
     *
     * @param commentId 评论id
     * @return {@link Result<ReplyVO>} 回复评论列表
     */
    @ApiOperation(value = "查看回复评论")
    @GetMapping("/reply/{commentId}")
    public TableDataInfo<ReplyVO> listReply(@PathVariable("commentId") Integer commentId) {
        startPage();
        List<ReplyVO> list = commentService.listReply(commentId);
        clearPage();
        return getDataTable(list);
    }

}