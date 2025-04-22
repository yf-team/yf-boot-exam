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


    /**
     * 根据试卷和ID查找选项列表，用于判题
     *
     * @param paperId
     * @param quId
     * @return
     */
    @Override
    public List<PaperQuAnswer> listForAnswer(String paperId, String quId) {

        QueryWrapper<PaperQuAnswer> wrapper = new QueryWrapper<>();
        wrapper.lambda()
                .eq(PaperQuAnswer::getPaperId, paperId)
                .eq(PaperQuAnswer::getQuId, quId);

        return this.list(wrapper);
    }
}
