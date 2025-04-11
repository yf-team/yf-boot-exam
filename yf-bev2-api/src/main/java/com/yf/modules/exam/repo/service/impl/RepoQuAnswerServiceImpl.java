package com.yf.mudules.exam.repo.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yf.boot.base.api.api.dto.PagingReqDTO;
import com.yf.boot.base.api.utils.BeanMapper;
import com.yf.mudules.exam.repo.dto.RepoQuAnswerDTO;
import com.yf.mudules.exam.repo.entity.RepoQuAnswer;
import com.yf.mudules.exam.repo.mapper.RepoQuAnswerMapper;
import com.yf.mudules.exam.repo.service.RepoQuAnswerService;
import org.springframework.stereotype.Service;
import java.util.Map;

import java.util.List;

/**
* <p>
* 候选答案业务实现类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@Service
public class RepoQuAnswerServiceImpl extends ServiceImpl<RepoQuAnswerMapper, RepoQuAnswer> implements RepoQuAnswerService {

    @Override
    public IPage<RepoQuAnswerDTO> paging(PagingReqDTO<RepoQuAnswerDTO> reqDTO) {

        //查询条件
        QueryWrapper<RepoQuAnswer> wrapper = new QueryWrapper<>();

        // 请求参数
        RepoQuAnswerDTO params = reqDTO.getParams();

        //获得数据
        IPage<RepoQuAnswer> page = this.page(reqDTO.toPage(), wrapper);
        //转换结果
        IPage<RepoQuAnswerDTO> pageData = JSON.parseObject(JSON.toJSONString(page), new TypeReference<Page<RepoQuAnswerDTO>>(){});
        return pageData;
    }


    @Override
    public void save(RepoQuAnswerDTO reqDTO){
        //复制参数
        RepoQuAnswer entity = new RepoQuAnswer();
        BeanMapper.copy(reqDTO, entity);
        this.saveOrUpdate(entity);
    }

    @Override
    public void delete(List<String> ids){
        //批量删除
        this.removeByIds(ids);
    }

    @Override
    public RepoQuAnswerDTO detail(String id){
        RepoQuAnswer entity = this.getById(id);
        RepoQuAnswerDTO dto = new RepoQuAnswerDTO();
        BeanMapper.copy(entity, dto);
        return dto;
    }

    @Override
    public List<RepoQuAnswerDTO> list(RepoQuAnswerDTO reqDTO){

        //分页查询并转换
        QueryWrapper<RepoQuAnswer> wrapper = new QueryWrapper<>();

        //转换并返回
        List<RepoQuAnswer> list = this.list(wrapper);

        //转换数据
        List<RepoQuAnswerDTO> dtoList = BeanMapper.mapList(list, RepoQuAnswerDTO.class);

        return dtoList;
    }
}
