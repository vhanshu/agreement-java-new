package com.vhans.core.strategy;

/**
 * 点赞策略
 *
 * @author vhans
 */
public interface LikeStrategy {

    /**
     * 点赞
     *
     * @param typeId 类型id
     */
    void like(Integer typeId);
}
