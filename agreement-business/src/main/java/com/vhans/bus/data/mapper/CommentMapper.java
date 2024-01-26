package com.vhans.bus.data.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.data.domain.Comment;
import com.vhans.bus.data.domain.vo.ReplyVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【评论】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface CommentMapper extends BaseMapper<Comment> {
    /**
     * 查询评论列表
     *
     * @param query 条件
     * @return 评论集合
     */
    List<Comment> listCommentVO(@Param("query") Comment.Query query);

    /**
     * 根据父评论id查询子评论id
     *
     * @param parentId 父评论id
     * @return 子评论id列表
     */
    List<Integer> selectCommentIdByParentId(@Param("parentId") Integer parentId);

    /**
     * 查询最新评论
     *
     * @param type 类型(1记录 2问答 3商品)
     * @return 最新评论
     */
    List<Comment> selectRecentComment(@Param("type") Integer type);

    /**
     * 查询评论信息
     *
     * @param commentId 评论id
     * @return 评论信息
     */
    Comment selectCommentById(@Param("commentId") Integer commentId);

    /**
     * 查询父评论
     *
     * @param query 条件
     * @return 评论集合
     */
    List<Comment> selectParentComment(@Param("query") Comment.Query query);

    /**
     * 查询父评论下的前三条子评论
     *
     * @param commentId 父评论id
     * @return 回复集合
     */
    List<ReplyVO> selectReplyLimitByParentId(@Param("commentId") Integer commentId);

    /**
     * 查询父评论下的子评论
     *
     * @param commentId 父评论id
     * @return 回复评论集合
     */
    List<ReplyVO> selectReplyByParentId(@Param("commentId") Integer commentId);
}
