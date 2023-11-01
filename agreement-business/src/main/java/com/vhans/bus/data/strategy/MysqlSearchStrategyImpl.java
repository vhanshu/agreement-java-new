package com.vhans.bus.data.strategy;

import com.vhans.bus.data.mapper.AgreeRecordMapper;
import com.vhans.bus.data.mapper.QuizMapper;
import com.vhans.core.strategy.SearchStrategy;
import com.vhans.core.utils.data.StringUtils;
import com.vhans.core.web.model.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import static com.vhans.core.constant.ElasticConstant.POST_TAG;
import static com.vhans.core.constant.ElasticConstant.PRE_TAG;
import static com.vhans.core.constant.NumberConstant.ONE;
import static com.vhans.core.constant.NumberConstant.ZERO;

/**
 * MySQL搜索策略
 *
 * @author vhans
 */
@Service("mySqlSearchStrategyImpl")
public class MysqlSearchStrategyImpl implements SearchStrategy {

    @Autowired
    private AgreeRecordMapper recordMapper;

    @Autowired
    private QuizMapper quizMapper;

    @Override
    public List<SearchVO> search(String keyword, Integer type) {
        if (StringUtils.isBlank(keyword)) {
            return new ArrayList<>();
        }
        List<SearchVO> searchVOList = type == ONE ? recordMapper.searchRecord(keyword) : quizMapper.searchQuiz(keyword);
        return searchVOList.stream().map(item -> {
            // 获取关键词第一次出现的位置
            String recordContent = item.getContent();
            int index = item.getContent().indexOf(keyword);
            if (index != -1) {
                // 获取关键词前面的文字
                int preIndex = index > 25 ? index - 25 : 0;
                String preText = item.getContent().substring(preIndex, index);
                // 获取关键词到后面的文字
                int last = index + keyword.length();
                int postLength = item.getContent().length() - last;
                int postIndex = postLength > 175 ? last + 175 : last + postLength;
                String postText = item.getContent().substring(index, postIndex);
                // 内容高亮
                recordContent = (preText + postText).replaceAll(keyword, PRE_TAG + keyword + POST_TAG);
            }
            // 标题高亮
            String recordTitle = item.getTitle().replaceAll(keyword, PRE_TAG + keyword + POST_TAG);
            return SearchVO.builder()
                    .id(item.getId())
                    .title(recordTitle)
                    .content(recordContent)
                    .type(StringUtils.isNotNull(item.getType()) ? item.getType() : ZERO)
                    .build();
        }).collect(Collectors.toList());
    }
}
