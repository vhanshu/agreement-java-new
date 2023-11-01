package com.vhans.core.redis;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * Redis服务处理
 *
 * @author vhans
 */
@SuppressWarnings("all")
@Service("redisService")
public class RedisService {
    @Resource
    private RedisTemplate<String, Object> redisTemplate;

    /**
     * 设置有效时间
     *
     * @param key      键
     * @param timeout  有效时间
     * @param timeUnit 时间单位
     * @return 是否成功
     */
    public Boolean setExpire(String key, long timeout, TimeUnit timeUnit) {
        return redisTemplate.expire(key, timeout, timeUnit);
    }

    /**
     * 获取有效时间
     *
     * @param key 键
     * @return 有效时间
     */
    Long getExpire(String key, TimeUnit timeUnit) {
        return redisTemplate.getExpire(key, timeUnit);
    }

    /**
     * 获取所有的缓存对象
     *
     * @param pattern 字符串前缀
     * @return 对象列表
     */
    public Collection<String> getKeys(String pattern) {
        return redisTemplate.keys(pattern);
    }

    /**
     * 判断key是否存在
     *
     * @param key 键
     * @return 是否存在
     */
    public Boolean hasKey(String key) {
        return redisTemplate.hasKey(key);
    }

    /**
     * 缓存基本的对象
     *
     * @param key   键
     * @param value 值
     */
    public <T> void setObject(String key, T value) {
        redisTemplate.opsForValue().set(key, value);
    }

    /**
     * 缓存基本的对象
     *
     * @param key      键
     * @param value    值
     * @param timeout  有效时间
     * @param timeUnit 时间单位
     */
    public <T> void setObject(String key, T value, long timeout, TimeUnit timeUnit) {
        redisTemplate.opsForValue().set(key, value, timeout, timeUnit);
    }

    /**
     * 获取缓存对象
     *
     * @param key 键
     * @return 缓存对象
     */
    public <T> T getObject(String key) {
        return (T) redisTemplate.opsForValue().get(key);
    }

    /**
     * 删除单个缓存对象
     *
     * @param key 键
     * @return 是否成功
     */
    public Boolean deleteObject(String key) {
        return redisTemplate.delete(key);
    }

    /**
     * 删除多个缓存对象
     *
     * @param keys 键
     * @return 删除数量
     */
    public Long deleteObject(List<String> keys) {
        return redisTemplate.delete(keys);
    }

    /**
     * 按delta递增
     *
     * @param key   键
     * @param delta 递增因子（大于0）
     * @return 递增后的长度
     */
    public Long incr(String key, long delta) {
        return redisTemplate.opsForValue().increment(key, delta);
    }

    /**
     * 按delta递减
     *
     * @param key   键
     * @param delta 递减因子
     * @return 递减后的长度
     */
    public Long decr(String key, long delta) {
        return redisTemplate.opsForValue().decrement(key, -delta);
    }

    /**
     * 向Hash结构中添加缓存
     *
     * @param key     外部键
     * @param hashKey 内部键
     * @param value   值
     */
    public <T> void setHash(String key, String hashKey, T value) {
        redisTemplate.opsForHash().put(key, hashKey, value);
    }

    /**
     * 向Hash结构中添加缓存
     *
     * @param key     外部键
     * @param hashKey 内部键
     * @param value   值
     * @param timeout 有效时间
     * @return 是否成功
     */
    public <T> Boolean setHash(String key, String hashKey, T value, long timeout, TimeUnit timeUnit) {
        redisTemplate.opsForHash().put(key, hashKey, value);
        return setExpire(key, timeout, timeUnit);
    }

    /**
     * 向Hash结构中添加Map
     *
     * @param key 键
     * @param map HashMap值
     */
    public <T> void setHashAll(String key, Map<String, T> map) {
        redisTemplate.opsForHash().putAll(key, map);
    }

    /**
     * 向Hash结构中添加Map
     *
     * @param key      键
     * @param map      HashMap值
     * @param timeout  有效时间
     * @param timeUnit 时间单位
     * @return 是否成功
     */
    public <T> Boolean setHashAll(String key, Map<String, T> map, long timeout, TimeUnit timeUnit) {
        redisTemplate.opsForHash().putAll(key, map);
        return setExpire(key, timeout, timeUnit);
    }

    /**
     * 获取Hash结构中的值
     *
     * @param key     外部键
     * @param hashKey 内部键
     * @return 值
     */
    public <T> T getHash(String key, String hashKey) {
        return (T) redisTemplate.opsForHash().get(key, hashKey);
    }

    /**
     * 获取Hash结构
     *
     * @param key 键
     * @return Map集合
     */
    public Map getHashAll(String key) {
        return redisTemplate.opsForHash().entries(key);
    }

    /**
     * 删除Hash结构中的值
     *
     * @param key      外键键
     * @param hashKeys 内部键
     */
    public <T> void deleteHash(String key, T... hashKeys) {
        redisTemplate.opsForHash().delete(key, hashKeys);
    }

    /**
     * 判断Hash结构中是否有该项的值
     *
     * @param key     外部键
     * @param hashKey 内部键
     * @return 是否存在
     */
    public Boolean hasHashValue(String key, String hashKey) {
        return redisTemplate.opsForHash().hasKey(key, hashKey);
    }

    /**
     * Hash递增 如果不存在则创建一个值并把递增后的值返回
     *
     * @param key     外部键
     * @param hashKey 内部键
     * @param delta   递增因子
     * @return 递增后的值
     */
    public Long incrHash(String key, String hashKey, Long delta) {
        return redisTemplate.opsForHash().increment(key, hashKey, delta);
    }

    /**
     * Hash递减 如果不存在则创建一个值并把递减后的值返回
     *
     * @param key     外部键
     * @param hashKey 内部键
     * @param delta   递减因子
     * @return 递减后的值
     */
    public Long decrHash(String key, String hashKey, Long delta) {
        return redisTemplate.opsForHash().increment(key, hashKey, -delta);
    }

    /**
     * 向List结构中添加缓存
     *
     * @param key   键
     * @param value 值
     * @return 缓存后的长度
     */
    public <T> Long setList(String key, T value) {
        return redisTemplate.opsForList().rightPush(key, value);
    }

    /**
     * 向List结构中添加缓存
     *
     * @param key      键
     * @param value    值
     * @param timeout  有效时间
     * @param timeUnit 时间单位
     * @return 缓存后的长度
     */
    public <T> Long setList(String key, T value, long timeout, TimeUnit timeUnit) {
        Long count = redisTemplate.opsForList().rightPush(key, value);
        setExpire(key, timeout, timeUnit);
        return count;
    }

    /**
     * 向List结构中批量添加缓存
     *
     * @param key    键
     * @param values 值
     * @return 缓存后的长度
     */
    public <T> Long setListAll(String key, T... values) {
        return redisTemplate.opsForList().rightPushAll(key, values);
    }

    /**
     * 向List结构中批量添加缓存
     *
     * @param key      键
     * @param timeout  有效时间
     * @param timeUnit 时间单位
     * @param values   值
     * @return 缓存后的长度
     */
    public <T> Long setListAll(String key, long timeout, TimeUnit timeUnit, T... values) {
        Long count = redisTemplate.opsForList().rightPushAll(key, values);
        setExpire(key, timeout, timeUnit);
        return count;
    }

    /**
     * 获取List结构中的值
     *
     * @param key   键
     * @param start 开始
     * @param end   结束
     * @return List集合
     */
    public <T> List<T> getList(String key, long start, long end) {
        List<T> result = (List<T>) redisTemplate.opsForList().range(key, start, end);
        return result;
    }

    /**
     * 根据索引获取List结构中的值
     *
     * @param key   键
     * @param index 索引
     * @return 值
     */
    public <T> T getListByIndex(String key, long index) {
        return (T) redisTemplate.opsForList().index(key, index);
    }

    /**
     * 获取List结构的长度
     *
     * @param key 键
     * @return 长度
     */
    public Long getListSize(String key) {
        return redisTemplate.opsForList().size(key);
    }

    /**
     * 从List结构中删除缓存
     *
     * @param key   值
     * @param count 数量
     * @param value 值
     * @return 删除后的长度
     */
    public <T> Long deleteList(String key, long count, T value) {
        return redisTemplate.opsForList().remove(key, count, value);
    }

    /**
     * 向Set结构中添加缓存
     *
     * @param key    键
     * @param values 值
     * @return 缓存的数量
     */
    public <T> Long setSet(String key, T... values) {
        return redisTemplate.opsForSet().add(key, values);
    }

    /**
     * 向Set结构中添加缓存
     *
     * @param key      键
     * @param timeout  有效时间
     * @param timeUnit 时间单位
     * @param values   值
     * @return 缓存的数量
     */
    public <T> Long setSet(String key, long timeout, TimeUnit timeUnit, T... values) {
        Long count = redisTemplate.opsForSet().add(key, values);
        setExpire(key, timeout, timeUnit);
        return count;
    }

    /**
     * 获取Set结构
     *
     * @param key 键
     * @return Set集合
     */
    public <T> Set<T> getSet(String key) {
        Set<T> result = (Set<T>) redisTemplate.opsForSet().members(key);
        return result;
    }

    /**
     * 删除Set结构中的值
     *
     * @param key    键
     * @param values 值
     * @return 删除的数量
     */
    public <T> Long deleteSet(String key, T... values) {
        return redisTemplate.opsForSet().remove(key, values);
    }

    /**
     * 判断Set结构中是否有该项的值
     *
     * @param key   键
     * @param value 值
     * @return 是否存在
     */
    public <T> Boolean hasSetValue(String key, T value) {
        return redisTemplate.opsForSet().isMember(key, value);
    }

    /**
     * 获取Set结构的长度
     *
     * @param key 键
     * @return 长度
     */
    public Long getSetSize(String key) {
        return redisTemplate.opsForSet().size(key);
    }

    /**
     * Zset添加分数
     *
     * @param key   键
     * @param value 值
     * @param score 分数
     * @return {@link Double}
     */
    public <T> Double incrZet(String key, T value, Double score) {
        return redisTemplate.opsForZSet().incrementScore(key, value, score);
    }

    /**
     * Zset减少分数
     *
     * @param key   键
     * @param value 值
     * @param score 分数
     * @return {@link Double}
     */
    public <T> Double decrZet(String key, T value, Double score) {
        return redisTemplate.opsForZSet().incrementScore(key, value, -score);
    }

    /**
     * 删除Zset中数据
     *
     * @param key    键
     * @param values 值
     * @return 删除个数
     */
    public <T> Long deleteZetScore(String key, T... values) {
        return redisTemplate.opsForZSet().remove(key, values);
    }

    /**
     * zset根据分数排名获取指定元素信息
     *
     * @param key   键
     * @param start 开始
     * @param end   结束
     * @return {@link Map<Object, Double>}
     */
    public Map<Object, Double> zReverseRangeWithScore(String key, long start, long end) {
        return redisTemplate.opsForZSet().reverseRangeWithScores(key, start, end)
                .stream()
                .collect(Collectors.toMap(ZSetOperations.TypedTuple::getValue, ZSetOperations.TypedTuple::getScore));
    }

    /**
     * 获取Zset指定元素分数
     *
     * @param key   键
     * @param value 值
     * @return 分数
     */
    public <T> Double getZsetScore(String key, T value) {
        return redisTemplate.opsForZSet().score(key, value);
    }

    /**
     * 获取Zset所有分数
     *
     * @param key 关键
     * @return {@link Map}
     */
    public Map<Object, Double> getZsetAllScore(String key) {
        return Objects.requireNonNull(redisTemplate.opsForZSet().rangeWithScores(key, 0, -1))
                .stream()
                .collect(Collectors.toMap(ZSetOperations.TypedTuple::getValue, ZSetOperations.TypedTuple::getScore));
    }
}