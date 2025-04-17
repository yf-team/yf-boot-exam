package com.yf.modules.exam.exam.service;

import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.modules.exam.exam.entity.ExamRecord;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yf.modules.exam.exam.dto.ExamRecordDTO;

import java.math.BigDecimal;
import java.util.List;

/**
* <p>
* 考试记录业务接口类
* </p>
*
* @author 沉醉寒风
* @since 2025-04-17 14:59
*/
public interface ExamRecordService extends IService<ExamRecord> {

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<ExamRecordDTO> paging(PagingReqDTO<ExamRecordDTO> reqDTO);

    /**
     * 加入考试记录
     * @param examId
     * @param userId
     * @param paperId
     * @param score
     * @param passed
     */
    void joinRecord(String examId, String userId, String paperId, BigDecimal score, Boolean passed);
}
