package com.yf.modules.exam.paper.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.core.type.TypeReference;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.base.utils.BeanMapper;
import com.yf.base.utils.jackson.JsonHelper;
import com.yf.modules.exam.paper.dto.PaperQuAnswerDTO;
import com.yf.modules.exam.paper.entity.PaperQuAnswer;
import com.yf.modules.exam.paper.mapper.PaperQuAnswerMapper;
import com.yf.modules.exam.paper.service.PaperQuAnswerService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* <p>
* 试卷考题备选答案业务实现类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-14 17:40
*/
@Service
public class PaperQuAnswerServiceImpl extends ServiceImpl<PaperQuAnswerMapper, PaperQuAnswer> implements PaperQuAnswerService {

    @Override
    public IPage<PaperQuAnswerDTO> paging(PagingReqDTO<PaperQuAnswerDTO> reqDTO) {

        //查询条件
        QueryWrapper<PaperQuAnswer> wrapper = new QueryWrapper<>();

        // 请求参数
        PaperQuAnswerDTO params = reqDTO.getParams();

        //获得数据
        IPage<PaperQuAnswer> page = this.page(reqDTO.toPage(), wrapper);
        //转换结果
        IPage<PaperQuAnswerDTO> pageData = JsonHelper.parseObject(page, new TypeReference<Page<PaperQuAnswerDTO>>(){});
        return pageData;
    }


    @Override
    public void save(PaperQuAnswerDTO reqDTO){
        //复制参数
        PaperQuAnswer entity = new PaperQuAnswer();
        BeanMapper.copy(reqDTO, entity);
        this.saveOrUpdate(entity);
    }

    @Override
    public void delete(List<String> ids){
        //批量删除
        this.removeByIds(ids);
    }

    @Override
    public PaperQuAnswerDTO detail(String id){
        PaperQuAnswer entity = this.getById(id);
        PaperQuAnswerDTO dto = new PaperQuAnswerDTO();
        BeanMapper.copy(entity, dto);
        return dto;
    }

    @Override
    public List<PaperQuAnswerDTO> list(PaperQuAnswerDTO reqDTO){

        //分页查询并转换
        QueryWrapper<PaperQuAnswer> wrapper = new QueryWrapper<>();

        //转换并返回
        List<PaperQuAnswer> list = this.list(wrapper);

        //转换数据
        List<PaperQuAnswerDTO> dtoList = BeanMapper.mapList(list, PaperQuAnswerDTO.class);

        return dtoList;
    }
}
