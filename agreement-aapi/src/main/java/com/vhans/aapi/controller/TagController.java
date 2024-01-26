package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.vhans.core.annotation.OptLogger;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import com.vhans.bus.data.domain.vo.TagStatisticsVO;
import com.vhans.bus.data.domain.Tag;
import com.vhans.bus.data.service.ITagService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.vhans.core.constant.OptTypeConstant.*;

/**
 * 标签控制器
 *
 * @author vhans
 **/
@Api(tags = "标签模块")
@RestController
@RequestMapping("/tag")
public class TagController extends BaseController {

    @Autowired
    private ITagService tagService;

    /**
     * 查看标签列表
     *
     * @param query 查询条件
     * @return {@link Tag} 后台标签
     */
    @ApiOperation(value = "查看标签列表(加上类型)")
    @SaCheckPermission("agree:tag:list")
    @GetMapping("/list")
    public TableDataInfo<Tag> listTagBackVO(Tag.Query query) {
        startPage();
        List<Tag> list = tagService.listTagVO(query);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 添加标签
     *
     * @param tag 标签信息
     * @return 结果
     */
    @OptLogger(value = ADD)
    @ApiOperation(value = "添加标签")
    @SaCheckPermission("agree:tag:add")
    @PostMapping("/add")
    public Result<?> addTag(@Validated @RequestBody Tag tag) {
        tagService.addTag(tag);
        return Result.success();
    }

    /**
     * 删除标签
     *
     * @param tagIdList 标签id集合
     * @return 结果
     */
    @OptLogger(value = DELETE)
    @ApiOperation(value = "删除分类")
    @SaCheckPermission("agree:tag:delete")
    @DeleteMapping("/delete")
    public Result<?> deleteTag(@RequestBody List<Integer> tagIdList) {
        tagService.deleteTag(tagIdList);
        return Result.success();
    }

    /**
     * 修改标签
     *
     * @param tag 标签信息
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "修改标签")
    @SaCheckPermission("agree:tag:update")
    @PutMapping("/update")
    public Result<?> updateTag(@Validated @RequestBody Tag tag) {
        tagService.updateTag(tag);
        return Result.success();
    }

    /**
     * 查看所有标签选项
     *
     * @return {@link Result<TagStatisticsVO>} 标签列表
     */
    @ApiOperation(value = "查看标签选项")
    @GetMapping("/option")
    public Result<List<TagStatisticsVO>> listTagAllOption() {
        return Result.success(tagService.listTagAllOption());
    }

    /**
     * 查看相应类型的标签选项
     *
     * @param type 类型(1:记录标签,2:题目标签)
     * @return {@link Result<TagStatisticsVO>} 记录标签列表
     */
    @ApiOperation(value = "查看相应类型的标签选项")
    @GetMapping("/option/{type}")
    public Result<List<TagStatisticsVO>> listTagOption(@PathVariable Integer type) {
        return Result.success(tagService.listTagOption(type));
    }

}