package com.vhans.bus.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.user.domain.vo.UserIntroVO;
import com.vhans.bus.user.domain.UserAgree;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【约起与用户关联】Mapper接口
 *
 * @author vhans
 * @date 2023-04-16
 */
@Repository
public interface UserAgreeMapper extends BaseMapper<UserAgree> {
    /**
     * 保存参与约会的用户
     *
     * @param agreementId 约会id
     * @param userId      用户id
     */
    void saveAppointmentUser(@Param("agreementId") Integer agreementId, @Param("userId") Integer userId);

    /**
     * 保存约会指定的用户
     *
     * @param agreementId 约会id
     * @param userId      用户id
     */
    void saveAppointmentDestinedUser(@Param("agreementId") Integer agreementId, @Param("userId") Integer userId);

    /**
     * 保存参与活动的用户
     *
     * @param agreementId 活动id
     * @param userId      用户id
     */
    void saveActivityUser(@Param("agreementId") Integer agreementId, @Param("userId") Integer userId);

    /**
     * 保存接下赛事的用户
     *
     * @param agreementId 赛事id
     * @param userId      用户id
     */
    void saveCompetitionUser(@Param("agreementId") Integer agreementId, @Param("userId") Integer userId);

    /**
     * 保存报名赛事的观众
     *
     * @param agreementId 赛事id
     * @param userId      用户id
     */
    void saveCompetitionAudience(@Param("agreementId") Integer agreementId, @Param("userId") Integer userId);

    /**
     * 保存帮助别人的用户
     *
     * @param agreementId 帮助id
     * @param userId      用户id
     */
    void saveHelpUser(@Param("agreementId") Integer agreementId, @Param("userId") Integer userId);

    /**
     * 查询约会中应约的人员
     *
     * @param appointmentId 约会id
     * @return 应约人员
     */
    UserAgree selectAppointmentUser(@Param("appointmentId") Integer appointmentId);

    /**
     * 获取指定约起参与者
     *
     * @param agreeId   约起id
     * @param type      约起类型
     * @param limitType 限定类型
     * @return 参与者列表
     */
    List<UserIntroVO> selectUserListByAgreeId(@Param("agreeId") Integer agreeId, @Param("type") Integer type, @Param("limitType") Integer limitType);
}
