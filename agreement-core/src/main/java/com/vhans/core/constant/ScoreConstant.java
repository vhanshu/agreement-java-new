package com.vhans.core.constant;

/**
 * 分数常量
 *
 * @author vhans
 */
public class ScoreConstant {

    /**
     * 约会:发起*2,取消*-2;参与*1,取消*-2
     */
    public static final Integer APPOINTMENT_SCORE = 5;

    /**
     * 活动:发起*2,取消*-2;参与*1,取消*-2
     */
    public static final Integer ACTIVITY_SCORE = 2;

    /**
     * 赛事:发起*2,取消*-2;接下*6,取消*-10
     */
    public static final Integer COMPETITION_SCORE = 3;

    /**
     * 帮忙:发起*2,取消*-2;参与*1,取消*-2
     */
    public static final Integer HELP_SCORE = 4;

    /**
     * 观众:参与*1,取消*-2
     */
    public static final Integer AUDIENCE_SCORE = 1;

    /**
     * 点赞:被点赞*1,取消*-1
     */
    public static final Integer LIKE_SCORE = 1;

    /**
     * 发表记录:*1
     */
    public static final Integer PUBLISH_SCORE = 10;

    /**
     * 评论:*1
     */
    public static final Integer COMMENT_SCORE = 1;

    /**
     * 题目:出题*1,解题*1(5分为一颗星)
     */
    public static final Integer QUIZ_GRADE = 1;
}
