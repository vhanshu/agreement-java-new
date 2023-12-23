package com.vhans.bus.data.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.data.domain.Product;
import com.vhans.bus.data.domain.vo.OverviewVO;
import com.vhans.bus.subsidiary.model.dto.DeleteDTO;
import com.vhans.bus.subsidiary.model.dto.RecommendDTO;
import com.vhans.bus.subsidiary.model.dto.TopDTO;
import com.vhans.core.web.model.vo.SearchVO;

import java.util.List;

/**
 * 商品Service接口
 * 
 * @author vhans
 * @date 2023-12-22
 */
public interface IProductService extends IService<Product> {

    /**
     * 查看商品列表
     *
     * @param query 条件
     * @return 商品列表
     */
    List<Product> listProduct(Product.Query query);

    /**
     * 添加商品
     *
     * @param product 商品
     */
    void addProduct(Product product);

    /**
     * 删除商品
     *
     * @param productIdList 商品id
     */
    void deleteProduct(List<Integer> productIdList);

    /**
     * 回收或恢复商品
     *
     * @param delete 逻辑删除
     */
    void updateProductDelete(DeleteDTO delete);

    /**
     * 修改商品
     *
     * @param product 商品
     */
    void updateProduct(Product product);

    /**
     * 根据id获取商品信息
     *
     * @param productId 商品id
     * @return 商品
     */
    Product getProductInfo(Integer productId);

    /**
     * 修改商品置顶状态
     *
     * @param top 置顶
     */
    void updateProductTop(TopDTO top);

    /**
     * 修改商品推荐状态
     *
     * @param recommend 推荐
     */
    void updateProductRecommend(RecommendDTO recommend);

    /**
     * 搜索商品
     *
     * @param keyword 关键字
     * @return 商品列表
     */
    List<SearchVO> listProductsBySearch(String keyword);

    /**
     * 根据标签查找商品列表
     * @param tagNames 标签名列表
     * @param isInter 是否相交
     * @return 商品列表
     */
    List<Product> listProductByTag(List<String> tagNames, boolean isInter);

    /**
     * 查看前台商品列表
     *
     * @param query 关键字和类型
     * @return 首页商品列表
     */
    List<Product> listHomeProduct(Product.Query query);

    /**
     * 查看商品(包括上下篇)
     *
     * @param productId 商品id
     * @return 商品
     */
    Product getProductHomeById(Integer productId);

    /**
     * 查看商品总览
     *
     * @return 商品总览
     */
    List<OverviewVO> listProductOverviewVO();

    /**
     * 查看推荐商品
     *
     * @return 推荐商品
     */
    List<Product> listProduct();

    /**
     * 收藏商品
     *
     * @param productId 商品id
     */
    void collectProduct(Integer productId);

    /**
     * 导入数据
     *
     * @param list     数据列表
     * @param isUpdate 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    String importData(List<Product> list, Boolean isUpdate);
}
