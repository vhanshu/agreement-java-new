package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.vhans.bus.website.domain.SiteConfig;
import com.vhans.bus.website.service.ISiteConfigService;
import com.vhans.core.annotation.OptLogger;
import com.vhans.core.web.model.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import static com.vhans.core.constant.OptTypeConstant.UPDATE;

/**
 * 网站配置控制器
 *
 * @author vhans
 **/
@Api(tags = "网站配置模块")
@RestController
@RequestMapping("/site")
public class SiteConfigController {

    @Autowired
    private ISiteConfigService siteConfigService;

    /**
     * 获取网站配置
     *
     * @return {@link Result<SiteConfig>} 网站配置
     */
    @ApiOperation(value = "获取网站配置")
    @SaCheckPermission("web:site:list")
    @GetMapping("/list")
    public Result<SiteConfig> getSiteConfig() {
        return Result.success(siteConfigService.getSiteConfig());
    }

    /**
     * 更新网站配置
     *
     * @param siteConfig 网站配置
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "更新网站配置")
    @SaCheckPermission("web:site:update")
    @PutMapping("/update")
    public Result<?> updateSiteConfig(@RequestBody SiteConfig siteConfig) {
        siteConfigService.updateSiteConfig(siteConfig);
        return Result.success();
    }
}