package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.vhans.bus.agree.domain.dto.AgreeQueryDTO;
import com.vhans.bus.agree.domain.vo.AgreeVO;
import com.vhans.core.annotation.AccessLimit;
import com.vhans.core.annotation.VisitLogger;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.bus.agree.domain.dto.AgreeDTO;
import com.vhans.core.web.model.page.TableDataInfo;
import com.vhans.bus.agree.service.IAgreeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 约起控制起器
 *
 * @author vhans
 */
@Api(tags = "约起模块")
@RestController
@RequestMapping("/agree")
public class AgreeController extends BaseController {

    @Autowired
    private IAgreeService agreeService;

    /**
     * 查看约起列表
     *
     * @return {@link AgreeVO}
     */
    @VisitLogger(value = "约起中心")
    @ApiOperation(value = "查看约起列表")
    @GetMapping("/list")
    public TableDataInfo<AgreeVO> listAgreementVO(AgreeQueryDTO agreeQuery) {
        startPage();
        List<AgreeVO> list = agreeService.listAgreementHomeVO(agreeQuery);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 发表约起
     *
     * @param agreement 约起信息
     * @return {@link Result <>}
     */
    @SaCheckLogin
    @ApiOperation(value = "发表约起")
    @PostMapping("/add")
    public Result<?> addAgreement(@Validated @RequestBody AgreeDTO agreement) {
        agreeService.addAgreement(agreement);
        return Result.success();
    }

    /**
     * 删除约起
     *
     * @param agreeId 约起id
     * @param type    类型
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "删除约起")
    @DeleteMapping("/delete/{type}/{agreeId}")
    public Result<?> deleteAgreement(@PathVariable Integer type, @PathVariable Integer agreeId) {
        agreeService.deleteAgreement(agreeId, type);
        return Result.success();
    }

    /**
     * 修改约起
     *
     * @param agreement 约起信息
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "修改约起")
    @PutMapping("/update")
    public Result<?> updateAgreement(@Validated @RequestBody AgreeDTO agreement) {
        agreeService.updateAgreement(agreement);
        return Result.success();
    }

    /**
     * 获取约起信息
     *
     * @param agreeId 约起id
     * @param type    类型
     * @return {@link Result<AgreeVO>} 约起信息
     */
    @SaCheckLogin
    @ApiOperation(value = "获取约起信息")
    @GetMapping("/info/{type}/{agreeId}")
    public Result<AgreeVO> editAgreement(@PathVariable Integer type, @PathVariable Integer agreeId) {
        return Result.success(agreeService.editAgreement(agreeId, type));
    }

    /**
     * 加入约起
     *
     * @param agreeId 约起id
     * @param type    类型
     * @return {@link Result<String>} 约起info
     */
    @SaCheckLogin
    @ApiOperation(value = "加入约起")
    @AccessLimit(seconds = 10, maxCount = 1)
    @PostMapping("/join/{type}/{agreeId}")
    public Result<String> joinAgreement(@PathVariable Integer type, @PathVariable Integer agreeId) {
        return Result.success(agreeService.joinAgreement(agreeId, type));
    }

    /**
     * 查看约起内容
     *
     * @param agreeId 约起id
     * @param type    类型
     * @return {@link Result<AgreeVO>} 约起
     */
    @VisitLogger(value = "约起中心")
    @ApiOperation(value = "查看约起内容")
    @GetMapping("/look/{type}/{agreeId}")
    public Result<AgreeVO> getAgreementAgreementById(@PathVariable Integer type, @PathVariable Integer agreeId) {
        return Result.success(agreeService.getAgreeAgreementById(agreeId, type));
    }
}
