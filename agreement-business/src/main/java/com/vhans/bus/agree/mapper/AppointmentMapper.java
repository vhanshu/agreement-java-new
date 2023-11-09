package com.vhans.bus.agree.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.agree.domain.Appointment;
import com.vhans.bus.agree.domain.dto.AgreeQueryDTO;
import com.vhans.bus.agree.domain.vo.AgreeVO;
import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【约会】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface AppointmentMapper extends BaseMapper<Appointment> {
    /**
     * 查询约会列表
     *
     * @param query 条件
     * @return 约会列表
     */
    List<AgreeVO> selectAppointmentVO(@Param("query") AgreeQueryDTO query);

    /**
     * 根据id查询约会信息
     *
     * @param appointmentId 约会id
     * @return 约会信息
     */
    AgreeVO selectAppointmentInfoById(@Param("appointmentId") Integer appointmentId);

    /**
     * 查看前台约会列表
     * @param keyword 搜索关键字
     *
     * @return 约会列表
     */
    List<AgreeVO> listAppointmentHomeVO(@Param("keyword") String keyword);

    /**
     * 根据id查询约起中心约会
     *
     * @param appointmentId 约会id
     * @param type          类型(1广播 2指定)
     * @return 约起中心约会
     */
    AgreeVO selectAppointmentAgreementById(@Param("appointmentId") Integer appointmentId, @Param("type") Integer type);

    /**
     * 查询上一篇约会
     *
     * @param appointmentId 约会id
     * @return 上一篇约会
     */
    PaginationVO selectLastAppointment(Integer appointmentId);

    /**
     * 查询下一篇约会
     *
     * @param appointmentId 约会id
     * @return 下一篇约会
     */
    PaginationVO selectNextAppointment(Integer appointmentId);

    /**
     * 查询过期的约会
     */
    List<Integer> selectAppointmentExpire();
}
