package com.yf.mudules.exam.repo.service;

import com.yf.mudules.exam.repo.entity.RepoQuAnswer;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.boot.base.api.api.dto.PagingReqDTO;
import com.yf.mudules.exam.repo.dto.RepoQuAnswerDTO;

import java.util.List;

/**
* <p>
* 候选答案业务接口类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
public interface RepoQuAnswerService extends IService<RepoQuAnswer> {

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<RepoQuAnswerDTO> paging(PagingReqDTO<RepoQuAnswerDTO> reqDTO);

    /**
    * 添加或保存
    * @param reqDTO
    * @return
    */
    void save(RepoQuAnswerDTO reqDTO);

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
    RepoQuAnswerDTO detail(String id);

    /**
    * 查找列表
    * @param reqDTO
    * @return
    */
    List<RepoQuAnswerDTO> list(RepoQuAnswerDTO reqDTO);
}
