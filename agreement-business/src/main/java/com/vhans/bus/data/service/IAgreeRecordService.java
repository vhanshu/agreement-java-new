package com.vhans.bus.data.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.data.domain.AgreeRecord;
import com.vhans.bus.subsidiary.model.dto.DeleteDTO;
import com.vhans.bus.subsidiary.model.dto.RecommendDTO;
import com.vhans.bus.subsidiary.model.dto.TopDTO;
import com.vhans.bus.data.domain.vo.OverviewVO;
import com.vhans.core.web.model.vo.SearchVO;

import java.util.List;

/**
 * 记录业务接口
 *
 * @author vhans
 **/
public interface IAgreeRecordService extends IService<AgreeRecord> {

    /**
     * 查看记录列表
     *
     * @param query 条件
     * @return 记录列表
     */
    List<AgreeRecord> listAgreeRecord(AgreeRecord.Query query);

    /**
     * 添加记录
     *
     * @param record 记录
     */
    void addRecord(AgreeRecord record);

    /**
     * 删除记录
     *
     * @param recordIdList 记录id
     */
    void deleteRecord(List<Integer> recordIdList);

    /**
     * 回收或恢复记录
     *
     * @param delete 逻辑删除
     */
    void updateRecordDelete(DeleteDTO delete);

    /**
     * 修改记录
     *
     * @param record 记录
     */
    void updateRecord(AgreeRecord record);

    /**
     * 根据id获取记录信息
     *
     * @param recordId 记录id
     * @return 记录
     */
    AgreeRecord getRecordInfo(Integer recordId);

    /**
     * 修改记录置顶状态
     *
     * @param top 置顶
     */
    void updateRecordTop(TopDTO top);

    /**
     * 修改记录推荐状态
     *
     * @param recommend 推荐
     */
    void updateRecordRecommend(RecommendDTO recommend);

    /**
     * 搜索记录
     *
     * @param keyword 关键字
     * @return 记录列表
     */
    List<SearchVO> listRecordsBySearch(String keyword);

    /**
     * 查看前台记录列表
     *
     * @return 首页记录列表
     */
    List<AgreeRecord> listHomeAgreeRecord(String keyword);

    /**
     * 查看记录(包括上下篇)
     *
     * @param recordId 记录id
     * @return 记录
     */
    AgreeRecord getRecordHomeById(Integer recordId);

    /**
     * 查看记录总览
     *
     * @return 记录总览
     */
    List<OverviewVO> listRecordOverviewVO();

    /**
     * 查看推荐记录(前10条)
     *
     * @return 推荐记录
     */
    List<AgreeRecord> listAgreeRecord();

    /**
     * 收藏记录
     *
     * @param recordId 记录id
     */
    void collectRecord(Integer recordId);

    /**
     * 导入数据
     *
     * @param list     数据列表
     * @param isUpdate 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    String importData(List<AgreeRecord> list, Boolean isUpdate);

}
