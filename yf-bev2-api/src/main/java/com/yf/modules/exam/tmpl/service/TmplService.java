package com.yf.modules.exam.tmpl.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.modules.exam.tmpl.dto.TmplDTO;
import com.yf.modules.exam.tmpl.entity.Tmpl;

import java.util.List;

/**
* <p>
* 试卷业务接口类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-15 10:41
*/
public interface TmplService extends IService<Tmpl> {

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<TmplDTO> paging(PagingReqDTO<TmplDTO> reqDTO);

    /**
    * 添加或保存
    * @param reqDTO
    * @return
    */
    void save(TmplDTO reqDTO);

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
    TmplDTO detail(String id);

}
