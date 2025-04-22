package com.yf.modules.exam.exam.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.modules.exam.exam.dto.ExamDTO;
import com.yf.modules.exam.exam.dto.response.ExamDetailDTO;
import com.yf.modules.exam.exam.entity.Exam;

import java.util.List;

/**
 * <p>
 * 考试业务接口类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:29
 */
public interface ExamService extends IService<Exam> {

    /**
     * 分页查询数据
     *
     * @param reqDTO
     * @return
     */
    IPage<ExamDTO> paging(PagingReqDTO<ExamDTO> reqDTO);

    /**
     * 添加或保存
     *
     * @param reqDTO
     * @return
     */
    void save(ExamDetailDTO reqDTO);

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
    ExamDetailDTO detail(String id);
}
