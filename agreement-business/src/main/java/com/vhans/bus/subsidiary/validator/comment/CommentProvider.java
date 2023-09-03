package com.vhans.bus.subsidiary.validator.comment;

import com.vhans.bus.subsidiary.validator.comment.groups.ParentIdNotNull;
import com.vhans.bus.subsidiary.validator.comment.groups.ParentIdNull;
import com.vhans.bus.subsidiary.validator.comment.groups.Quiz;
import com.vhans.bus.subsidiary.validator.comment.groups.Record;
import com.vhans.bus.data.domain.dto.CommentDTO;
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
public class CommentProvider implements DefaultGroupSequenceProvider<CommentDTO> {

    /**
     * 根据实体类 CommentDTO 的状态动态地确定验证分组顺序
     *
     * @param commentDTO 评论DTO
     * @return 包含验证分组类的 Class 对象数组
     */
    @Override
    public List<Class<?>> getValidationGroups(CommentDTO commentDTO) {
        List<Class<?>> defaultGroupSequence = new ArrayList<>();
        defaultGroupSequence.add(CommentDTO.class);
        if (commentDTO != null) {
            if (commentDTO.getType().equals(RECORD.getType())) {
                defaultGroupSequence.add(Record.class);
            }
            if (commentDTO.getType().equals(QUIZ.getType())) {
                defaultGroupSequence.add(Quiz.class);
            }
            if (Objects.isNull(commentDTO.getParentId())) {
                defaultGroupSequence.add(ParentIdNull.class);
            }
            if (Objects.nonNull(commentDTO.getParentId())) {
                defaultGroupSequence.add(ParentIdNotNull.class);
            }
        }
        return defaultGroupSequence;
    }
}