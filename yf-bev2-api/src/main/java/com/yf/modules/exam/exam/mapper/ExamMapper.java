package com.yf.modules.exam.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yf.modules.exam.exam.dto.ExamDTO;
import com.yf.modules.exam.exam.dto.request.ExamListReqDTO;
import com.yf.modules.exam.exam.entity.Exam;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 考试Mapper
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:29
 */
public interface ExamMapper extends BaseMapper<Exam> {

    /**
     * 查找分页数据-后端
     * @param page
     * @param reqDTO
     * @return
     */
    IPage<ExamDTO> paging(Page page, @Param("query") ExamListReqDTO reqDTO);
}
