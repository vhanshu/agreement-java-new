package com.vhans.bus.website.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vhans.bus.subsidiary.model.dto.StatusDTO;
import com.vhans.bus.website.domain.dto.TaskRunDTO;
import com.vhans.bus.website.domain.Task;
import org.quartz.SchedulerException;

import java.util.List;

/**
 * 定时任务业务接口
 *
 * @author vhans
 */
public interface ITaskService extends IService<Task> {

    void init() throws SchedulerException;

    /**
     * 查看定时任务列表
     *
     * @param query 条件
     * @return 定时任务列表
     */
    List<Task> listTask(Task.Query query);


    /**
     * 添加定时任务
     *
     * @param task 定时任务
     */
    void addTask(Task task);

    /**
     * 修改定时任务
     *
     * @param task 定时任务信息
     */
    void updateTask(Task task);

    /**
     * 删除定时任务
     *
     * @param taskIdList 定时任务id集合
     */
    void deleteTask(List<Integer> taskIdList);

    /**
     * 修改定时任务状态
     *
     * @param taskStatus 定时任务状态
     */
    void updateTaskStatus(StatusDTO taskStatus);

    /**
     * 定时任务立即执行一次
     *
     * @param taskRun 定时任务
     */
    void runTask(TaskRunDTO taskRun);
}
