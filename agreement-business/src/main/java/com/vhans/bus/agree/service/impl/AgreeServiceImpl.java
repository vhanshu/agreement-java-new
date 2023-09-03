package com.vhans.bus.agree.service.impl;

import com.vhans.bus.agree.service.*;
import com.vhans.bus.agree.domain.dto.AgreeDTO;
import com.vhans.bus.agree.domain.dto.AgreeQueryDTO;
import com.vhans.bus.agree.domain.vo.AgreeVO;
import nl.basjes.shaded.org.springframework.util.Assert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static com.vhans.core.constant.NumberConstant.*;

/**
 * 聚合约起业务处理
 *
 * @author vhans
 */
@Service
public class AgreeServiceImpl implements IAgreeService {

    @Autowired
    private IAppointmentService appointmentService;

    @Autowired
    private IActivityService activityService;

    @Autowired
    private ICompetitionService competitionService;

    @Autowired
    private IHelpService helpService;

    private final List<Integer> typeList = Arrays.asList(ONE, TWO, THREE, FOUR);

    /**
     * 查看约起列表
     *
     * @param query 条件
     * @return 约起列表
     */
    public List<AgreeVO> listAgreementVO(AgreeQueryDTO query) {
        Assert.isTrue(typeList.contains(query.getType()),
                "未传入类型或者类型不正确");
        return switch (query.getType()) {
            case ONE -> appointmentService.listAppointmentVO(query);
            case TWO -> activityService.listActivityVO(query);
            case THREE -> competitionService.listCompetitionVO(query);
            case FOUR -> helpService.listHelpVO(query);
            default -> Collections.emptyList();
        };
    }

    @Override
    public void addAgreement(AgreeDTO agreement) {
        Assert.isTrue(typeList.contains(agreement.getAgreeType()),
                "未传入类型或者类型不正确");
        switch (agreement.getAgreeType()) {
            case ONE -> appointmentService.addAppointment(agreement);
            case TWO -> activityService.addActivity(agreement);
            case THREE -> competitionService.addCompetition(agreement);
            case FOUR -> helpService.addHelp(agreement);
        }
    }

    @Override
    public void deleteAgreement(Integer agreeId, Integer type) {
        Assert.isTrue(typeList.contains(type),
                "未传入类型或者类型不正确");
        switch (type) {
            case ONE -> appointmentService.deleteAppointment(agreeId);
            case TWO -> activityService.deleteActivity(agreeId);
            case THREE -> competitionService.deleteCompetition(agreeId);
            case FOUR -> helpService.deleteHelp(agreeId);
        }
    }

    @Override
    public String updateAgreement(AgreeDTO agreement) {
        Assert.isTrue(typeList.contains(agreement.getAgreeType()),
                "未传入类型或者类型不正确");
        return switch (agreement.getAgreeType()) {
            case ONE -> appointmentService.updateAppointment(agreement);
            case TWO -> activityService.updateActivity(agreement);
            case THREE -> competitionService.updateCompetition(agreement);
            case FOUR -> helpService.updateHelp(agreement);
            default -> "更改失败";
        };

    }

    @Override
    public AgreeVO editAgreement(Integer agreeId, Integer type) {
        Assert.isTrue(typeList.contains(type), "未传入类型或者类型不正确");
        return switch (type) {
            case ONE -> appointmentService.editAppointment(agreeId);
            case TWO -> activityService.editActivity(agreeId);
            case THREE -> competitionService.editCompetition(agreeId);
            case FOUR -> helpService.editHelp(agreeId);
            default -> null;
        };
    }

    @Override
    public List<AgreeVO> listAgreementHomeVO(Integer type) {
        Assert.isTrue(typeList.contains(type),
                "未传入类型或者类型不正确");
        return switch (type) {
            case ONE -> appointmentService.listAppointmentHomeVO();
            case TWO -> activityService.listActivityHomeVO();
            case THREE -> competitionService.listCompetitionHomeVO();
            case FOUR -> helpService.listHelpHomeVO();
            default -> Collections.emptyList();
        };
    }

    @Override
    public AgreeVO getAgreeAgreementById(Integer agreeId, Integer type) {
        Assert.isTrue(typeList.contains(type) ||
                        type == SIX,
                "未传入类型或者类型不正确");
        return switch (type) {
            case ONE -> appointmentService.getAppointmentAgreementById(agreeId);
            case TWO -> activityService.getActivityAgreementById(agreeId);
            case THREE -> competitionService.getCompetitionHomeById(agreeId);
            case FOUR -> helpService.getHelpAgreementById(agreeId);
            case SIX -> appointmentService.getSpecifyAppointmentAgreementById(agreeId);
            default -> null;
        };
    }

    @Override
    public String joinAgreement(Integer agreeId, Integer type) {
        Assert.isTrue(typeList.contains(type) || type == FIVE || type == SIX,
                "未传入类型或者类型不正确");
        return switch (type) {
            case ONE -> appointmentService.answerAppointment(agreeId);
            case TWO -> activityService.participationActivity(agreeId);
            case THREE -> competitionService.takeCompetition(agreeId);
            case FOUR -> helpService.participationHelp(agreeId);
            case FIVE -> competitionService.applyCompetition(agreeId);
            case SIX -> appointmentService.uniqueAppointment(agreeId);
            default -> "加入失败";
        };
    }
}
