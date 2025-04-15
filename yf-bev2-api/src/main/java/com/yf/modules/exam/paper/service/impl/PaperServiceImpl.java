package com.yf.modules.exam.paper.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.core.type.TypeReference;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.base.utils.BeanMapper;
import com.yf.base.utils.jackson.JsonHelper;
import com.yf.modules.exam.paper.dto.PaperDTO;
import com.yf.modules.exam.paper.entity.Paper;
import com.yf.modules.exam.paper.mapper.PaperMapper;
import com.yf.modules.exam.paper.service.PaperService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* <p>
* 试卷业务实现类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-14 17:40
*/
@Service
public class  PaperServiceImpl extends ServiceImpl<PaperMapper, Paper> implements PaperService {

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
}
