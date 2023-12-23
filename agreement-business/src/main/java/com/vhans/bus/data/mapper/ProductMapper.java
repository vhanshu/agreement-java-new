package com.vhans.bus.data.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.data.domain.Product;
import com.vhans.bus.data.domain.vo.OverviewVO;
import com.vhans.bus.data.domain.vo.StatisticsVO;
import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import com.vhans.core.web.model.vo.SearchVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 商品Mapper接口
 *
 * @author vhans
 * @date 2023-12-22
 */
@Repository
public interface ProductMapper extends BaseMapper<Product> {

    /**
     * 查询商品列表
     *
     * @param query 条件
     * @return 商品列表
     */
    List<Product> selectProduct(@Param("query") Product.Query query);

    /**
     * 商品搜索
     *
     * @param keyword 关键字
     * @return 商品列表
     */
    List<SearchVO> searchProduct(@Param("keyword") String keyword);

    /**
     * 根据标签获取商品列表
     *
     * @param tagNames 标签名列表
     * @return 商品列表
     */
    List<Product> selectProductByTag(@Param("tagNames") List<String> tagNames);

    /**
     * 根据id查看前台商品信息
     *
     * @param productId 商品id
     * @return 商品信息
     */
    Product selectProductHomeById(@Param("productId") Integer productId);

    /**
     * 根据关键字查看商品列表
     *
     * @param query 关键字和类型
     * @return 商品列表
     */
    List<Product> listProduct(@Param("query") Product.Query query);

    /**
     * 根据商品ids查询前台商品列表
     *
     * @param productIds 商品ids
     * @return 商品列表
     */
    List<Product> selectProductHomeListByIds(@Param("productIds") List<Integer> productIds);

    /**
     * 查询推荐商品
     *
     * @return 商品列表
     */
    List<Product> listProductR();

    /**
     * 查询上一件商品
     *
     * @param productId 商品id
     * @return 上一件商品
     */
    PaginationVO selectLastProduct(Integer productId);

    /**
     * 查询下一件商品
     *
     * @param productId 商品id
     * @return 下一件商品
     */
    PaginationVO selectNextProduct(Integer productId);

    /**
     * 查询商品总览
     *
     * @return 商品归档
     */
    List<OverviewVO> selectOverviewProductList();

    /**
     * 查询商品统计
     *
     * @return 商品统计
     */
    List<StatisticsVO> selectProductStatistics();

}
