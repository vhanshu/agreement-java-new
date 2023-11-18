package com.vhans.bus.data.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.data.domain.AgreeRecord;
import com.vhans.bus.data.domain.vo.OverviewVO;
import com.vhans.bus.data.domain.vo.StatisticsVO;
import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import com.vhans.core.web.model.vo.SearchVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【记录】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface AgreeRecordMapper extends BaseMapper<AgreeRecord> {

    /**
     * 查询记录列表
     *
     * @param query 条件
     * @return 记录列表
     */
    List<AgreeRecord> selectAgreeRecord(@Param("query") AgreeRecord.Query query);

    /**
     * 记录搜索
     *
     * @param keyword 关键字
     * @return 记录列表
     */
    List<SearchVO> searchRecord(@Param("keyword") String keyword);

    /**
     * 根据id查看前台记录信息
     *
     * @param recordId 记录id
     * @return 记录信息
     */
    AgreeRecord selectRecordHomeById(@Param("recordId") Integer recordId);

    /**
     * 根据关键字查看记录列表
     *
     * @param query 关键字和类型
     * @return 记录列表
     */
    List<AgreeRecord> listAgreeRecord(@Param("query") AgreeRecord.Query query);

    /**
     * 查询推荐记录
     *
     * @return 记录列表
     */
    List<AgreeRecord> listAgreeRecordR();

    /**
     * 查询上一篇记录
     *
     * @param recordId 记录id
     * @return 上一篇记录
     */
    PaginationVO selectLastRecord(Integer recordId);

    /**
     * 查询下一篇记录
     *
     * @param recordId 记录id
     * @return 下一篇记录
     */
    PaginationVO selectNextRecord(Integer recordId);

    /**
     * 查询记录总览
     *
     * @return 记录归档
     */
    List<OverviewVO> selectOverviewRecordList();

    /**
     * 查询记录统计
     *
     * @return 记录统计
     */
    List<StatisticsVO> selectRecordStatistics();

}
