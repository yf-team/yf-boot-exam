package com.yf.modules.exam.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.modules.exam.exam.dto.ExamRuleDTO;
import com.yf.modules.exam.exam.entity.ExamRule;

import java.util.List;

/**
 * <p>
 * 考试规则业务接口类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:29
 */
public interface ExamRuleService extends IService<ExamRule> {

    /**
     * 保存全部规则列表
     * @param examId
     * @param repoId
     * @param ruleList
     */
    void saveAll(String examId, String repoId, List<ExamRuleDTO> ruleList);

    /**
     * 根据考试查找规则列表
     *
     * @param examId
     * @return
     */
    List<ExamRuleDTO> listByExam(String examId);

    /**
     * 根据考试删除规则
     * @param examIds
     */
    void deleteByExams(List<String> examIds);
}
