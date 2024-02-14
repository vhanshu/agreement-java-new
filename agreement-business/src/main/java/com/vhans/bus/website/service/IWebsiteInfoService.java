package com.vhans.bus.website.service;

import com.vhans.bus.website.domain.SiteConfig;
import com.vhans.bus.website.domain.vo.WebsiteInfoVO;

/**
 * 网站信息业务接口
 *
 * @author vhans
 **/
public interface IWebsiteInfoService {
    /**
     * 上传访客信息
     */
    void report();

    /**
     * 查看网站信息
     *
     * @return 网站后台信息
     */
    WebsiteInfoVO getWebsiteInfo();

    /**
     * 查看系统配置信息
     *
     * @return 系统配置信息
     */
    SiteConfig getSiteConfig();
}
