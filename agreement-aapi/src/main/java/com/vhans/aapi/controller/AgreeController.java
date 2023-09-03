package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.vhans.bus.agree.service.IAgreeService;
import com.vhans.bus.agree.domain.dto.AgreeDTO;
import com.vhans.bus.agree.domain.dto.AgreeQueryDTO;
import com.vhans.bus.agree.domain.vo.AgreeVO;
import com.vhans.core.annotation.OptLogger;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.vhans.core.constant.OptTypeConstant.*;

/**
 * 约起控制器
 *
 * @author vhans
 */
@Api(tags = "约起模块")
@RestController
@RequestMapping("/agree")
public class AgreeController extends BaseController {

    @Autowired
    private IAgreeService agreeService;

    @ApiOperation(value = "查看约起列表")
    @SaCheckPermission("agree:agreement:list")
    @GetMapping("/list")
    public TableDataInfo listAdminVO(AgreeQueryDTO query) {
        startPage();
        List<AgreeVO> list = agreeService.listAgreementVO(query);
        return getDataTable(list);
    }

    /**
     * 添加约起
     *
     * @param agreement 约起信息
     * @return 结果
     */
    @OptLogger(value = ADD)
    @ApiOperation(value = "添加约起")
    @SaCheckPermission("agree:agreement:add")
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
    @OptLogger(value = DELETE)
    @ApiOperation(value = "删除约起")
    @SaCheckPermission("agree:agreement:delete")
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
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "修改约起")
    @SaCheckPermission("agree:agreement:update")
    @PutMapping("/update")
    public Result<?> updateAgreement(@RequestBody AgreeDTO agreement) {
        return Result.success(agreeService.updateAgreement(agreement));
    }

    /**
     * 获取约起信息
     *
     * @param agreeId 约起id
     * @param type    类型
     * @return {@link Result<AgreeVO>} 约起信息
     */
    @ApiOperation(value = "获取约起信息")
    @SaCheckPermission("agree:agreement:info")
    @PostMapping("/info/{type}/{agreeId}")
    public Result<AgreeVO> editAgreement(@PathVariable Integer type, @PathVariable Integer agreeId) {
        return Result.success(agreeService.editAgreement(agreeId, type));
    }
}
