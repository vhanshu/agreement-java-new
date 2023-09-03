package com.vhans.core.strategy;

import com.vhans.core.web.model.vo.SearchVO;

import java.util.List;

/**
 * 文本搜索策略
 *
 * @author vhans
 */
public interface SearchStrategy {

    /**
     * 搜索记录
     *
     * @param keyword 关键字
     * @param type    类型(1记录 2题目)
     * @return {@link List<SearchVO>} 记录列表
     */
    List<SearchVO> search(String keyword, Integer type);
}
