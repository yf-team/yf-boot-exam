package com.yf.modules.exam.paper.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.modules.exam.paper.dto.PaperQuAnswerDTO;
import com.yf.modules.exam.paper.entity.PaperQuAnswer;

import java.util.List;

/**
* <p>
* 试卷考题备选答案业务接口类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-14 17:40
*/
public interface PaperQuAnswerService extends IService<PaperQuAnswer> {


    /**
     * 根据试卷和ID查找选项列表，用于判题
     * @param paperId
     * @param quId
     * @return
     */
    List<PaperQuAnswer> listForAnswer(String paperId, String quId);

}
