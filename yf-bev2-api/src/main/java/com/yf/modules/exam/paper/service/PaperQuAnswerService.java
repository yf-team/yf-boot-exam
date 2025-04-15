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
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<PaperQuAnswerDTO> paging(PagingReqDTO<PaperQuAnswerDTO> reqDTO);

    /**
    * 添加或保存
    * @param reqDTO
    * @return
    */
    void save(PaperQuAnswerDTO reqDTO);

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
    PaperQuAnswerDTO detail(String id);

    /**
    * 查找列表
    * @param reqDTO
    * @return
    */
    List<PaperQuAnswerDTO> list(PaperQuAnswerDTO reqDTO);
}
