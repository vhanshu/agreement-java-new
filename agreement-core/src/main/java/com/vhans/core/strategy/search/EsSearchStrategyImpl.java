package com.vhans.core.strategy.search;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch._types.FieldValue;
import co.elastic.clients.elasticsearch.core.SearchRequest;
import co.elastic.clients.elasticsearch.core.SearchResponse;
import com.vhans.core.enums.ElasticEnum;
import com.vhans.core.strategy.SearchStrategy;
import com.vhans.core.utils.data.StringUtils;
import com.vhans.core.web.model.vo.SearchVO;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import static com.vhans.core.constant.CommonConstant.FALSE;
import static com.vhans.core.constant.ElasticConstant.POST_TAG;
import static com.vhans.core.constant.ElasticConstant.PRE_TAG;
import static com.vhans.core.enums.RecordStatusEnum.PUBLIC;

/**
 * ES搜索策略
 *
 * @author vhans
 */
@Service
@Log4j2
public class EsSearchStrategyImpl implements SearchStrategy {

    @Autowired
    private ElasticsearchClient elasticsearchClient;

    @Override
    public List<SearchVO> search(String keyword, Integer type) {
        if (StringUtils.isBlank(keyword)) {
            return new ArrayList<>();
        }
        try {
            // 条件构造
            SearchRequest searchRequest = SearchRequest.of(s -> s.index(ElasticEnum.getIndex(type))
                    .query(query -> query
                            .bool(bool -> bool
                                    .must(must -> must.match(m -> m.field("all").query(FieldValue.of(keyword))))
                                    .must(must -> must.term(m -> m.field("isDelete").value(FieldValue.of(FALSE))))
                                    .must(must -> must.term(m -> m.field("status").value(FieldValue.of(PUBLIC.getStatus())))))
                    ).highlight(h -> h
                            .fields(ElasticEnum.getTitle(type), f -> f.preTags(PRE_TAG).postTags(POST_TAG))
                            .fields(ElasticEnum.getContent(type), f -> f.preTags(PRE_TAG).postTags(POST_TAG))
                            .requireFieldMatch(false)
                    ));
            SearchResponse<SearchVO> search = elasticsearchClient.search(searchRequest, SearchVO.class);
            // 解析记录结果
            return handleRecordResponse(search, type);
        } catch (Exception e) {
            log.error(e.getMessage());
        }
        return new ArrayList<>();
    }
    private List<SearchVO> handleRecordResponse(SearchResponse<SearchVO> response, Integer type) {
        // 解析结果并返回
        return response.hits().hits().stream()
                .map(hit -> {
                    if (StringUtils.isNotEmpty(hit.highlight().get(ElasticEnum.getTitle(type)))) {
                        Objects.requireNonNull(hit.source()).setTitle(hit.highlight().get(ElasticEnum.getTitle(type)).get(0));
                    }
                    if (StringUtils.isNotEmpty(hit.highlight().get(ElasticEnum.getContent(type)))) {
                        Objects.requireNonNull(hit.source()).setContent(hit.highlight().get(ElasticEnum.getContent(type)).get(0));
                    } else {
                        Objects.requireNonNull(hit.source()).setContent(hit.source().getContent().substring(0, 300));
                    }
                    return hit.source();
                })
                .collect(Collectors.toList());
    }
}