package com.vhans.bus.subsidiary.annotation;

import com.vhans.bus.subsidiary.validator.agreement.AgreementTypeValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

/**
 * 约起类型注解
 *
 * @author vhans
 */
@Documented
@Constraint(validatedBy = {AgreementTypeValidator.class})
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface AgreementType {
    String message() default "{javax.validation.constraints.NotBlank.message}";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    /**
     * @return 约起类型
     */
    int[] values() default {};
}
