package com.yf.modules.exam.jobs;

import com.yf.ability.task.service.JobService;
import com.yf.modules.exam.paper.service.PaperService;
import lombok.extern.log4j.Log4j2;
import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 考试时间到了以后，截止考试并执行相关任务
 * @author van
 */
@Log4j2
@Component
public class HandPaperJob implements Job {

    @Autowired
    private PaperService paperService;

    @Autowired
    private JobService jobService;


    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {


        JobDetail detail = jobExecutionContext.getJobDetail();
        String name = detail.getKey().getName();
        String group = detail.getKey().getGroup();
        String data = String.valueOf(detail.getJobDataMap().get(JobService.TASK_DATA));

        log.info("++++++++++定时任务：到期自动交卷任务");
        log.info("++++++++++jobName:{}", name);
        log.info("++++++++++jobGroup:{}", group);
        log.info("++++++++++taskData:{}", data);

        // data即为paperId
        paperService.handPaper(data);
    }
}
