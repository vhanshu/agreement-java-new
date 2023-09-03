package com.vhans.bus.website.quartz.utils;

import com.vhans.core.constant.ScheduleConstant;
import com.vhans.core.enums.TaskStatusEnum;
import com.vhans.core.exception.ServiceException;
import com.vhans.bus.website.quartz.execution.QuartzDisallowConcurrentExecution;
import com.vhans.bus.website.quartz.execution.QuartzJobExecution;
import com.vhans.bus.website.domain.Task;
import org.quartz.*;

import static com.vhans.core.constant.CommonConstant.TRUE;

/**
 * 定时任务工具类
 *
 * @author vhans
 */
public class ScheduleUtils {

    /**
     * 得到quartz任务类
     *
     * @param task 执行计划
     * @return 具体执行任务类
     */
    private static Class<? extends Job> getQuartzJobClass(Task task) {
        boolean isConcurrent = TRUE.equals(task.getConcurrent());
        return isConcurrent ? QuartzJobExecution.class : QuartzDisallowConcurrentExecution.class;
    }

    /**
     * 构建任务触发对象
     */
    public static TriggerKey getTriggerKey(Integer taskId, String taskGroup) {
        return TriggerKey.triggerKey(ScheduleConstant.TASK_CLASS_NAME + taskId, taskGroup);
    }

    /**
     * 构建任务键对象
     */
    public static JobKey getJobKey(Integer taskId, String taskGroup) {
        return JobKey.jobKey(ScheduleConstant.TASK_CLASS_NAME + taskId, taskGroup);
    }

    /**
     * 创建定时任务
     */
    public static void createScheduleJob(Scheduler scheduler, Task task) {
        try {
            Class<? extends Job> jobClass = getQuartzJobClass(task);
            // 构建task信息
            Integer taskId = task.getId();
            String taskGroup = task.getTaskGroup();
            // 创建JobDetail对象,绑定自定义job,并指定唯一标识
            JobDetail jobDetail = JobBuilder.newJob(jobClass).withIdentity(getJobKey(taskId, taskGroup)).build();
            // 表达式调度构建器
            CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule(task.getCronExpression());
            cronScheduleBuilder = handleCronScheduleMisfirePolicy(task, cronScheduleBuilder);
            // 按新的cronExpression表达式构建一个新的trigger
            CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(getTriggerKey(taskId, taskGroup))
                    .withSchedule(cronScheduleBuilder).build();
            // 将ATask对象放入JobDetail的JobDataMap中，运行时的方法可以获取
            jobDetail.getJobDataMap().put(ScheduleConstant.TASK_PROPERTIES, task);
            // 判断Job是否已存在，如果存在，为防止创建时存在数据问题,则先删除已经存在的Job，然后再重新创建Job
            if (scheduler.checkExists(getJobKey(taskId, taskGroup))) {
                scheduler.deleteJob(getJobKey(taskId, taskGroup));
            }
            scheduler.scheduleJob(jobDetail, trigger);
            // 根据任务状态暂停任务
            if (task.getStatus().equals(TaskStatusEnum.PAUSE.getStatus())) {
                scheduler.pauseJob(ScheduleUtils.getJobKey(taskId, taskGroup));
            }
        } catch (ServiceException | SchedulerException e) {
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * 设置定时任务策略
     */
    public static CronScheduleBuilder handleCronScheduleMisfirePolicy(Task task, CronScheduleBuilder cb) throws ServiceException {
        return switch (task.getMisfirePolicy()) {
            // 默认,当Trigger错过触发时间时，不触发Job执行，等待下一个指定时间点再执行
            case ScheduleConstant.MISFIRE_DEFAULT -> cb;
            // 当Trigger错过触发时间时，忽略错过的时间点，等待下一个指定时间点再执行
            case ScheduleConstant.MISFIRE_IGNORE_MISFIRES -> cb.withMisfireHandlingInstructionIgnoreMisfires();
            // 当Trigger错过触发时间时，立即触发Job执行，并且不考虑错过的时间
            case ScheduleConstant.MISFIRE_FIRE_AND_PROCEED -> cb.withMisfireHandlingInstructionFireAndProceed();
            // 当Trigger错过触发时间时，不触发Job执行，等待下一个指定时间点再执行
            case ScheduleConstant.MISFIRE_DO_NOTHING -> cb.withMisfireHandlingInstructionDoNothing();
            default -> throw new ServiceException("任务策略出错, ['" + task.getMisfirePolicy()
                    + "'] 不能用于cron调度任务");
        };
    }
}
