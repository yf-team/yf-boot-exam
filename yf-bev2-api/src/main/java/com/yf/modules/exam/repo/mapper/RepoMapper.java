package com.yf.modules.exam.repo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yf.modules.exam.repo.dto.RepoDTO;
import com.yf.modules.exam.repo.dto.response.RepoListRespDTO;
import com.yf.modules.exam.repo.entity.Repo;
import org.apache.ibatis.annotations.Param;

/**
* <p>
* 题库Mapper
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
public interface RepoMapper extends BaseMapper<Repo> {

    /**
     * 分页查找数据
     * @param page
     * @param query
     * @return
     */
    IPage<RepoListRespDTO> paging(Page<Repo> page, @Param("query") RepoDTO query);
}
