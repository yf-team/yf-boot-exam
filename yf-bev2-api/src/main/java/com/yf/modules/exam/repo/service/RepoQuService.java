package com.yf.mudules.exam.repo.service;

import com.yf.mudules.exam.repo.entity.RepoQu;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.boot.base.api.api.dto.PagingReqDTO;
import com.yf.mudules.exam.repo.dto.RepoQuDTO;

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
    void save(RepoQuDTO reqDTO);

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
    RepoQuDTO detail(String id);

    /**
    * 查找列表
    * @param reqDTO
    * @return
    */
    List<RepoQuDTO> list(RepoQuDTO reqDTO);
}
