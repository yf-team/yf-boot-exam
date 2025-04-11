package com.yf.mudules.exam.repo.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yf.boot.base.api.api.dto.PagingReqDTO;
import com.yf.boot.base.api.utils.BeanMapper;
import com.yf.mudules.exam.repo.dto.RepoDTO;
import com.yf.mudules.exam.repo.entity.Repo;
import com.yf.mudules.exam.repo.mapper.RepoMapper;
import com.yf.mudules.exam.repo.service.RepoService;
import org.springframework.stereotype.Service;
import java.util.Map;

import java.util.List;

/**
* <p>
* 题库业务实现类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@Service
public class RepoServiceImpl extends ServiceImpl<RepoMapper, Repo> implements RepoService {

    @Override
    public IPage<RepoDTO> paging(PagingReqDTO<RepoDTO> reqDTO) {

        //查询条件
        QueryWrapper<Repo> wrapper = new QueryWrapper<>();

        // 请求参数
        RepoDTO params = reqDTO.getParams();

        //获得数据
        IPage<Repo> page = this.page(reqDTO.toPage(), wrapper);
        //转换结果
        IPage<RepoDTO> pageData = JSON.parseObject(JSON.toJSONString(page), new TypeReference<Page<RepoDTO>>(){});
        return pageData;
    }


    @Override
    public void save(RepoDTO reqDTO){
        //复制参数
        Repo entity = new Repo();
        BeanMapper.copy(reqDTO, entity);
        this.saveOrUpdate(entity);
    }

    @Override
    public void delete(List<String> ids){
        //批量删除
        this.removeByIds(ids);
    }

    @Override
    public RepoDTO detail(String id){
        Repo entity = this.getById(id);
        RepoDTO dto = new RepoDTO();
        BeanMapper.copy(entity, dto);
        return dto;
    }

    @Override
    public List<RepoDTO> list(RepoDTO reqDTO){

        //分页查询并转换
        QueryWrapper<Repo> wrapper = new QueryWrapper<>();

        //转换并返回
        List<Repo> list = this.list(wrapper);

        //转换数据
        List<RepoDTO> dtoList = BeanMapper.mapList(list, RepoDTO.class);

        return dtoList;
    }
}
