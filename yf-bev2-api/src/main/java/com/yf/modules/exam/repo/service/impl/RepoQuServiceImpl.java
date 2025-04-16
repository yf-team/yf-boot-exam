package com.yf.modules.exam.repo.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.core.type.TypeReference;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.base.api.exception.ServiceException;
import com.yf.base.utils.BeanMapper;
import com.yf.base.utils.jackson.JsonHelper;
import com.yf.modules.exam.repo.dto.RepoQuAnswerDTO;
import com.yf.modules.exam.repo.dto.RepoQuDTO;
import com.yf.modules.exam.repo.dto.request.RepoQuDetailDTO;
import com.yf.modules.exam.repo.entity.RepoQu;
import com.yf.modules.exam.repo.mapper.RepoQuMapper;
import com.yf.modules.exam.repo.service.RepoQuAnswerService;
import com.yf.modules.exam.repo.service.RepoQuService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.*;

/**
* <p>
* 问题题目业务实现类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@RequiredArgsConstructor
@Service
public class RepoQuServiceImpl extends ServiceImpl<RepoQuMapper, RepoQu> implements RepoQuService {


    private final RepoQuAnswerService repoQuAnswerService;

    @Override
    public IPage<RepoQuDTO> paging(PagingReqDTO<RepoQuDTO> reqDTO) {

        //查询条件
        QueryWrapper<RepoQu> wrapper = new QueryWrapper<>();

        // 请求参数
        RepoQuDTO params = reqDTO.getParams();

        if (params!=null) {
            if (StringUtils.isNotBlank(params.getContent())){
                wrapper.lambda().like(RepoQu::getContent, params.getContent());
            }
        }

        wrapper.lambda().orderByDesc(RepoQu::getCreateTime);

        //获得数据
        IPage<RepoQu> page = this.page(reqDTO.toPage(), wrapper);
        return JsonHelper.parseObject(page, new TypeReference<Page<RepoQuDTO>>(){});
    }


    @Transactional(rollbackFor = Exception.class)
    @Override
    public void save(RepoQuDetailDTO reqDTO){
        //复制参数
        RepoQu entity = new RepoQu();
        BeanMapper.copy(reqDTO, entity);
        this.saveOrUpdate(entity);

        // 保存选项
        repoQuAnswerService.saveAll(entity.getId(), reqDTO.getAnswerList());
    }

    @Override
    public void delete(List<String> ids){
        //批量删除
        this.removeByIds(ids);
    }

    @Override
    public RepoQuDetailDTO detail(String id){
        // 基本信息
        RepoQu entity = this.getById(id);
        RepoQuDetailDTO dto = new RepoQuDetailDTO();
        BeanMapper.copy(entity, dto);

        List<RepoQuAnswerDTO> answerList = repoQuAnswerService.listByQuId(id);
        dto.setAnswerList(answerList);
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

    @Override
    public List<RepoQuDetailDTO> listForPaper(String repoId, String quType, Integer quCount) {

        Map<String,List<String>> map = this.typeQuIds(repoId);
        if (!map.containsKey(quType)) {
            throw new ServiceException("组卷失败，题型"+quType+"没有试题！");
        }

        List<String> ids = map.get(quType);
        if (ids.size() < quCount ) {
            throw new ServiceException("组卷失败，题型"+quType+"试题不足！");
        }

        // 随机排序
        Collections.shuffle(ids);

        // 逐个构建详情，注意效率问题
        List<RepoQuDetailDTO> resultList = new ArrayList<>();
        ids.subList(0, quCount).forEach(id-> resultList.add(this.detail(id)));

        return resultList;
    }


    /**
     * 把题库的全部ID找出来，组成一个题型--IDS列表的MAP
     * @param repoId
     * @return
     */
    private Map<String,List<String>> typeQuIds(String repoId){
        Map<String,List<String>> map = new HashMap<>();

        //分页查询并转换
        QueryWrapper<RepoQu> wrapper = new QueryWrapper<>();
        wrapper.lambda()
                .select(RepoQu::getId, RepoQu::getQuType)
                .eq(RepoQu::getRepoId, repoId);

        List<RepoQu> list = this.list(wrapper);
        if(CollectionUtils.isEmpty(list)){
            return map;
        }

        for(RepoQu repoQu : list){
            if(map.containsKey(repoQu.getQuType())){
                map.get(repoQu.getQuType()).add(repoQu.getId());
            }else {
                List<String> ids = new ArrayList<>();
                ids.add(repoQu.getId());
                map.put(repoQu.getQuType(), ids);
            }
        }

        return map;
    }
}
