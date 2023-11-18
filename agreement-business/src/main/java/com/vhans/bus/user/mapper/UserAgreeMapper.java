package com.vhans.bus.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.user.domain.UserAgree;
import com.vhans.bus.user.domain.vo.UserIntroVO;
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
     * 保存参与约起的用户
     *
     * @param agreementId 约起id
     * @param userId      用户id
     * @param type        约起类型
     */
    void saveAgreeUser(@Param("agreementId") Integer agreementId, @Param("userId") Integer userId, @Param("type") Integer type);

    /**
     * 查询约会中应约的人员
     *
     * @param appointmentId 约会id
     * @return 应约人员
     */
    UserAgree selectAppointmentUser(@Param("appointmentId") Integer appointmentId);

    /**
     * 获取指定约起相关人员
     *
     * @param agreeId 约起id
     * @param type    约起类型
     * @return 相关人员列表
     */
    List<UserIntroVO> selectUserListByAgreeId(@Param("agreeId") Integer agreeId, @Param("type") Integer type);
}
