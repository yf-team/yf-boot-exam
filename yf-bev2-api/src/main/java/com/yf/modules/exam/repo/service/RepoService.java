package com.yf.modules.exam.repo.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.modules.exam.repo.dto.RepoDTO;
import com.yf.modules.exam.repo.dto.response.RepoListRespDTO;
import com.yf.modules.exam.repo.dto.response.RepoStatRespDTO;
import com.yf.modules.exam.repo.entity.Repo;

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
     *
     * @param reqDTO
     * @return
     */
    IPage<RepoListRespDTO> paging(PagingReqDTO<RepoDTO> reqDTO);

    /**
     * 添加或保存
     *
     * @param reqDTO
     * @return
     */
    void save(RepoDTO reqDTO);

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    void delete(List<String> ids);

    /**
     * 查找详情
     *
     * @param id
     * @return
     */
    RepoDTO detail(String id);

    /**
     * 查找列表
     *
     * @param repoId
     * @return
     */
    List<RepoStatRespDTO> listStat(String repoId);
}
