package com.vhans.bus.data.service;

import com.vhans.bus.data.domain.Comment;
import com.vhans.bus.subsidiary.model.dto.CheckDTO;
import com.vhans.bus.data.domain.vo.ReplyVO;

import java.util.List;

/**
 * 评论业务接口
 *
 * @author vhans
 */
public interface ICommentService {

    /**
     * 查看评论列表
     *
     * @param query 条件
     * @return 后台评论列表
     */
    List<Comment> listCommentVO(Comment.Query query);

    /**
     * 添加评论
     *
     * @param comment 评论信息
     * @return 影响行
     */
    int addComment(Comment comment);

    /**
     * 审核评论
     *
     * @param check 审核信息
     */
    void updateCommentCheck(CheckDTO check);

    /**
     * 查看最新评论
     *
     * @return 最新评论
     */
    List<Comment> listRecentCommentVO();

    /**
     * 查看前台评论
     *
     * @param query 条件
     * @return 评论列表
     */
    List<Comment> listCommentHomeVO(Comment.Query query);

    /**
     * 获取评论信息
     *
     * @param commentId 评论id
     * @return 评论信息
     */
    Comment getCommentInfo(Integer commentId);

    /**
     * 查看回复评论
     *
     * @param commentId 评论id
     * @return 回复评论
     */
    List<ReplyVO> listReply(Integer commentId);

    /**
     * 批量删除评论
     */
    void removeByIds(List<Integer> commentIdList);
}
