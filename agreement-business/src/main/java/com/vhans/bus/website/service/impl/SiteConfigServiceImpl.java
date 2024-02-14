package com.vhans.bus.website.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.website.domain.SiteConfig;
import com.vhans.bus.website.mapper.SiteConfigMapper;
import com.vhans.bus.website.service.ISiteConfigService;
import com.vhans.core.redis.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

import static com.vhans.core.constant.RedisConstant.SITE_SETTING;

/**
 * 网站配置业务接口实现类
 *
 * @author vhans
 */
@Service
public class SiteConfigServiceImpl extends ServiceImpl<SiteConfigMapper, SiteConfig> implements ISiteConfigService {

    @Autowired
    private SiteConfigMapper siteConfigMapper;

    @Autowired
    private RedisService redisService;

    @Override
    public SiteConfig getSiteConfig() {
        SiteConfig siteConfig = redisService.getObject(SITE_SETTING);
        if (Objects.isNull(siteConfig)) {
            // 从数据库中加载
            siteConfig = siteConfigMapper.selectById(1);
            redisService.setObject(SITE_SETTING, siteConfig);
        }
        return siteConfig;
    }

    @Override
    public void updateSiteConfig(SiteConfig siteConfig) {
        siteConfig.setId(1);
        baseMapper.updateById(siteConfig);
        redisService.deleteObject(SITE_SETTING);
    }
}




