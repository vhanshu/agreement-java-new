package com.vhans.core.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 约起类型枚举
 *
 * @author vhans
 */
@Getter
@AllArgsConstructor
public enum AgreementTypeEnum {

    /**
     * 约会
     */
    APPOINTMENT(1, "约会", "user/center/agreement?agreementType=1&id="),
    /**
     * 活动
     */
    ACTIVITY(2, "活动", "user/center/agreement?agreementType=2&id="),
    /**
     * 赛事
     */
    COMPETITION(3, "赛事", "user/center/agreement?agreementType=3&id="),
    /**
     * 帮助
     */
    HELP(4, "帮助", "user/center/agreement?agreementType=4&id="),
    /**
     * 赛事观众
     */
    COMPETITION_AUDIENCE(5, "赛事观众", "agreement/center?agreementType=5&id="),
    /**
     * 指定约会
     */
    APPOINTMENT_SPECIFY(6, "指定约会", "agreement/center?agreementType=6&id=");

    /**
     * 状态
     */
    private final Integer type;

    /**
     * 描述
     */
    private final String desc;

    /**
     * 路径
     */
    private final String path;

    /**
     * 获取约起路径
     *
     * @param type 类型
     * @return {@link String}
     */
    public static String getAgreementPath(Integer type) {
        for (AgreementTypeEnum value : AgreementTypeEnum.values()) {
            if (value.getType().equals(type)) {
                return value.getPath();
            }
        }
        return null;
    }

}