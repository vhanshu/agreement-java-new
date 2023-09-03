package com.vhans.bus.agree.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.agree.domain.Competition;
import com.vhans.bus.agree.domain.dto.AgreeQueryDTO;
import com.vhans.bus.agree.domain.vo.AgreeVO;
import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【赛事】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface CompetitionMapper extends BaseMapper<Competition> {
    /**
     * 查询赛事列表
     *
     * @param query 条件
     * @return 赛事列表
     */
    List<AgreeVO> selectCompetitionVO(@Param("query") AgreeQueryDTO query);

    /**
     * 根据id查询赛事信息
     *
     * @param competitionId 赛事id
     * @return 赛事信息
     */
    AgreeVO selectCompetitionInfoById(@Param("competitionId") Integer competitionId);

    /**
     * 查看前台赛事列表
     *
     * @return 赛事列表
     */
    List<AgreeVO> listCompetitionHomeVO();

    /**
     * 根据id查询约起中心赛事
     *
     * @param competitionId 赛事id
     * @return 首页赛事
     */
    AgreeVO selectCompetitionAgreementById(Integer competitionId);

    /**
     * 查询上一篇赛事
     *
     * @param competitionId 赛事id
     * @return 上一篇赛事
     */
    PaginationVO selectLastCompetition(Integer competitionId);

    /**
     * 查询下一篇赛事
     *
     * @param competitionId 赛事id
     * @return 下一篇赛事
     */
    PaginationVO selectNextCompetition(Integer competitionId);

    /**
     * 查询过期的赛事
     */
    List<Integer> selectCompetitionExpire();
}
