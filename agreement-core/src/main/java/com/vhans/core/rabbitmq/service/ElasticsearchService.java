package com.vhans.core.rabbitmq.service;

import com.vhans.core.web.model.vo.SearchVO;

/**
 * es文本业务接口
 *
 * @author vhans
 */
public interface ElasticsearchService {

    /**
     * 添加文本
     *
     * @param searchVO 文本
     * @param type     类型
     */
    void addText(SearchVO searchVO, Integer type);

    /**
     * 更新记录
     *
     * @param searchVO 文本
     * @param type     类型
     */
    void updateText(SearchVO searchVO, Integer type);

    /**
     * 删除记录
     *
     * @param id   id
     * @param type 类型
     */
    void deleteText(Integer id, Integer type);
}
