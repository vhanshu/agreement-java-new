package com.vhans.aapi.controller;

import com.vhans.core.web.model.Result;
import com.vhans.bus.website.domain.vo.WebsiteInfoVO;
import com.vhans.bus.website.service.IWebsiteInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 网站信息控制器
 *
 * @author vhans
 **/
@Api(tags = "网站信息模块")
@RestController
@RequestMapping("/web")
public class WebsiteInfoController {

    @Autowired
    private IWebsiteInfoService websiteInfoService;

    /**
     * 查看网站图表信息
     *
     * @return {@link Result<WebsiteInfoVO>} 查看网站信息
     */
    @ApiOperation(value = "查看网站图表信息")
    @GetMapping("/info")
    public Result<WebsiteInfoVO> getWebsiteInfo() {
        return Result.success(websiteInfoService.getWebsiteInfo());
    }
}