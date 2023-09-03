package com.vhans.core.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.core.TopicExchange;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.amqp.support.converter.MessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import static com.vhans.core.constant.MqConstant.*;

/**
 * RabbitMQ配置
 *
 * @author vhans
 **/
@Slf4j
@Configuration
public class RabbitMqConfig {

    /**
     * 消息转换器
     */
    @Bean
    public MessageConverter messageConverter() {
        return new Jackson2JsonMessageConverter();
    }

    /**
     * 邮件交换机
     */
    @Bean
    public TopicExchange emailExchange() {
        return new TopicExchange(EMAIL_EXCHANGE, true, false);
    }

    /**
     * 邮件Simple队列
     */
    @Bean
    public Queue emailSimpleQueue() {
        return new Queue(EMAIL_SIMPLE_QUEUE, true);
    }

    /**
     * 邮件Html队列
     */
    @Bean
    public Queue emailHtmlQueue() {
        return new Queue(EMAIL_HTML_QUEUE, true);
    }

    /**
     * 绑定邮件Simple队列
     */
    @Bean
    public Binding simpleQueueBinding() {
        return BindingBuilder.bind(emailSimpleQueue()).to(emailExchange()).with(EMAIL_SIMPLE_KEY);
    }

    /**
     * 绑定邮件Html队列
     */
    @Bean
    public Binding htmlQueueBinding() {
        return BindingBuilder.bind(emailHtmlQueue()).to(emailExchange()).with(EMAIL_HTML_KEY);
    }

    /**
     * 记录交换机
     */
    @Bean
    public TopicExchange recordExchange() {
        return new TopicExchange(RECORD_EXCHANGE, true, false);
    }

    /**
     * 记录队列
     */
    @Bean
    public Queue recordQueue() {
        return new Queue(RECORD_QUEUE, true);
    }

    /**
     * 绑定记录队列
     */
    @Bean
    public Binding recordQueueBinding() {
        return BindingBuilder.bind(recordQueue()).to(recordExchange()).with(RECORD_KEY);
    }

    /**
     * 题目交换机
     */
    @Bean
    public TopicExchange quizExchange() {
        return new TopicExchange(QUIZ_EXCHANGE, true, false);
    }

    /**
     * 题目队列
     */
    @Bean
    public Queue quizQueue() {
        return new Queue(QUIZ_QUEUE, true);
    }

    /**
     * 绑定记录队列
     */
    @Bean
    public Binding quizQueueBinding() {
        return BindingBuilder.bind(quizQueue()).to(quizExchange()).with(QUIZ_KEY);
    }
}