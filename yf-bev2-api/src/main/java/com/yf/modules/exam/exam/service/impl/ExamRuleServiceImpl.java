package com.yf.modules.exam.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.core.type.TypeReference;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.base.utils.BeanMapper;
import com.yf.base.utils.jackson.JsonHelper;
import com.yf.modules.exam.exam.dto.ExamRuleDTO;
import com.yf.modules.exam.exam.entity.ExamRule;
import com.yf.modules.exam.exam.mapper.ExamRuleMapper;
import com.yf.modules.exam.exam.service.ExamRuleService;
import org.springframework.stereotype.Service;

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

    @Override
    public IPage<ExamRuleDTO> paging(PagingReqDTO<ExamRuleDTO> reqDTO) {

        //查询条件
        QueryWrapper<ExamRule> wrapper = new QueryWrapper<>();

        // 请求参数
        ExamRuleDTO params = reqDTO.getParams();

        //获得数据
        IPage<ExamRule> page = this.page(reqDTO.toPage(), wrapper);
        //转换结果
        IPage<ExamRuleDTO> pageData = JsonHelper.parseObject(page, new TypeReference<Page<ExamRuleDTO>>(){});
        return pageData;
    }


    @Override
    public void save(ExamRuleDTO reqDTO){
        //复制参数
        ExamRule entity = new ExamRule();
        BeanMapper.copy(reqDTO, entity);
        this.saveOrUpdate(entity);
    }

    @Override
    public void delete(List<String> ids){
        //批量删除
        this.removeByIds(ids);
    }

    @Override
    public ExamRuleDTO detail(String id){
        ExamRule entity = this.getById(id);
        ExamRuleDTO dto = new ExamRuleDTO();
        BeanMapper.copy(entity, dto);
        return dto;
    }

    @Override
    public List<ExamRuleDTO> list(ExamRuleDTO reqDTO){

        //分页查询并转换
        QueryWrapper<ExamRule> wrapper = new QueryWrapper<>();

        //转换并返回
        List<ExamRule> list = this.list(wrapper);

        //转换数据
        List<ExamRuleDTO> dtoList = BeanMapper.mapList(list, ExamRuleDTO.class);

        return dtoList;
    }
}
