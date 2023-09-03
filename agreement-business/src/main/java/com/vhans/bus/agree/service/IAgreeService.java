package com.vhans.bus.agree.service;

import com.vhans.bus.agree.domain.dto.AgreeDTO;
import com.vhans.bus.agree.domain.dto.AgreeQueryDTO;
import com.vhans.bus.agree.domain.vo.AgreeVO;

import java.util.List;

/**
 * 聚合约起业务处理
 *
 * @author vhans
 */
public interface IAgreeService {
    /**
     * 查看约起列表
     *
     * @param query 条件
     * @return 约起列表
     */
    List<AgreeVO> listAgreementVO(AgreeQueryDTO query);

    /**
     * 添加约起
     *
     * @param agreement 约起
     */
    void addAgreement(AgreeDTO agreement);

    /**
     * 删除约起
     *
     * @param agreeId 约起id
     * @param type    类型
     */
    void deleteAgreement(Integer agreeId, Integer type);

    /**
     * 修改约起
     *
     * @param agreement 约起
     * @return 处理结果
     */
    String updateAgreement(AgreeDTO agreement);

    /**
     * 获取约起信息
     *
     * @param agreeId 约起id
     * @param type    类型
     * @return 约起
     */
    AgreeVO editAgreement(Integer agreeId, Integer type);

    /**
     * 查看首页约起列表
     *
     * @param type 类型
     * @return 首页约起列表
     */
    List<AgreeVO> listAgreementHomeVO(Integer type);

    /**
     * 查看约起
     *
     * @param agreeId 约起id
     * @param type    类型
     * @return 约起
     */
    AgreeVO getAgreeAgreementById(Integer agreeId, Integer type);

    /**
     * 加入约起
     *
     * @param agreeId 约起id
     * @param type    类型
     * @return 处理结果
     */
    String joinAgreement(Integer agreeId, Integer type);
}
