package com.yf.modules.exam.tmpl.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.core.type.TypeReference;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.base.utils.BeanMapper;
import com.yf.base.utils.jackson.JsonHelper;
import com.yf.modules.exam.tmpl.dto.TmplDTO;
import com.yf.modules.exam.tmpl.entity.Tmpl;
import com.yf.modules.exam.tmpl.mapper.TmplMapper;
import com.yf.modules.exam.tmpl.service.TmplService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* <p>
* 试卷业务实现类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-15 10:41
*/
@Service
public class TmplServiceImpl extends ServiceImpl<TmplMapper, Tmpl> implements TmplService {

    @Override
    public IPage<TmplDTO> paging(PagingReqDTO<TmplDTO> reqDTO) {

        //查询条件
        QueryWrapper<Tmpl> wrapper = new QueryWrapper<>();

        // 请求参数
        TmplDTO params = reqDTO.getParams();

        //获得数据
        IPage<Tmpl> page = this.page(reqDTO.toPage(), wrapper);
        //转换结果
        IPage<TmplDTO> pageData = JsonHelper.parseObject(page, new TypeReference<Page<TmplDTO>>(){});
        return pageData;
    }


    @Override
    public void save(TmplDTO reqDTO){
        //复制参数
        Tmpl entity = new Tmpl();
        BeanMapper.copy(reqDTO, entity);
        this.saveOrUpdate(entity);
    }

    @Override
    public void delete(List<String> ids){
        //批量删除
        this.removeByIds(ids);
    }

    @Override
    public TmplDTO detail(String id){
        Tmpl entity = this.getById(id);
        TmplDTO dto = new TmplDTO();
        BeanMapper.copy(entity, dto);
        return dto;
    }

}
