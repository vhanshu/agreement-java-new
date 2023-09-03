package com.vhans.bus.agree.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.agree.domain.Help;
import com.vhans.bus.agree.domain.dto.AgreeDTO;
import com.vhans.bus.agree.domain.dto.AgreeQueryDTO;
import com.vhans.bus.agree.domain.vo.AgreeVO;

import java.util.List;

/**
 * 帮助业务接口
 *
 * @author vhans
 **/
public interface IHelpService extends IService<Help> {

    /**
     * 查看帮助列表
     *
     * @param query 条件
     * @return 帮助列表
     */
    List<AgreeVO> listHelpVO(AgreeQueryDTO query);

    /**
     * 添加帮助
     *
     * @param help 帮助
     */
    void addHelp(AgreeDTO help);

    /**
     * 删除帮助
     *
     * @param helpId 帮助id
     */
    void deleteHelp(Integer helpId);

    /**
     * 修改帮助
     *
     * @param help 帮助
     */
    String updateHelp(AgreeDTO help);

    /**
     * 编辑帮助
     *
     * @param helpId 帮助id
     * @return 帮助
     */
    AgreeVO editHelp(Integer helpId);

    /**
     * 查看首页帮助列表
     *
     * @return 首页帮助列表
     */
    List<AgreeVO> listHelpHomeVO();

    /**
     * 查看帮助
     *
     * @param helpId 帮助id
     * @return 帮助
     */
    AgreeVO getHelpAgreementById(Integer helpId);

    /**
     * 参与帮助
     *
     * @param helpId 帮助id
     */
    String participationHelp(Integer helpId);
}
