package com.vhans.core.constant;

/**
 * MQ常量
 *
 * @author vhans
 */
public class MqConstant {

    /**
     * 邮件交换机
     */
    public static final String EMAIL_EXCHANGE = "email.topic";

    /**
     * 邮件SIMPLE队列
     */
    public static final String EMAIL_SIMPLE_QUEUE = "email.simple.queue";

    /**
     * 邮件HTML队列
     */
    public static final String EMAIL_HTML_QUEUE = "email.html.queue";

    /**
     * 邮件Simple RoutingKey
     */
    public static final String EMAIL_SIMPLE_KEY = "email.simple.key";

    /**
     * 邮件Html RoutingKey
     */
    public static final String EMAIL_HTML_KEY = "email.html.key";

    /**
     * 记录交换机
     */
    public static final String RECORD_EXCHANGE = "record.topic";

    /**
     * 记录队列
     */
    public static final String RECORD_QUEUE = "record.queue";

    /**
     * 记录RoutingKey
     */
    public final static String RECORD_KEY = "record.key";

    /**
     * 题目交换机
     */
    public static final String QUIZ_EXCHANGE = "quiz.topic";

    /**
     * 题目队列
     */
    public static final String QUIZ_QUEUE = "quiz.queue";

    /**
     * 题目RoutingKey
     */
    public final static String QUIZ_KEY = "quiz.key";

}
