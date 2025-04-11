package com.yf.modules.exam.repo.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.modules.exam.repo.dto.RepoQuDTO;
import com.yf.modules.exam.repo.dto.request.RepoQuReqDTO;
import com.yf.modules.exam.repo.entity.RepoQu;

import java.util.List;

/**
* <p>
* 问题题目业务接口类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
public interface RepoQuService extends IService<RepoQu> {

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<RepoQuDTO> paging(PagingReqDTO<RepoQuDTO> reqDTO);

    /**
    * 添加或保存
    * @param reqDTO
    * @return
    */
    void save(RepoQuReqDTO reqDTO);

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
    RepoQuReqDTO detail(String id);

    /**
    * 查找列表
    * @param reqDTO
    * @return
    */
    List<RepoQuDTO> list(RepoQuDTO reqDTO);
}
