package com.yf.modules.exam.paper.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.modules.exam.paper.dto.response.PaperQuCardRespDTO;
import com.yf.modules.exam.paper.dto.response.PaperQuDetailDTO;
import com.yf.modules.exam.paper.dto.response.PaperQuFillRespDTO;
import com.yf.modules.exam.paper.dto.request.PaperQuFillReqDTO;
import com.yf.modules.exam.paper.entity.PaperQu;
import com.yf.modules.exam.repo.dto.request.RepoQuDetailDTO;

import java.math.BigDecimal;
import java.util.List;

/**
 * <p>
 * 试卷考题业务接口类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:40
 */
public interface PaperQuService extends IService<PaperQu> {


    /**
     * 保存试卷题目，用于考试
     *
     * @param paperId
     * @param perScore 每题的分数
     * @param quList   试题列表
     */
    void saveToPaper(String paperId, BigDecimal perScore, List<RepoQuDetailDTO> quList);

    /**
     * 查找答题卡列表，按题型进行分组
     *
     * @param paperId
     * @return
     */
    List<PaperQuCardRespDTO> listQuCard(String paperId);

    /**
     * 查找详情用于答题
     *
     * @param quId
     * @return
     */
    PaperQuDetailDTO detailForAnswer(String paperId, String quId);

    /**
     * 考试过程填充答案
     *
     * @param reqDTO
     * @return
     */
    PaperQuFillRespDTO fillAnswer(PaperQuFillReqDTO reqDTO);

    /**
     * 进行分数统计
     *
     * @param paperId
     * @return
     */
    BigDecimal sumTotalScore(String paperId);
}
