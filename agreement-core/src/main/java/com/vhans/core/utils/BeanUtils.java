package com.vhans.core.utils;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Validator;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * 拷贝工具
 *
 * @author vhans
 */
public class BeanUtils {

    /**
     * 拷贝对象
     *
     * @param source 源对象
     * @param target 目标类型
     * @param <T>    目标类型
     * @return 目标对象
     */
    public static <T> T copyBean(Object source, Class<T> target) {
        // 创建目标对象
        T result = null;
        try {
            result = target.getDeclaredConstructor().newInstance();
            if (source != null) {
                // 实现属性copy
                org.springframework.beans.BeanUtils.copyProperties(source, result);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 返回结果
        return result;
    }

    /**
     * 拷贝对象列表
     *
     * @param source 源对象列表
     * @param target 目标类型
     * @param <T>    目标类型
     * @return 目标对象列表
     */
    public static <T, S> List<T> copyBeanList(List<S> source, Class<T> target) {
        List<T> list = new ArrayList<>();
        if (null != source && source.size() > 0) {
            for (Object obj : source) {
                list.add(copyBean(obj, target));
            }
        }
        return list;
    }

    /**
     * bean对象属性验证
     *
     * @param validator 验证器
     * @param object    要验证的对象
     * @param groups    验证组
     */
    public static void validateWithException(Validator validator, Object object, Class<?>... groups)
            throws ConstraintViolationException {
        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(object, groups);
        if (!constraintViolations.isEmpty()) {
            throw new ConstraintViolationException(constraintViolations);
        }
    }

}
