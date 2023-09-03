package com.vhans.bus.subsidiary.validator.agreement;

import com.vhans.bus.subsidiary.validator.agreement.groups.Activity;
import com.vhans.bus.subsidiary.validator.agreement.groups.Appointment;
import com.vhans.bus.subsidiary.validator.agreement.groups.Competition;
import com.vhans.bus.subsidiary.validator.agreement.groups.Help;
import com.vhans.bus.agree.domain.dto.AgreeDTO;
import org.hibernate.validator.spi.group.DefaultGroupSequenceProvider;

import java.util.ArrayList;
import java.util.List;

import static com.vhans.core.enums.AgreementTypeEnum.*;

/**
 * 约起分组校验器
 *
 * @author vhans
 **/
public class AgreementProvider implements DefaultGroupSequenceProvider<AgreeDTO> {

    /**
     * 根据实体类 AgreementDTO 的状态动态地确定验证分组顺序
     *
     * @param agreeDTO 约起DTO
     * @return 包含验证分组类的 Class 对象数组
     */
    @Override
    public List<Class<?>> getValidationGroups(AgreeDTO agreeDTO) {
        List<Class<?>> defaultGroupSequence = new ArrayList<>();
        defaultGroupSequence.add(AgreeDTO.class);
        if (agreeDTO != null) {
            if (agreeDTO.getAgreeType().equals(APPOINTMENT.getType())) {
                defaultGroupSequence.add(Appointment.class);
            }
            if (agreeDTO.getAgreeType().equals(ACTIVITY.getType())) {
                defaultGroupSequence.add(Activity.class);
            }
            if (agreeDTO.getAgreeType().equals(COMPETITION.getType())) {
                defaultGroupSequence.add(Competition.class);
            }
            if (agreeDTO.getAgreeType().equals(HELP.getType())) {
                defaultGroupSequence.add(Help.class);
            }
        }
        return defaultGroupSequence;
    }
}