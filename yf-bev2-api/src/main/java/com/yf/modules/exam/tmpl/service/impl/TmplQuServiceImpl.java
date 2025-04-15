package com.yf.modules.exam.tmpl.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.core.type.TypeReference;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.base.utils.BeanMapper;
import com.yf.base.utils.jackson.JsonHelper;
import com.yf.modules.exam.tmpl.dto.TmplQuDTO;
import com.yf.modules.exam.tmpl.entity.TmplQu;
import com.yf.modules.exam.tmpl.mapper.TmplQuMapper;
import com.yf.modules.exam.tmpl.service.TmplQuService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* <p>
* 试卷题目业务实现类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-15 10:41
*/
@Service
public class TmplQuServiceImpl extends ServiceImpl<TmplQuMapper, TmplQu> implements TmplQuService {

    @Override
    public IPage<TmplQuDTO> paging(PagingReqDTO<TmplQuDTO> reqDTO) {

        //查询条件
        QueryWrapper<TmplQu> wrapper = new QueryWrapper<>();

        // 请求参数
        TmplQuDTO params = reqDTO.getParams();

        //获得数据
        IPage<TmplQu> page = this.page(reqDTO.toPage(), wrapper);
        //转换结果
        IPage<TmplQuDTO> pageData = JsonHelper.parseObject(page, new TypeReference<Page<TmplQuDTO>>(){});
        return pageData;
    }


    @Override
    public void save(TmplQuDTO reqDTO){
        //复制参数
        TmplQu entity = new TmplQu();
        BeanMapper.copy(reqDTO, entity);
        this.saveOrUpdate(entity);
    }

    @Override
    public void delete(List<String> ids){
        //批量删除
        this.removeByIds(ids);
    }

    @Override
    public TmplQuDTO detail(String id){
        TmplQu entity = this.getById(id);
        TmplQuDTO dto = new TmplQuDTO();
        BeanMapper.copy(entity, dto);
        return dto;
    }
}
