package com.yf.mudules.exam.repo.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yf.boot.base.api.api.dto.PagingReqDTO;
import com.yf.boot.base.api.utils.BeanMapper;
import com.yf.mudules.exam.repo.dto.RepoQuDTO;
import com.yf.mudules.exam.repo.entity.RepoQu;
import com.yf.mudules.exam.repo.mapper.RepoQuMapper;
import com.yf.mudules.exam.repo.service.RepoQuService;
import org.springframework.stereotype.Service;
import java.util.Map;

import java.util.List;

/**
* <p>
* 问题题目业务实现类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@Service
public class RepoQuServiceImpl extends ServiceImpl<RepoQuMapper, RepoQu> implements RepoQuService {

    @Override
    public IPage<RepoQuDTO> paging(PagingReqDTO<RepoQuDTO> reqDTO) {

        //查询条件
        QueryWrapper<RepoQu> wrapper = new QueryWrapper<>();

        // 请求参数
        RepoQuDTO params = reqDTO.getParams();

        //获得数据
        IPage<RepoQu> page = this.page(reqDTO.toPage(), wrapper);
        //转换结果
        IPage<RepoQuDTO> pageData = JSON.parseObject(JSON.toJSONString(page), new TypeReference<Page<RepoQuDTO>>(){});
        return pageData;
    }


    @Override
    public void save(RepoQuDTO reqDTO){
        //复制参数
        RepoQu entity = new RepoQu();
        BeanMapper.copy(reqDTO, entity);
        this.saveOrUpdate(entity);
    }

    @Override
    public void delete(List<String> ids){
        //批量删除
        this.removeByIds(ids);
    }

    @Override
    public RepoQuDTO detail(String id){
        RepoQu entity = this.getById(id);
        RepoQuDTO dto = new RepoQuDTO();
        BeanMapper.copy(entity, dto);
        return dto;
    }

    @Override
    public List<RepoQuDTO> list(RepoQuDTO reqDTO){

        //分页查询并转换
        QueryWrapper<RepoQu> wrapper = new QueryWrapper<>();

        //转换并返回
        List<RepoQu> list = this.list(wrapper);

        //转换数据
        List<RepoQuDTO> dtoList = BeanMapper.mapList(list, RepoQuDTO.class);

        return dtoList;
    }
}
