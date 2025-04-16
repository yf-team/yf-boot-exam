package com.yf.modules.exam.paper.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.core.type.TypeReference;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.base.utils.AbcTags;
import com.yf.base.utils.BeanMapper;
import com.yf.base.utils.DecimalUtils;
import com.yf.base.utils.jackson.JsonHelper;
import com.yf.modules.exam.paper.dto.PaperQuDTO;
import com.yf.modules.exam.paper.entity.PaperQu;
import com.yf.modules.exam.paper.entity.PaperQuAnswer;
import com.yf.modules.exam.paper.mapper.PaperQuMapper;
import com.yf.modules.exam.paper.service.PaperQuAnswerService;
import com.yf.modules.exam.paper.service.PaperQuService;
import com.yf.modules.exam.repo.dto.RepoQuAnswerDTO;
import com.yf.modules.exam.repo.dto.request.RepoQuDetailDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
* <p>
* 试卷考题业务实现类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-14 17:40
*/
@RequiredArgsConstructor
@Service
public class PaperQuServiceImpl extends ServiceImpl<PaperQuMapper, PaperQu> implements PaperQuService {

    private final PaperQuAnswerService paperQuAnswerService;

    @Override
    public IPage<PaperQuDTO> paging(PagingReqDTO<PaperQuDTO> reqDTO) {

        //查询条件
        QueryWrapper<PaperQu> wrapper = new QueryWrapper<>();

        // 请求参数
        PaperQuDTO params = reqDTO.getParams();

        //获得数据
        IPage<PaperQu> page = this.page(reqDTO.toPage(), wrapper);
        //转换结果
        IPage<PaperQuDTO> pageData = JsonHelper.parseObject(page, new TypeReference<Page<PaperQuDTO>>(){});
        return pageData;
    }


    @Override
    public void save(PaperQuDTO reqDTO){
        //复制参数
        PaperQu entity = new PaperQu();
        BeanMapper.copy(reqDTO, entity);
        this.saveOrUpdate(entity);
    }

    @Override
    public void delete(List<String> ids){
        //批量删除
        this.removeByIds(ids);
    }

    @Override
    public PaperQuDTO detail(String id){
        PaperQu entity = this.getById(id);
        PaperQuDTO dto = new PaperQuDTO();
        BeanMapper.copy(entity, dto);
        return dto;
    }

    @Override
    public List<PaperQuDTO> list(PaperQuDTO reqDTO){

        //分页查询并转换
        QueryWrapper<PaperQu> wrapper = new QueryWrapper<>();

        //转换并返回
        List<PaperQu> list = this.list(wrapper);

        //转换数据
        List<PaperQuDTO> dtoList = BeanMapper.mapList(list, PaperQuDTO.class);

        return dtoList;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveToPaper(String paperId, BigDecimal perScore, List<RepoQuDetailDTO> quList) {

        List<PaperQu> paperQuList = new ArrayList<>();
        List<PaperQuAnswer> answerList = new ArrayList<>();

        for (RepoQuDetailDTO dto : quList) {
            PaperQu entity = new PaperQu();
            entity.setPaperId(paperId);
            entity.setQuType(dto.getQuType());
            entity.setActualScore(DecimalUtils.zero());
            entity.setScore(perScore);
            entity.setQuId(dto.getId());
            entity.setAnswered(false);
            paperQuList.add(entity);

            List<RepoQuAnswerDTO> answers = dto.getAnswerList();

            int i = 0;
            for (RepoQuAnswerDTO answer : answers) {
                PaperQuAnswer ae = new PaperQuAnswer();
                ae.setPaperId(paperId);
                ae.setQuId(dto.getId());
                ae.setAnswerId(answer.getId());
                ae.setChecked(false);
                ae.setIsRight(false);
                ae.setAbc(AbcTags.get(i));
                ae.setSort(i);
                answerList.add(ae);
                i++;
            }
        }

        // 保存题目
        saveBatch(paperQuList);

        // 保存选项
        paperQuAnswerService.saveBatch(answerList);

    }
}
