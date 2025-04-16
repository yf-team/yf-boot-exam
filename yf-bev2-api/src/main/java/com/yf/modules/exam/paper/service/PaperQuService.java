package com.yf.modules.exam.paper.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.modules.exam.paper.dto.PaperQuDTO;
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
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<PaperQuDTO> paging(PagingReqDTO<PaperQuDTO> reqDTO);

    /**
    * 添加或保存
    * @param reqDTO
    * @return
    */
    void save(PaperQuDTO reqDTO);

    /**
    * 批量删除
    * @param ids
    * @return
    */
    void delete(List<String> ids);

    /**
    * 查找详情
    * @param id
    * @return
    */
    PaperQuDTO detail(String id);

    /**
    * 查找列表
    * @param reqDTO
    * @return
    */
    List<PaperQuDTO> list(PaperQuDTO reqDTO);

    /**
     * 保存试卷题目，用于考试
     * @param paperId
     * @param perScore 每题的分数
     * @param quList 试题列表
     */
    void saveToPaper(String paperId, BigDecimal perScore, List<RepoQuDetailDTO> quList);
}
