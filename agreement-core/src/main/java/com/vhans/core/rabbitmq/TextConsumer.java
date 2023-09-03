package com.vhans.core.rabbitmq;

import cn.hutool.json.JSONUtil;
import com.vhans.core.rabbitmq.service.ElasticsearchService;
import com.vhans.core.web.model.dto.CanalDTO;
import com.vhans.core.web.model.vo.SearchVO;
import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.Exchange;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.QueueBinding;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.nio.charset.StandardCharsets;

import static com.vhans.core.constant.ElasticConstant.*;
import static com.vhans.core.constant.MqConstant.*;
import static com.vhans.core.constant.NumberConstant.ONE;
import static com.vhans.core.constant.NumberConstant.TWO;

/**
 * 文本消费者
 *
 * @author vhans
 **/
@Component
public class TextConsumer {

    @Autowired
    private ElasticsearchService elasticsearchService;

    /**
     * RabbitMQ 消息监听器
     * RECORD_QUEUE: 持久化队列 ,在最后一个消费者断开连接后自动删除
     * RECORD_EXCHANGE:TOPIC类型的交换机
     * RECORD_KEY:队列和交换机之间的路由键
     *
     * @param message RabbitMQ 接收到的消息内容和元数据信息
     */
    @RabbitListener(bindings = {
            @QueueBinding(
                    value = @Queue(value = RECORD_QUEUE, durable = "true", autoDelete = "false"),
                    exchange = @Exchange(value = RECORD_EXCHANGE, type = ExchangeTypes.TOPIC),
                    key = RECORD_KEY
            )})
    public void listenSaveRecord(Message message) {
        execute(message, ONE);
    }

    @RabbitListener(bindings = {
            @QueueBinding(
                    value = @Queue(value = QUIZ_QUEUE, durable = "true", autoDelete = "false"),
                    exchange = @Exchange(value = QUIZ_EXCHANGE, type = ExchangeTypes.TOPIC),
                    key = QUIZ_KEY
            )})
    public void listenSaveQuiz(Message message) {
        execute(message, TWO);
    }


    /**
     * 开始消息处理
     *
     * @param message 消息
     * @param type    文本类型
     */
    private void execute(Message message, Integer type) {
        // 获取消息内容的字节数组，然后将其解码为字符串
        String data = new String(message.getBody(), StandardCharsets.UTF_8);
        CanalDTO canalDTO = JSONUtil.toBean(JSONUtil.toJsonStr(data), CanalDTO.class);
        if (canalDTO.getIsDdl()) {
            return;
        }
        SearchVO searchVO = JSONUtil.toBean(JSONUtil.toJsonStr(canalDTO.getData().get(0)), SearchVO.class);
        switch (canalDTO.getType()) {
            case INSERT -> elasticsearchService.addText(searchVO, type);
            case UPDATE -> elasticsearchService.updateText(searchVO, type);
            case DELETE -> elasticsearchService.deleteText(searchVO.getId(), type);
            default -> {}
        }
    }
}