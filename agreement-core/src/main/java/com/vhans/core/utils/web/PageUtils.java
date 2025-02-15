package com.vhans.core.utils.web;

import com.github.pagehelper.PageHelper;
import com.vhans.core.utils.data.SqlUtil;
import com.vhans.core.web.model.page.PageDomain;
import com.vhans.core.web.model.page.TableSupport;

/**
 * 分页工具类
 *
 * @author vhans
 */
public class PageUtils extends PageHelper {
    /**
     * 设置请求分页数据
     */
    public static void startPage() {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
        Boolean reasonable = pageDomain.getReasonable();
        PageHelper.startPage(pageNum, pageSize, orderBy).setReasonable(reasonable);
    }
}
