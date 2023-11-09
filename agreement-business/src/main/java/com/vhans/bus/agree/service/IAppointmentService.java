package com.vhans.bus.agree.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.agree.domain.Appointment;
import com.vhans.bus.agree.domain.dto.AgreeDTO;
import com.vhans.bus.agree.domain.dto.AgreeQueryDTO;
import com.vhans.bus.agree.domain.vo.AgreeVO;

import java.util.List;

/**
 * 约会业务接口
 *
 * @author vhans
 **/
public interface IAppointmentService extends IService<Appointment> {

    /**
     * 查看约会列表
     *
     * @param query 条件
     * @return 约会列表
     */
    List<AgreeVO> listAppointmentVO(AgreeQueryDTO query);

    /**
     * 添加约会
     *
     * @param appointment 约会
     */
    void addAppointment(AgreeDTO appointment);

    /**
     * 删除约会
     *
     * @param appointmentId 约会id
     */
    void deleteAppointment(Integer appointmentId);

    /**
     * 修改约会
     *
     * @param appointment 约会
     */
    String updateAppointment(AgreeDTO appointment);

    /**
     * 编辑约会
     *
     * @param appointmentId 约会id
     * @return 约会
     */
    AgreeVO editAppointment(Integer appointmentId);

    /**
     * 查看前台约会列表
     *
     * @return 约会列表
     */
    List<AgreeVO> listAppointmentHomeVO(String keyword);

    /**
     * 查看约会
     *
     * @param appointmentId 约会id
     * @return 约会
     */
    AgreeVO getAppointmentAgreementById(Integer appointmentId);

    /**
     * 查询指定约会
     *
     * @param appointmentId 约会id
     * @return 指定约会
     */
    AgreeVO getSpecifyAppointmentAgreementById(Integer appointmentId);

    /**
     * 大众应约
     *
     * @param appointmentId 约会id
     */
    String answerAppointment(Integer appointmentId);

    /**
     * 指定人员应约
     *
     * @param appointmentId 约会id
     */
    String uniqueAppointment(Integer appointmentId);
}
