package com.vhans.bus.agree.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.agree.domain.Activity;
import com.vhans.bus.agree.domain.dto.AgreeQueryDTO;
import com.vhans.bus.agree.domain.vo.AgreeVO;
import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【活动】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface ActivityMapper extends BaseMapper<Activity> {
    /**
     * 查询活动列表
     *
     * @param query 条件
     * @return 活动列表
     */
    List<AgreeVO> selectActivityVO(@Param("query") AgreeQueryDTO query);

    /**
     * 根据id查询活动信息
     *
     * @param activityId 活动id
     * @return 活动信息
     */
    AgreeVO selectActivityInfoById(@Param("activityId") Integer activityId);

    /**
     * 查看前台活动列表
     *
     * @return 活动列表
     */
    List<AgreeVO> listActivityHomeVO(@Param("keyword") String keyword);

    /**
     * 根据id查询约起中心活动
     *
     * @param activityId 活动id
     * @return 首页活动
     */
    AgreeVO selectActivityAgreementById(Integer activityId);

    /**
     * 查询上一篇活动
     *
     * @param activityId 活动id
     * @return 上一篇活动
     */
    PaginationVO selectLastActivity(@Param("activityId") Integer activityId);

    /**
     * 查询下一篇活动
     *
     * @param activityId 活动id
     * @return 下一篇活动
     */
    PaginationVO selectNextActivity(@Param("activityId") Integer activityId);

    /**
     * 查询过期的活动
     */
    List<Integer> selectActivityExpire();
}
