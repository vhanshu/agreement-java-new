package com.vhans.core.rabbitmq.service.impl;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch.core.IndexRequest;
import com.vhans.core.rabbitmq.service.ElasticsearchService;
import com.vhans.core.web.model.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vhans.core.enums.ElasticEnum;

import java.io.IOException;

/**
 * es文本业务接口实现类
 *
 * @author vhans
 **/
@Service
public class ElasticsearchServiceImpl implements ElasticsearchService {

    @Autowired
    private ElasticsearchClient elasticsearchClient;

    @Override
    public void addText(SearchVO searchVO, Integer type) {
        try {
            // 创建一个 IndexRequest 对象，该对象包含了要添加到索引中的记录的信息，包括索引名称、记录ID 和记录内容
            IndexRequest<SearchVO> indexRequest = IndexRequest.of(request ->
                    request.index(ElasticEnum.getIndex(type)).id(searchVO.getId().toString()).document(searchVO));
            // 将记录添加到指定的索引中
            elasticsearchClient.index(indexRequest);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateText(SearchVO searchVO, Integer type) {
        try {
            elasticsearchClient.update(request ->
                    request.index(ElasticEnum.getIndex(type)).id(searchVO.getId().toString()).doc(searchVO), SearchVO.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteText(Integer id, Integer type) {
        try {
            elasticsearchClient.delete(deleteRequest ->
                    deleteRequest.index(ElasticEnum.getIndex(type)).id(id.toString()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}