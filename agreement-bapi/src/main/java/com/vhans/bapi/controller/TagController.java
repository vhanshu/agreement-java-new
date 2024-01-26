package com.vhans.bapi.controller;

import com.vhans.bus.data.domain.vo.TagStatisticsVO;
import com.vhans.bus.data.service.ITagService;
import com.vhans.core.annotation.VisitLogger;
import com.vhans.core.web.model.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 标签控制器
 *
 * @author vhans
 **/
@Api(tags = "标签模块")
@RestController
@RequestMapping("/tag")
public class TagController {

    @Autowired
    private ITagService tagService;

    /**
     * 查看相应标签统计列表
     *
     * @param type 类型(1:记录标签,2:题目标签,3:商品标签)
     * @return {@link Result<TagStatisticsVO>} 标签统计列表
     */
    @VisitLogger(value = "标签")
    @ApiOperation(value = "查看相应标签统计列表")
    @GetMapping("/list/{type}")
    public Result<List<TagStatisticsVO>> listTagAgreeRecord(@PathVariable Integer type) {
        return Result.success(tagService.listTagVO(type));
    }
}