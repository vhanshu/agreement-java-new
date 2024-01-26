package com.vhans.bus.data.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vhans.bus.data.domain.Product;
import com.vhans.bus.data.domain.TagText;
import com.vhans.bus.data.domain.vo.OverviewVO;
import com.vhans.bus.data.domain.vo.TagStatisticsVO;
import com.vhans.bus.data.mapper.ProductMapper;
import com.vhans.bus.data.mapper.TagMapper;
import com.vhans.bus.data.mapper.TagTextMapper;
import com.vhans.bus.data.service.IProductService;
import com.vhans.bus.data.service.ITagService;
import com.vhans.bus.subsidiary.model.dto.DeleteDTO;
import com.vhans.bus.subsidiary.model.dto.RecommendDTO;
import com.vhans.bus.subsidiary.model.dto.TopDTO;
import com.vhans.bus.subsidiary.model.vo.PaginationVO;
import com.vhans.bus.user.domain.UserCollect;
import com.vhans.bus.user.mapper.UserCollectMapper;
import com.vhans.bus.website.domain.SiteConfig;
import com.vhans.core.exception.ServiceException;
import com.vhans.core.redis.RedisService;
import com.vhans.core.strategy.context.SearchStrategyContext;
import com.vhans.core.utils.BeanUtils;
import com.vhans.core.utils.SpringUtils;
import com.vhans.core.utils.data.StringUtils;
import com.vhans.core.utils.web.PageUtils;
import com.vhans.core.web.model.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.Validator;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

import static com.vhans.core.constant.CommonConstant.FALSE;
import static com.vhans.core.constant.RedisConstant.PRODUCT_VIEW_COUNT;
import static com.vhans.core.constant.RedisConstant.SITE_SETTING;
import static com.vhans.core.constant.TextContent.PRODUCT;

/**
 * 商品Service业务层处理
 * 
 * @author vhans
 * @date 2023-12-22
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements IProductService {
    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private TagTextMapper tagTextMapper;

    @Autowired
    private TagMapper tagMapper;

    @Autowired
    private UserCollectMapper userCollectMapper;

    @Autowired
    private ITagService tagService;

    @Autowired
    private RedisService redisService;

    @Autowired
    private SearchStrategyContext searchStrategyContext;

    @Override
    public List<Product> listProduct(Product.Query query) {
        // 查询商品信息
        List<Product> products = productMapper.selectProduct(query);
        // 封装商品信息
        return postProduct(products);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void addProduct(Product product) {
        // 添加商品
        if (StringUtils.isBlank(product.getCover())) {
            SiteConfig siteConfig = redisService.getObject(SITE_SETTING);
            product.setCover(siteConfig.getCover());
        }
        product.setUserId(StpUtil.getLoginIdAsInt());
        productMapper.insert(product);
        // 保存商品标签
        saveProductTag(product);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteProduct(List<Integer> productIdList) {
        // 删除商品标签
        tagTextMapper.delete(new LambdaQueryWrapper<TagText>()
                .in(TagText::getTypeId, productIdList));
        // 删除商品
        productMapper.deleteBatchIds(productIdList);
    }

    @Transactional
    @Override
    public void updateProductDelete(DeleteDTO delete) {
        // 批量更新商品删除状态
        List<Product> agreeProductList = delete.getIdList()
                .stream()
                .map(id -> Product.builder()
                        .id(id)
                        .isDelete(delete.getIsDelete())
                        .isTop(FALSE)
                        .isRecommend(FALSE)
                        .collectNumber(0)
                        .build())
                .toList();
        this.updateBatchById(agreeProductList);
        // 删除用户收藏
        List<Integer> productIds = agreeProductList.stream().map(Product::getId).toList();
        userCollectMapper.delete(new LambdaQueryWrapper<UserCollect>()
                .in(UserCollect::getTypeId, productIds));
    }

    @Override
    public void updateProduct(Product product) {
        // 修改商品
        product.setUserId(StpUtil.getLoginIdAsInt());
        productMapper.updateById(product);
        // 保存商品标签
        saveProductTag(product);
    }

    @Override
    public Product getProductInfo(Integer productId) {
        // 查询商品信息
        Product product = productMapper.selectProductHomeById(productId);
        Assert.notNull(product, "没有该商品,编号" + productId);
        // 查询浏览量
        Double viewCount = Optional.ofNullable(redisService.getZsetScore(PRODUCT_VIEW_COUNT, productId)).orElse((double) 0);
        // 查询标签
        List<TagStatisticsVO> tags = Optional.ofNullable(tagMapper.selectTagByTypeId(productId, PRODUCT)).orElse(new ArrayList<>());
        product.setViewCount(viewCount.intValue());
        product.setTagList(tags);
        return product;
    }

    @Override
    public void updateProductTop(TopDTO top) {
        // 修改商品置顶状态
        productMapper.updateById(Product.builder()
                .id(top.getId())
                .isTop(top.getIsTop())
                .build());
    }

    @Override
    public void updateProductRecommend(RecommendDTO recommend) {
        // 修改商品推荐状态
        productMapper.updateById(Product.builder()
                .id(recommend.getId())
                .isRecommend(recommend.getIsRecommend())
                .build());
    }

    @Override
    public List<SearchVO> listProductsBySearch(String keyword) {
        return searchStrategyContext.executeSearchStrategy(keyword, PRODUCT);
    }

    @Override
    public List<Product> listProductByTag(List<String> tagNames, boolean isInter) {
        if (isInter) {
            List<Integer> productIds = tagMapper.selectTextIds(tagNames, PRODUCT);
            productIds = productIds.stream().filter(id -> {
                List<String> tagAllNames = tagMapper.selectTagNameByTypeId(id, PRODUCT);
                return new HashSet<>(tagAllNames).containsAll(tagNames);
            }).toList();
            PageUtils.startPage();
            return StringUtils.isNotEmpty(productIds) ? postProduct(productMapper.selectProductHomeListByIds(productIds)) : new ArrayList<>();
        } else {
            PageUtils.startPage();
            return postProduct(productMapper.selectProductByTag(tagNames));
        }
    }

    @Override
    public List<Product> listHomeProduct(Product.Query query) {
        // 查询首页商品
        List<Product> products = productMapper.listProduct(query);
        // 封装商品信息
        return postProduct(products);
    }

    @Override
    public Product getProductHomeById(Integer productId) {
        // 查询商品信息
        Product product = productMapper.selectProductHomeById(productId);
        Assert.notNull(product, "没有该商品");
        // 浏览量+1
        redisService.incrZet(PRODUCT_VIEW_COUNT, productId, 1D);
        // 查询上/下一篇商品
        PaginationVO lastProduct = productMapper.selectLastProduct(productId);
        PaginationVO nextProduct = productMapper.selectNextProduct(productId);
        // 查询浏览量
        Double viewCount = Optional.ofNullable(redisService.getZsetScore(PRODUCT_VIEW_COUNT, productId)).orElse((double) 0);
        // 查询标签
        List<TagStatisticsVO> tags = Optional.ofNullable(tagMapper.selectTagByTypeId(productId, PRODUCT)).orElse(new ArrayList<>());
        product.setViewCount(viewCount.intValue());
        product.setLastProduct(lastProduct);
        product.setNextProduct(nextProduct);
        product.setTagList(tags);
        return product;
    }

    @Override
    public List<OverviewVO> listProductOverviewVO() {
        return productMapper.selectOverviewProductList();
    }

    @Override
    public List<Product> listProduct() {
        List<Product> products = productMapper.listProductR();
        return postProduct(products);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void collectProduct(Integer productId) {
        Product agreeProduct = productMapper.selectOne(new LambdaQueryWrapper<Product>()
                .eq(Product::getId, productId));
        Assert.notNull(agreeProduct, "商品不存在");
        // 判断用户是否收藏
        List<Integer> collect = userCollectMapper.selectList(new LambdaQueryWrapper<UserCollect>()
                        .select(UserCollect::getUserId, UserCollect::getTypeId)
                        .eq(UserCollect::getUserId, StpUtil.getLoginIdAsInt()))
                .stream()
                .map(UserCollect::getTypeId)
                .toList();
        if (collect.contains(productId)) {
            // 取消收藏则删除用户的该收藏
            userCollectMapper.delete(new LambdaQueryWrapper<UserCollect>()
                    .eq(UserCollect::getUserId, StpUtil.getLoginIdAsInt())
                    .eq(UserCollect::getTypeId, productId));
            // 商品收藏数-1
            agreeProduct.setCollectNumber(agreeProduct.getCollectNumber() - 1);
        } else {
            // 收藏则添加用户的该收藏
            userCollectMapper.saveUserCollect(StpUtil.getLoginIdAsInt(), PRODUCT, productId);
            // 商品收藏数+1
            agreeProduct.setCollectNumber(agreeProduct.getCollectNumber() + 1);
        }
        productMapper.updateById(agreeProduct);
    }

    @Override
    public String importData(List<Product> list, Boolean isUpdate) {
        Assert.isTrue(StringUtils.isNotEmpty(list), "导入数据不能为空!");
        AtomicInteger successNum = new AtomicInteger();
        AtomicInteger failureNum = new AtomicInteger();
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        Validator validator = SpringUtils.getBean("validator");
        list.forEach(item -> {
            String mark = item.getTitle().substring(0, Math.min(5, item.getTitle().length()));
            try {
                if (!productMapper.exists(new LambdaQueryWrapper<Product>().eq(Product::getTitle, item.getTitle()))) {
                    // 不存在这条数据
                    BeanUtils.validateWithException(validator, item);
                    productMapper.insert(item);
                    successNum.getAndIncrement();
                    successMsg.append("<br/>").append(successNum).append("、数据 ").append(mark).append(" 导入成功");
                } else if (isUpdate) {
                    BeanUtils.validateWithException(validator, item);
                    successNum.getAndIncrement();
                    successMsg.append("<br/>").append(successNum).append("、数据 ").append(mark).append(" 更新成功");
                } else {
                    failureNum.getAndIncrement();
                    failureMsg.append("<br/>").append(failureNum).append("、数据 ").append(mark).append(" 已存在");
                }
            } catch (Exception e) {
                failureNum.getAndIncrement();
                String msg = "<br/>" + failureNum + "、数据 " + mark + " 导入失败：";
                failureMsg.append(msg).append(e.getMessage());
                log.error(msg, e);
            }
        });
        if (failureNum.get() > 0) {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

    /**
     * 封装商品信息
     *
     * @param list 原始商品列表
     * @return 封装后的商品列表
     */
    private List<Product> postProduct(List<Product> list) {
        list.forEach(item -> {
            // 查询商品浏览量
            Double viewCount = Optional.ofNullable(redisService.getZsetScore(PRODUCT_VIEW_COUNT, item.getId()))
                    .orElse((double) 0);
            // 查询商品标签
            List<TagStatisticsVO> tags = Optional.ofNullable(tagMapper.selectTagByTypeId(item.getId(), PRODUCT)).orElse(new ArrayList<>());
            item.setViewCount(viewCount.intValue());
            item.setTagList(tags);
        });
        return list;
    }

    /**
     * 保存商品标签
     *
     * @param product   商品信息
     */
    private void saveProductTag(Product product) {
        // 删除商品标签
        tagTextMapper.delete(new LambdaQueryWrapper<TagText>()
                .eq(TagText::getType, PRODUCT)
                .eq(TagText::getTypeId, product.getId()));
        // 标签名列表
        List<String> tagNameList = product.getTagNameList();
        if (StringUtils.isNotEmpty(tagNameList)) {
            // 提供覆盖的标签
            List<Integer> coverTagIds = tagService.getCoverTag(tagNameList);
            // 将所有的新标签绑定到商品标签关联表
            tagTextMapper.saveBatchTag(product.getId(), PRODUCT, coverTagIds);
        }
    }
}
