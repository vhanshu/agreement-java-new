package com.vhans.bus.data.strategy;

import com.vhans.bus.data.mapper.AgreeRecordMapper;
import com.vhans.bus.data.mapper.ProductMapper;
import com.vhans.bus.data.mapper.QuizMapper;
import com.vhans.core.strategy.SearchStrategy;
import com.vhans.core.utils.data.StringUtils;
import com.vhans.core.web.model.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.vhans.core.constant.ElasticConstant.POST_TAG;
import static com.vhans.core.constant.ElasticConstant.PRE_TAG;
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

    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<SearchVO> search(String keyword, Integer type) {
        if (StringUtils.isBlank(keyword)) {
            return new ArrayList<>();
        }
        List<SearchVO> searchVOList = getSearchList(keyword, type);
        return searchVOList.stream().peek(item -> {
            item.setType(StringUtils.isNull(item.getType()) ? ZERO : item.getType());
            // 获取关键词第一次出现的位置
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
                item.setContent((preText + postText).replaceAll(keyword, PRE_TAG + keyword + POST_TAG));
            } else {
                item.setContent(item.getContent().length() > 200 ? item.getContent().substring(0, 200) + "..." : item.getContent());
            }
            // 标题高亮
            item.setTitle(item.getTitle().replaceAll(keyword, PRE_TAG + keyword + POST_TAG));
        }).toList();
    }

    private List<SearchVO> getSearchList(String keyword, Integer type) {
        return switch (type) {
            case 1 -> recordMapper.searchRecord(keyword);
            case 2 -> quizMapper.searchQuiz(keyword);
            case 3 -> productMapper.searchProduct(keyword);
            default -> new ArrayList<>();
        };
    }
}
