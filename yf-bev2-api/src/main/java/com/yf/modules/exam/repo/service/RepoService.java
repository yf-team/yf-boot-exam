package com.yf.mudules.exam.repo.service;

import com.yf.mudules.exam.repo.entity.Repo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.boot.base.api.api.dto.PagingReqDTO;
import com.yf.mudules.exam.repo.dto.RepoDTO;

import java.util.List;

/**
* <p>
* 题库业务接口类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
public interface RepoService extends IService<Repo> {

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<RepoDTO> paging(PagingReqDTO<RepoDTO> reqDTO);

    /**
    * 添加或保存
    * @param reqDTO
    * @return
    */
    void save(RepoDTO reqDTO);

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
    RepoDTO detail(String id);

    /**
    * 查找列表
    * @param reqDTO
    * @return
    */
    List<RepoDTO> list(RepoDTO reqDTO);
}
