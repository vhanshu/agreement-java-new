package com.vhans.core.strategy.context;

import com.vhans.core.strategy.SearchStrategy;
import com.vhans.core.web.model.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import static com.vhans.core.enums.SearchModeEnum.getStrategy;

/**
 * 搜索策略上下文
 *
 * @author vhans
 */
@Service
public class SearchStrategyContext {

    /**
     * 搜索模式
     */
    @Value("${search.mode}")
    private String searchMode;

    @Autowired
    private Map<String, SearchStrategy> searchStrategyMap;

    /**
     * 执行搜索策略
     *
     * @param keyword 关键字
     * @param type    类型(1记录 2题目)
     * @return {@link List<SearchVO>} 搜索信息
     */
    public List<SearchVO> executeSearchStrategy(String keyword, Integer type) {
        return searchStrategyMap.get(getStrategy(searchMode)).search(keyword, type);
    }
}