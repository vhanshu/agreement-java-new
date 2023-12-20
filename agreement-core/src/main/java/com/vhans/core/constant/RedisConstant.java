package com.vhans.core.constant;

/**
 * Redis常量
 *
 * @author vhans
 */
public class RedisConstant {

    /**
     * 用户验证码 key
     */
    public static final String CODE_KEY_USER = "codeUser:";

    /**
     * 管理员验证码 key
     */
    public static final String CODE_KEY_ADMIN = "codeAdmin:";

    /**
     * 验证码过期时间(分钟)
     */
    public static final Integer CODE_EXPIRE_TIME = 2;

    /**
     * 记录浏览量
     */
    public static final String RECORD_VIEW_COUNT = "record_view_count";

    /**
     * 题目浏览量
     */
    public static final String QUIZ_VIEW_COUNT = "quiz_view_count";

    /**
     * 约会浏览量
     */
    public static final String APPOINTMENT_VIEW_COUNT = "appointment_view_count";

    /**
     * 活动浏览量
     */
    public static final String ACTIVITY_VIEW_COUNT = "activity_view_count";

    /**
     * 赛事浏览量
     */
    public static final String COMPETITION_VIEW_COUNT = "competition_view_count";

    /**
     * 帮助浏览量
     */
    public static final String HELP_VIEW_COUNT = "help_view_count";

    /**
     * 记录点赞量
     */
    public static final String RECORD_LIKE_COUNT = "record_like_count";

    /**
     * 题目点赞量
     */
    public static final String QUIZ_LIKE_COUNT = "quiz_like_count";

    /**
     * 评论点赞量
     */
    public static final String COMMENT_LIKE_COUNT = "comment_like_count";

    /**
     * 题目作答点赞量
     */
    public static final String ANSWER_LIKE_COUNT = "answer_like_count";

    /**
     * 用户点赞记录
     */
    public static final String USER_RECORD_LIKE = "user_record_like:";

    /**
     * 用户点赞题目
     */
    public static final String USER_QUIZ_LIKE = "user_quiz_like:";

    /**
     * 用户点赞评论
     */
    public static final String USER_COMMENT_LIKE = "user_comment_like:";

    /**
     * 用户点赞题目作答
     */
    public static final String USER_ANSWER_LIKE = "user_answer_like:";

    /**
     * 网站配置
     */
    public static final String SITE_SETTING = "site_setting";

    /**
     * 访客
     */
    public static final String UNIQUE_VISITOR = "unique_visitor";

    /**
     * 网站浏览量
     */
    public static final String WEBSITE_VIEW_COUNT = "website_view_count";

    /**
     * 最近好友的ids
     */
    public static final String LATELY_FRIEND_IDS = "lately_friend_ids";

    /**
     * 最近群聊的ids
     */
    public static final String LATELY_GROUP_IDS = "lately_group_ids";

    /**
     * 最近拒绝用户请求的userIds:谁拒绝谁(formUid_toUid)
     */
    public static final String REQUEST_REJECT = "request_reject";

}