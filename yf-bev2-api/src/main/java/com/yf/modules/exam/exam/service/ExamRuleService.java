package com.yf.modules.exam.exam.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.modules.exam.exam.dto.ExamRuleDTO;
import com.yf.modules.exam.exam.entity.ExamRule;

import java.util.List;

/**
* <p>
* 考试规则业务接口类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-14 17:29
*/
public interface ExamRuleService extends IService<ExamRule> {

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<ExamRuleDTO> paging(PagingReqDTO<ExamRuleDTO> reqDTO);

    /**
    * 添加或保存
    * @param reqDTO
    * @return
    */
    void save(ExamRuleDTO reqDTO);

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
    ExamRuleDTO detail(String id);

    /**
    * 查找列表
    * @param reqDTO
    * @return
    */
    List<ExamRuleDTO> list(ExamRuleDTO reqDTO);
}
