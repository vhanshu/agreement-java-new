package com.vhans.bapi.controller;

import com.vhans.bus.website.domain.SiteConfig;
import com.vhans.bus.website.service.ISiteConfigService;
import com.vhans.core.annotation.VisitLogger;
import com.vhans.core.web.model.Result;
import com.vhans.bus.website.domain.vo.WebsiteInfoVO;
import com.vhans.bus.website.service.IWebsiteInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 网站信息控制器
 *
 * @author vhans
 **/
@Api(tags = "网站信息模块")
@RestController
public class WebsiteInfoController {

    @Autowired
    private IWebsiteInfoService websiteInfoService;

    @Autowired
    public ISiteConfigService siteConfigService;

    /**
     * 上传访客信息
     *
     * @return 结果
     */
    @ApiOperation(value = "上传访客信息")
    @PostMapping("/report")
    public Result<?> report() {
        websiteInfoService.report();
        return Result.success();
    }

    /**
     * 查看网站信息
     *
     * @return {@link Result<WebsiteInfoVO>}  网站信息
     */
    @ApiOperation(value = "查看网站信息")
    @GetMapping("/info")
    public Result<WebsiteInfoVO> getWebInfo() {
        return Result.success(websiteInfoService.getWebsiteInfo());
    }

    /**
     * 查看系统配置信息
     *
     * @return {@link Result<SiteConfig>}  配置信息
     */
    @ApiOperation(value = "查看系统配置信息")
    @GetMapping("/config")
    public Result<SiteConfig> getSiteInfo() {
        return Result.success(siteConfigService.getSiteConfig());
    }


    /**
     * 查看关于我信息
     *
     * @return {@link Result<String>} 关于我信息
     */
    @VisitLogger(value = "关于")
    @ApiOperation(value = "查看关于我信息")
    @GetMapping("/about")
    public Result<String> getAbout() {
        return Result.success(websiteInfoService.getAbout());
    }
}