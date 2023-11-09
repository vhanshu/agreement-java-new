package com.vhans.bus.agree.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.agree.domain.Competition;
import com.vhans.bus.agree.domain.dto.AgreeDTO;
import com.vhans.bus.agree.domain.dto.AgreeQueryDTO;
import com.vhans.bus.agree.domain.vo.AgreeVO;

import java.util.List;

/**
 * 赛事业务接口
 *
 * @author vhans
 **/
public interface ICompetitionService extends IService<Competition> {

    /**
     * 查看赛事列表
     *
     * @param query 条件
     * @return 赛事列表
     */
    List<AgreeVO> listCompetitionVO(AgreeQueryDTO query);

    /**
     * 添加赛事
     *
     * @param competition 赛事
     */
    void addCompetition(AgreeDTO competition);

    /**
     * 删除赛事
     *
     * @param competitionId 赛事id
     */
    void deleteCompetition(Integer competitionId);

    /**
     * 修改赛事
     *
     * @param competition 赛事
     */
    String updateCompetition(AgreeDTO competition);

    /**
     * 编辑赛事
     *
     * @param competitionId 赛事id
     * @return 赛事
     */
    AgreeVO editCompetition(Integer competitionId);

    /**
     * 查看首页赛事列表
     *
     * @return 首页赛事列表
     */
    List<AgreeVO> listCompetitionHomeVO(String keyword);

    /**
     * 查看赛事
     *
     * @param competitionId 赛事id
     * @return 赛事
     */
    AgreeVO getCompetitionHomeById(Integer competitionId);

    /**
     * 接下赛事
     * @param competitionId 赛事id
     */
    String takeCompetition(Integer competitionId);


    /**
     * 报名赛事参与者
     * @param competitionId 赛事id
     */
    String applyCompetition(Integer competitionId);
}
