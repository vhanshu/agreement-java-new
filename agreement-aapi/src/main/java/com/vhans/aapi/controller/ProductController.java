package com.vhans.aapi.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.vhans.bus.data.domain.Product;
import com.vhans.bus.data.service.IProductService;
import com.vhans.bus.subsidiary.model.dto.DeleteDTO;
import com.vhans.bus.subsidiary.model.dto.RecommendDTO;
import com.vhans.bus.subsidiary.model.dto.TopDTO;
import com.vhans.core.annotation.OptLogger;
import com.vhans.core.utils.excel.ExcelUtil;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

import static com.vhans.core.constant.OptTypeConstant.*;

/**
 * 商品Controller控制器
 * 
 * @author vhans
 * @date 2023-12-22
 */
@Api(tags = "商品模块")
@RestController
@RequestMapping("/product")
public class ProductController extends BaseController {

    @Autowired
    private IProductService productService;

    /**
     * 查看商品列表
     *
     * @param query 条件
     * @return {@link List<Product>} 商品列表
     */
    @ApiOperation(value = "查看商品列表")
    @SaCheckPermission("agree:product:list")
    @GetMapping("/list")
    public TableDataInfo<Product> listProduct(Product.Query query) {
        startPage();
        List<Product> list = productService.listProduct(query);
        return getDataTable(list);
    }

    /**
     * 添加商品
     *
     * @param product 商品信息
     * @return 结果
     */
    @OptLogger(value = ADD)
    @ApiOperation(value = "添加商品")
    @SaCheckPermission("agree:product:add")
    @PostMapping("/add")
    public Result<?> addProduct(@Validated @RequestBody Product product) {
        productService.addProduct(product);
        return Result.success();
    }

    /**
     * 删除商品
     *
     * @param productIdList 商品id集合
     * @return 结果
     */
    @OptLogger(value = DELETE)
    @ApiOperation(value = "删除商品")
    @SaCheckPermission("agree:product:delete")
    @DeleteMapping("/delete")
    public Result<?> deleteProduct(@RequestBody List<Integer> productIdList) {
        productService.deleteProduct(productIdList);
        return Result.success();
    }

    /**
     * 回收或恢复商品
     *
     * @param delete 逻辑删除
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "回收或恢复商品")
    @SaCheckPermission("agree:product:recycle")
    @PutMapping("/recycle")
    public Result<?> updateProductDelete(@Validated @RequestBody DeleteDTO delete) {
        productService.updateProductDelete(delete);
        return Result.success();
    }

    /**
     * 修改商品
     *
     * @param product 商品信息
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "修改商品")
    @SaCheckPermission("agree:product:update")
    @PutMapping("/update")
    public Result<?> updateProduct(@Validated @RequestBody Product product) {
        productService.updateProduct(product);
        return Result.success();
    }

    /**
     * 查看商品信息
     *
     * @param productId 商品id
     * @return {@link Result<Product>} 商品信息
     */
    @ApiOperation(value = "查看商品信息")
    @SaCheckPermission("agree:product:info")
    @GetMapping("/info/{productId}")
    public Result<Product> getProductInfo(@PathVariable("productId") Integer productId) {
        return Result.success(productService.getProductInfo(productId));
    }

    /**
     * 置顶商品
     *
     * @param top 置顶信息
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "置顶商品")
    @SaCheckPermission("agree:product:top")
    @PutMapping("/top")
    public Result<?> updateProductTop(@Validated @RequestBody TopDTO top) {
        productService.updateProductTop(top);
        return Result.success();
    }

    /**
     * 推荐商品
     *
     * @param recommend 推荐信息
     * @return 结果
     */
    @OptLogger(value = UPDATE)
    @ApiOperation(value = "推荐商品")
    @SaCheckPermission("agree:product:recommend")
    @PutMapping("/recommend")
    public Result<?> updateProductRecommend(@Validated @RequestBody RecommendDTO recommend) {
        productService.updateProductRecommend(recommend);
        return Result.success();
    }

    /**
     * 导出数据
     *
     * @param response 浏览器响应体
     * @param query    查询条件
     */
    @SaCheckPermission("agree:product:export")
    @PostMapping("/export")
    public void export(HttpServletResponse response, Product.Query query) {
        List<Product> list = productService.listProduct(query);
        ExcelUtil<Product> util = new ExcelUtil<>(Product.class);
        util.exportExcel(response, list, "商品数据");
    }

    /**
     * 导入数据
     *
     * @param file     excel文件
     * @param isUpdate 是否支持更新
     * @return 结果
     */
    @SaCheckPermission("agree:product:import")
    @PostMapping("/importData")
    public Result<?> importData(MultipartFile file, boolean isUpdate) throws Exception {
        ExcelUtil<Product> util = new ExcelUtil<>(Product.class);
        List<Product> list = util.importExcel(file.getInputStream());
        return Result.success(productService.importData(list, isUpdate));
    }
}
