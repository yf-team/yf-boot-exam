package com.yf.modules.exam.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.core.type.TypeReference;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.base.utils.BeanMapper;
import com.yf.base.utils.jackson.JsonHelper;
import com.yf.modules.exam.exam.dto.ExamDTO;
import com.yf.modules.exam.exam.dto.ExamRuleDTO;
import com.yf.modules.exam.exam.dto.response.ExamDetailDTO;
import com.yf.modules.exam.exam.entity.Exam;
import com.yf.modules.exam.exam.mapper.ExamMapper;
import com.yf.modules.exam.exam.service.ExamRuleService;
import com.yf.modules.exam.exam.service.ExamService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
* <p>
* 课程业务实现类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-14 17:29
*/
@RequiredArgsConstructor
@Service
public class ExamServiceImpl extends ServiceImpl<ExamMapper, Exam> implements ExamService {

    private final ExamRuleService examRuleService;

    @Override
    public IPage<ExamDTO> paging(PagingReqDTO<ExamDTO> reqDTO) {

        //查询条件
        QueryWrapper<Exam> wrapper = new QueryWrapper<>();

        // 请求参数
        ExamDTO params = reqDTO.getParams();

        //获得数据
        IPage<Exam> page = this.page(reqDTO.toPage(), wrapper);
        //转换结果
        IPage<ExamDTO> pageData = JsonHelper.parseObject(page, new TypeReference<Page<ExamDTO>>(){});
        return pageData;
    }


    @Transactional(rollbackFor = Exception.class)
    @Override
    public void save(ExamDetailDTO reqDTO){
        // 保存基本信息
        Exam entity = new Exam();
        BeanMapper.copy(reqDTO, entity);
        this.saveOrUpdate(entity);

        // 保存规则
        examRuleService.saveAll(entity.getId(), entity.getRepoId(), reqDTO.getRuleList());
    }

    @Override
    public void delete(List<String> ids){
        //批量删除
        this.removeByIds(ids);

        // 移除规则
        examRuleService.deleteByExams(ids);
    }

    @Override
    public ExamDetailDTO detail(String id){
        // 基本信息
        Exam entity = this.getById(id);
        ExamDetailDTO dto = new ExamDetailDTO();
        BeanMapper.copy(entity, dto);

        // 组卷规则
        List<ExamRuleDTO> ruleList = examRuleService.listByExam(id);
        dto.setRuleList(ruleList);
        return dto;
    }
}
