package com.yf.ability.task.service.impl;

import com.yf.ability.task.service.JobService;
import com.yf.base.utils.CronUtils;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.quartz.*;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Random;

/**
 * @author bool
 */
@Log4j2
@Service
@RequiredArgsConstructor
public class JobServiceImpl implements JobService {

    /**
     * Quartz定时任务核心的功能实现类
     */
    private Scheduler scheduler;
    /**
     * Quartz 工厂类
     */
    private final SchedulerFactoryBean schedulerFactoryBean;


    @PostConstruct
    public void init() {
        this.scheduler = schedulerFactoryBean.getScheduler();
    }


    @Override
    public void addCronJob(Class<? extends Job> jobClass, String jobName, String jobGroup, String cron, String data) {
        try {
            JobKey jobKey = JobKey.jobKey(jobName, jobGroup);
            JobDetail jobDetail = scheduler.getJobDetail(jobKey);
            if (jobDetail != null) {
                log.info("++++++++++任务：{} 已存在", jobName);
                this.deleteJob(jobName, jobGroup);
            }

            log.info("++++++++++构建任务：{},{},{},{},{} ", jobClass.toString(), jobName, jobGroup, cron, data);

            //构建job信息
            jobDetail = JobBuilder.newJob(jobClass).withIdentity(jobName, jobGroup).build();
            //用JopDataMap来传递数据
            jobDetail.getJobDataMap().put(TASK_DATA, data);

            //表达式调度构建器(即任务执行的时间,每5秒执行一次)
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(cron);

            //按新的cronExpression表达式构建一个新的trigger
            CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(jobName, jobGroup).withSchedule(scheduleBuilder).build();
            scheduler.scheduleJob(jobDetail, trigger);

        } catch (Exception e) {
            log.error(e);
        }
    }

    @Override
    public void addCronJob(Class<? extends Job> jobClass, String jobName, String jobGroup, String data) {

        // 随机3-8秒后执行
        Calendar cl = Calendar.getInstance();
        cl.setTimeInMillis(System.currentTimeMillis());
        cl.add(Calendar.SECOND, 3 + new Random().nextInt(5));

        this.addCronJob(jobClass, jobName, jobGroup, CronUtils.dateToCron(cl.getTime()), data);
    }


    @Override
    public void pauseJob(String jobName, String jobGroup) {
        try {
            TriggerKey triggerKey = TriggerKey.triggerKey(jobName, jobGroup);
            scheduler.pauseTrigger(triggerKey);
            log.info("++++++++++暂停任务：{}", jobName);
        } catch (SchedulerException e) {
           log.error(e);
        }
    }

    @Override
    public void resumeJob(String jobName, String jobGroup) {
        try {
            TriggerKey triggerKey = TriggerKey.triggerKey(jobName, jobGroup);
            scheduler.resumeTrigger(triggerKey);
            log.info("++++++++++重启任务：{}", jobName);
        } catch (SchedulerException e) {
            log.error(e);
        }
    }

    @Override
    public void deleteJob(String jobName, String jobGroup) {
        try {
            JobKey jobKey = JobKey.jobKey(jobName,jobGroup);
            scheduler.deleteJob(jobKey);
            log.info("++++++++++删除任务：{}", jobKey);
        } catch (SchedulerException e) {
            log.error(e);
        }
    }
}
