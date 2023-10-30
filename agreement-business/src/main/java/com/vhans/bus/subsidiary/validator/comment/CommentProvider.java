package com.vhans.bus.subsidiary.validator.comment;

import com.vhans.bus.data.domain.Comment;
import com.vhans.bus.subsidiary.validator.comment.groups.ParentIdNotNull;
import com.vhans.bus.subsidiary.validator.comment.groups.ParentIdNull;
import com.vhans.bus.subsidiary.validator.comment.groups.Quiz;
import com.vhans.bus.subsidiary.validator.comment.groups.Record;
import org.hibernate.validator.spi.group.DefaultGroupSequenceProvider;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import static com.vhans.core.enums.CommentTypeEnum.*;

/**
 * 评论分组校验器
 *
 * @author vhans
 **/
public class CommentProvider implements DefaultGroupSequenceProvider<Comment> {

    /**
     * 根据实体类 comment 的状态动态地确定验证分组顺序
     *
     * @param comment 评论
     * @return 包含验证分组类的 Class 对象数组
     */
    @Override
    public List<Class<?>> getValidationGroups(Comment comment) {
        List<Class<?>> defaultGroupSequence = new ArrayList<>();
        defaultGroupSequence.add(Comment.class);
        if (comment != null) {
            if (comment.getType().equals(RECORD.getType())) {
                defaultGroupSequence.add(Record.class);
            }
            if (comment.getType().equals(QUIZ.getType())) {
                defaultGroupSequence.add(Quiz.class);
            }
            if (Objects.isNull(comment.getParentId())) {
                defaultGroupSequence.add(ParentIdNull.class);
            }
            if (Objects.nonNull(comment.getParentId())) {
                defaultGroupSequence.add(ParentIdNotNull.class);
            }
        }
        return defaultGroupSequence;
    }
}