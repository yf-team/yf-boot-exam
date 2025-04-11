package com.yf.modules.exam.repo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yf.base.utils.AbcTags;
import com.yf.base.utils.BeanMapper;
import com.yf.modules.exam.repo.dto.RepoQuAnswerDTO;
import com.yf.modules.exam.repo.entity.RepoQuAnswer;
import com.yf.modules.exam.repo.mapper.RepoQuAnswerMapper;
import com.yf.modules.exam.repo.service.RepoQuAnswerService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
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


    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveAll(String quId, List<RepoQuAnswerDTO> dtoList) {

        //最终要保存的列表
        List<RepoQuAnswer> saveList = new ArrayList<>();

        //已存在的标签列表
        List<String> ids = this.findExistsList(quId);

        if(!CollectionUtils.isEmpty(dtoList)){

            int i = 0;

            for(RepoQuAnswerDTO item: dtoList){

                //标签ID
                String id = item.getId();
                RepoQuAnswer answer = new RepoQuAnswer();
                BeanMapper.copy(item, answer);
                answer.setQuId(quId);
                if(StringUtils.isBlank(answer.getTag())) {
                    answer.setTag(AbcTags.get(i));
                }

                //补全ID避免新增
                ids.remove(id);
                i++;
                saveList.add(answer);
            }

            //保存标签列表
            this.saveOrUpdateBatch(saveList);

            //删除已移除
            if(!ids.isEmpty()){
                this.removeByIds(ids);
            }
        }else{

            QueryWrapper<RepoQuAnswer> wrapper = new QueryWrapper<>();
            wrapper.lambda().eq(RepoQuAnswer::getQuId, quId);
            this.remove(wrapper);
        }

    }

    @Override
    public List<RepoQuAnswerDTO> listByQuId(String quId) {
        QueryWrapper<RepoQuAnswer> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(RepoQuAnswer::getQuId, quId);
        List<RepoQuAnswer> list = this.list(wrapper);

        if (!CollectionUtils.isEmpty(list)) {
           return BeanMapper.mapList(list, RepoQuAnswerDTO.class);
        }

        return List.of();
    }

    /**
     * 查找已存在的列表
     * @param quId
     * @return
     */
    private List<String> findExistsList(String quId) {
        //返回结果
        List<String> ids = new ArrayList<>();

        QueryWrapper<RepoQuAnswer> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(RepoQuAnswer::getQuId, quId);
        List<RepoQuAnswer> list = this.list(wrapper);

        if (!CollectionUtils.isEmpty(list)) {
            for (RepoQuAnswer item : list) {
                ids.add(item.getId());
            }
        }
        return ids;
    }
}
