package com.yf.modules.exam.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yf.base.utils.BeanMapper;
import com.yf.modules.exam.exam.dto.ExamRuleDTO;
import com.yf.modules.exam.exam.entity.ExamRule;
import com.yf.modules.exam.exam.mapper.ExamRuleMapper;
import com.yf.modules.exam.exam.service.ExamRuleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 考试规则业务实现类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:29
 */
@Service
public class ExamRuleServiceImpl extends ServiceImpl<ExamRuleMapper, ExamRule> implements ExamRuleService {


    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveAll(String examId, String repoId, List<ExamRuleDTO> ruleList) {

        //分页查询并转换
        QueryWrapper<ExamRule> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(ExamRule::getExamId, examId);
        this.remove(wrapper);

        if (CollectionUtils.isEmpty(ruleList)) {
            return;
        }

        List<ExamRule> examRules = new ArrayList<>();
        for (ExamRuleDTO dto : ruleList) {
            ExamRule rule = new ExamRule();
            rule.setExamId(examId);
            rule.setRepoId(repoId);
            rule.setQuScore(dto.getQuScore());
            rule.setQuCount(dto.getQuCount());
            rule.setQuType(dto.getQuType());
            examRules.add(rule);
        }

        this.saveBatch(examRules);

    }

    @Override
    public List<ExamRuleDTO> listByExam(String examId) {

        //分页查询并转换
        QueryWrapper<ExamRule> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(ExamRule::getExamId, examId);

        //转换并返回
        List<ExamRule> list = this.list(wrapper);
        if (CollectionUtils.isEmpty(list)) {
            return List.of();
        }

        //转换数据
        return BeanMapper.mapList(list, ExamRuleDTO.class);
    }

    @Override
    public void deleteByExams(List<String> examIds) {
        //分页查询并转换
        QueryWrapper<ExamRule> wrapper = new QueryWrapper<>();
        wrapper.lambda().in(ExamRule::getExamId, examIds);
        this.remove(wrapper);
    }
}
