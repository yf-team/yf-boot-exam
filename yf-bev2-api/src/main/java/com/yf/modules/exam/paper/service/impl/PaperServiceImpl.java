package com.yf.modules.exam.paper.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.core.type.TypeReference;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.base.api.exception.ServiceException;
import com.yf.base.utils.BeanMapper;
import com.yf.base.utils.DecimalUtils;
import com.yf.base.utils.jackson.JsonHelper;
import com.yf.modules.exam.exam.dto.ExamRuleDTO;
import com.yf.modules.exam.exam.entity.Exam;
import com.yf.modules.exam.exam.service.ExamRecordService;
import com.yf.modules.exam.exam.service.ExamRuleService;
import com.yf.modules.exam.exam.service.ExamService;
import com.yf.modules.exam.paper.dto.PaperDTO;
import com.yf.modules.exam.paper.entity.Paper;
import com.yf.modules.exam.paper.mapper.PaperMapper;
import com.yf.modules.exam.paper.service.PaperQuService;
import com.yf.modules.exam.paper.service.PaperService;
import com.yf.modules.exam.repo.dto.request.RepoQuDetailDTO;
import com.yf.modules.exam.repo.service.RepoQuService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
* <p>
* 试卷业务实现类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-14 17:40
*/
@RequiredArgsConstructor
@Service
public class  PaperServiceImpl extends ServiceImpl<PaperMapper, Paper> implements PaperService {

    private final ExamService examService;
    private final ExamRuleService examRuleService;
    private final RepoQuService repoQuService;
    private final PaperQuService paperQuService;
    private final ExamRecordService examRecordService;

    @Override
    public IPage<PaperDTO> paging(PagingReqDTO<PaperDTO> reqDTO) {

        //查询条件
        QueryWrapper<Paper> wrapper = new QueryWrapper<>();

        // 请求参数
        PaperDTO params = reqDTO.getParams();

        //获得数据
        IPage<Paper> page = this.page(reqDTO.toPage(), wrapper);
        //转换结果
        IPage<PaperDTO> pageData = JsonHelper.parseObject(page, new TypeReference<Page<PaperDTO>>(){});
        return pageData;
    }


    @Override
    public void save(PaperDTO reqDTO){
        //复制参数
        Paper entity = new Paper();
        BeanMapper.copy(reqDTO, entity);
        this.saveOrUpdate(entity);
    }

    @Override
    public void delete(List<String> ids){
        //批量删除
        this.removeByIds(ids);
    }

    @Override
    public PaperDTO detail(String id){
        Paper entity = this.getById(id);
        PaperDTO dto = new PaperDTO();
        BeanMapper.copy(entity, dto);
        return dto;
    }

    @Override
    public List<PaperDTO> list(PaperDTO reqDTO){

        //分页查询并转换
        QueryWrapper<Paper> wrapper = new QueryWrapper<>();

        //转换并返回
        List<Paper> list = this.list(wrapper);

        //转换数据
        List<PaperDTO> dtoList = BeanMapper.mapList(list, PaperDTO.class);

        return dtoList;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String createPaper(String examId, String userId) {

        // 做基础校验
        Exam exam = examService.getById(examId);

        // 复制数据
        Paper paper = new Paper();
        paper.setTitle(exam.getTitle());
        paper.setExamId(examId);
        paper.setUserId(userId);
        paper.setTotalScore(exam.getTotalScore());
        paper.setQualifyScore(exam.getQualifyScore());
        paper.setUserScore(DecimalUtils.zero());
        paper.setUserTime(0);

        // 计算交卷时间
        Integer totalTime = exam.getTotalTime();
        if (totalTime != null && totalTime > 0) {
            Calendar cl = Calendar.getInstance();
            cl.setTimeInMillis(System.currentTimeMillis());
            cl.add(Calendar.MINUTE, totalTime);
            Date limitTime = cl.getTime();

            // 整个考试的时间
            if (limitTime.before(exam.getEndTime())) {
                paper.setLimitTime(limitTime);
            }else{
                paper.setLimitTime(exam.getEndTime());
            }

        }else{
            paper.setLimitTime(exam.getEndTime());
        }

        // 增加定时任务
        this.save(paper);

        // 构建随机题目
        List<ExamRuleDTO> ruleList = examRuleService.listByExam(examId);

        if(CollectionUtils.isEmpty(ruleList)){
            throw new ServiceException("考试进入失败，没有组卷规则！");
        }

        // 循环保存
        for (ExamRuleDTO rule : ruleList) {
            // 未抽题的
            if(rule.getQuCount()==null || rule.getQuCount()==0){
                continue;
            }
            List<RepoQuDetailDTO> quList = repoQuService.listForPaper(rule.getRepoId(), rule.getQuType(), rule.getQuCount());
            paperQuService.saveToPaper(paper.getId(), rule.getQuScore(), quList);
        }

        return paper.getId();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void handPaper(String paperId) {

        Paper paper = this.getById(paperId);

        if(paper == null){
            throw new ServiceException("试卷不存在或已被删除！");
        }

        if(paper.getHandState().equals(1)){
            return;
        }

        // 统计分数
        BigDecimal userScore = paperQuService.sumTotalScore(paperId);
        paper.setUserScore(userScore);
        paper.setHandState(1);
        paper.setHandTime(new Date());
        // 考试用时
        long useTime = (System.currentTimeMillis() - paper.getCreateTime().getTime()) / 1000 / 60;
        paper.setUserTime((int) useTime);

        // 是否合格
        boolean passed = DecimalUtils.ge(userScore, paper.getQualifyScore());
        paper.setPassed(passed);
        this.updateById(paper);

        // 汇总表
        examRecordService.joinRecord(paper.getExamId(), paper.getUserId(), paperId, userScore, passed);

    }
}
