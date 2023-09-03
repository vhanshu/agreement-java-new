package com.vhans.bus.agree.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.agree.domain.Activity;
import com.vhans.bus.agree.domain.dto.AgreeDTO;
import com.vhans.bus.agree.domain.dto.AgreeQueryDTO;
import com.vhans.bus.agree.domain.vo.AgreeVO;

import java.util.List;

/**
 * 活动业务接口
 *
 * @author vhans
 **/
public interface IActivityService extends IService<Activity> {

    /**
     * 查看活动列表
     *
     * @param query 条件
     * @return 活动列表
     */
    List<AgreeVO> listActivityVO(AgreeQueryDTO query);

    /**
     * 添加活动
     *
     * @param activity 活动
     */
    void addActivity(AgreeDTO activity);

    /**
     * 删除活动
     *
     * @param activityId 活动id
     */
    void deleteActivity(Integer activityId);

    /**
     * 修改活动
     *
     * @param activity 活动
     */
    String updateActivity(AgreeDTO activity);

    /**
     * 编辑活动
     *
     * @param activityId 活动id
     * @return 活动
     */
    AgreeVO editActivity(Integer activityId);

    /**
     * 查看首页活动列表
     *
     * @return 首页活动列表
     */
    List<AgreeVO> listActivityHomeVO();

    /**
     * 查看活动
     *
     * @param activityId 活动id
     * @return 活动
     */
    AgreeVO getActivityAgreementById(Integer activityId);

    /**
     * 参与活动
     *
     * @param activityId 活动id
     */
    String participationActivity(Integer activityId);
}
