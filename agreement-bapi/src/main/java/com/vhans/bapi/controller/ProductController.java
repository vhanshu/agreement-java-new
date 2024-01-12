package com.vhans.bapi.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.vhans.bus.data.domain.Product;
import com.vhans.bus.data.domain.vo.OverviewVO;
import com.vhans.bus.data.service.IProductService;
import com.vhans.bus.subsidiary.model.dto.DeleteDTO;
import com.vhans.core.annotation.VisitLogger;
import com.vhans.core.web.controller.BaseController;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;
import com.vhans.core.web.model.vo.SearchVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
     * 添加商品
     *
     * @param product 商品信息
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "添加商品")
    @PostMapping("/add")
    public Result<?> addProduct(@Validated @RequestBody Product product) {
        productService.addProduct(product);
        return Result.success();
    }

    /**
     * 回收或恢复商品
     *
     * @param delete 逻辑删除
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "回收或恢复商品")
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
    @SaCheckLogin
    @ApiOperation(value = "修改商品")
    @PutMapping("/update")
    public Result<?> updateProduct(@Validated @RequestBody Product product) {
        productService.updateProduct(product);
        return Result.success();
    }

    /**
     * 获取商品信息
     *
     * @param productId 商品id
     * @return {@link Result<Product>} 商品信息
     */
    @SaCheckLogin
    @ApiOperation(value = "获取商品信息")
    @GetMapping("/info/{productId}")
    public Result<Product> editProduct(@PathVariable("productId") Integer productId) {
        return Result.success(productService.getProductInfo(productId));
    }

    /**
     * 收藏商品
     *
     * @param productId 商品id
     * @return 结果
     */
    @SaCheckLogin
    @ApiOperation(value = "收藏商品")
    @PostMapping("/collect/{productId}")
    public Result<?> collectProduct(@PathVariable("productId") Integer productId) {
        productService.collectProduct(productId);
        return Result.success();
    }

    /**
     * 搜索商品
     *
     * @param keyword 关键字
     * @return {@link Result<SearchVO>} 商品搜索内容列表
     */
    @ApiOperation(value = "搜索商品")
    @GetMapping("/search/{keyword}")
    public Result<List<SearchVO>> listProductsBySearch(@PathVariable String keyword) {
        return Result.success(productService.listProductsBySearch(keyword));
    }

    /**
     * 根据标签查找商品列表
     *
     * @param tagNames 标签名列表
     * @param type     all并列 inter交叉
     * @return 商品列表
     */
    @ApiOperation(value = "根据标签查找商品列表")
    @PostMapping("/list/tags/{type}")
    public TableDataInfo<Product> listProductByTag(@RequestBody List<String> tagNames, @PathVariable String type) {
        List<Product> list = productService.listProductByTag(tagNames, "inter".equals(type));
        clearPage();
        return getDataTable(list);
    }

    /**
     * 查看前台商品列表
     *
     * @param query 标题或者发起人昵称及文本类型
     * @return {@link Product} 商品列表
     */
    @VisitLogger(value = "商品中心")
    @ApiOperation(value = "查看前台商品列表")
    @GetMapping("/list")
    public TableDataInfo<Product> listProduct(Product.Query query) {
        startPage();
        List<Product> list = productService.listHomeProduct(query);
        clearPage();
        return getDataTable(list);
    }

    /**
     * 查看商品
     *
     * @param productId 商品id
     * @return {@link Result<Product>} 商品信息
     */
    @ApiOperation(value = "查看商品")
    @GetMapping("/look/{productId}")
    public Result<Product> lookProduct(@PathVariable("productId") Integer productId) {
        return Result.success(productService.getProductHomeById(productId));
    }

    /**
     * 获取推荐商品
     *
     * @return {@link Result<Product>} 推荐商品
     */
    @ApiOperation(value = "查看推荐商品")
    @GetMapping("/recommend")
    public TableDataInfo<Product> listProduct() {
        startPage();
        List<Product> list = productService.listProduct();
        clearPage();
        return getDataTable(list);
    }

    /**
     * 查看商品总览
     *
     * @return {@link OverviewVO} 商品总览列表
     */
    @VisitLogger(value = "总览")
    @ApiOperation(value = "查看商品总览")
    @GetMapping("/overview")
    public TableDataInfo<OverviewVO> listProductOverviewVO() {
        startPage();
        List<OverviewVO> list = productService.listProductOverviewVO();
        clearPage();
        return getDataTable(list);
    }
}
