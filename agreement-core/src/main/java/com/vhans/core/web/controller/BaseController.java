package com.vhans.core.web.controller;

import com.github.pagehelper.PageInfo;
import static com.vhans.core.enums.StatusCodeEnum.FAIL;
import static com.vhans.core.enums.StatusCodeEnum.SUCCESS;
import com.vhans.core.utils.web.PageUtils;
import com.vhans.core.web.model.Result;
import com.vhans.core.web.model.page.TableDataInfo;

import java.util.List;

/**
 * web层通用控制
 *
 * @author vhans
 */
public class BaseController {
    /**
     * 设置请求分页数据
     */
    protected void startPage() {
        PageUtils.startPage();
    }

    /**
     * 清理分页的线程变量
     */
    protected void clearPage() {
        PageUtils.clearPage();
    }

    /**
     * 响应请求分页数据
     */
    protected <T> TableDataInfo<T> getDataTable(List<T> list) {
        TableDataInfo<T> rspData = new TableDataInfo<>();
        rspData.setCode(SUCCESS.getCode());
        rspData.setRows(list);
        rspData.setMsg("操作成功");
        rspData.setTotal(new PageInfo<>(list).getTotal());
        return rspData;
    }

    /**
     * 响应请求分页数据,自定义总数
     */
    protected <T> TableDataInfo<T> getDataTable(List<T> list, Integer total) {
        TableDataInfo<T> rspData = new TableDataInfo<>();
        rspData.setCode(SUCCESS.getCode());
        rspData.setRows(list);
        rspData.setMsg("操作成功");
        rspData.setTotal(total);
        return rspData;
    }

    /**
     * 响应返回结果
     *
     * @param rows 影响行数
     * @return 操作结果
     */
    protected Result<?> toAjax(int rows) {
        return rows > 0 ? Result.success() : Result.fail(FAIL.getMsg());
    }
}
