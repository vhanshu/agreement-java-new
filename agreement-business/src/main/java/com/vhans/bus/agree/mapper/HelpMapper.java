package com.vhans.bus.agree.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.agree.domain.Help;
import com.vhans.bus.agree.domain.dto.AgreeQueryDTO;
import com.vhans.bus.agree.domain.vo.AgreeVO;
import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【帮助】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface HelpMapper extends BaseMapper<Help> {
    /**
     * 查询帮助列表
     *
     * @param query 条件
     * @return 帮助列表
     */
    List<AgreeVO> selectHelpVO(@Param("query") AgreeQueryDTO query);

    /**
     * 根据id查询帮助信息
     *
     * @param helpId 帮助id
     * @return 帮助信息
     */
    AgreeVO selectHelpInfoById(@Param("helpId") Integer helpId);

    /**
     * 查看前台帮助列表
     *
     * @return 帮助列表
     */
    List<AgreeVO> listHelpHomeVO();

    /**
     * 根据id查询约起中心帮助
     *
     * @param helpId 帮助id
     * @return 首页帮助
     */
    AgreeVO selectHelpAgreementById(@Param("helpId") Integer helpId);

    /**
     * 查询上一篇帮助
     *
     * @param helpId 帮助id
     * @return 上一篇帮助
     */
    PaginationVO selectLastHelp(@Param("helpId") Integer helpId);

    /**
     * 查询下一篇帮助
     *
     * @param helpId 帮助id
     * @return 下一篇帮助
     */
    PaginationVO selectNextHelp(@Param("helpId") Integer helpId);

    /**
     * 查询过期的帮助
     */
    List<Integer> selectHelpExpire();
}
