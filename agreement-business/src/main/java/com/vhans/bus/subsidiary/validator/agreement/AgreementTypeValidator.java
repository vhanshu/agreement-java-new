package com.vhans.bus.subsidiary.validator.agreement;

import com.vhans.bus.subsidiary.annotation.AgreementType;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.HashSet;
import java.util.Set;

/**
 * 自定义约起类型校验器
 *
 * @author vhans
 **/
public class AgreementTypeValidator implements ConstraintValidator<AgreementType, Integer> {

    private final Set<Integer> set = new HashSet<>();

    /**
     * 初始化
     *
     * @param constraintAnnotation 约起类型注解
     */
    @Override
    public void initialize(AgreementType constraintAnnotation) {
        for (int value : constraintAnnotation.values()) {
            set.add(value);
        }
    }

    /**
     * 校验方法
     *
     * @param value                      校验的值
     * @param constraintValidatorContext 上下文
     * @return 是否校验成功
     */
    @Override
    public boolean isValid(Integer value, ConstraintValidatorContext constraintValidatorContext) {
        return set.contains(value);
    }
}