package com.yf.modules.exam.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.base.utils.DecimalUtils;
import com.yf.modules.exam.exam.dto.ExamRecordDTO;
import com.yf.modules.exam.exam.dto.request.ExamRecordListReqDTO;
import com.yf.modules.exam.exam.entity.ExamRecord;
import com.yf.modules.exam.exam.mapper.ExamRecordMapper;
import com.yf.modules.exam.exam.service.ExamRecordService;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * <p>
 * 考试记录业务实现类
 * </p>
 *
 * @author 沉醉寒风
 * @since 2025-04-17 14:59
 */
@Service
public class ExamRecordServiceImpl extends ServiceImpl<ExamRecordMapper, ExamRecord> implements ExamRecordService {

    @Override
    public IPage<ExamRecordDTO> paging(PagingReqDTO<ExamRecordListReqDTO> reqDTO) {
        return baseMapper.paging(reqDTO.toPage(), reqDTO.getParams());
    }

    @Override
    public void joinRecord(String examId, String userId, String paperId, BigDecimal score, Boolean passed) {

        //查询条件
        QueryWrapper<ExamRecord> wrapper = new QueryWrapper<>();
        wrapper.lambda()
                .select(ExamRecord::getId, ExamRecord::getMaxScore, ExamRecord::getTryCount)
                .eq(ExamRecord::getUserId, userId)
                .eq(ExamRecord::getExamId, examId);

        ExamRecord record = this.getOne(wrapper, false);

        if (record == null) {
            record = new ExamRecord();
            record.setUserId(userId);
            record.setExamId(examId);
            record.setPaperId(paperId);
            record.setMaxScore(score);
            record.setLastScore(score);
            record.setPassed(passed);
            record.setTryCount(1);
            this.save(record);
        } else {

            // 更新最高分数
            BigDecimal maxScore = record.getMaxScore();
            if (DecimalUtils.gt(score, maxScore)) {
                record.setMaxScore(score);
                record.setPassed(passed);
                record.setPaperId(paperId);
            }
            record.setTryCount(record.getTryCount() + 1);
            record.setLastScore(score);
            this.updateById(record);
        }
    }

    @Override
    public int findTryCount(String examId, String userId) {

        //查询条件
        QueryWrapper<ExamRecord> wrapper = new QueryWrapper<>();
        wrapper.lambda()
                .select(ExamRecord::getId, ExamRecord::getTryCount)
                .eq(ExamRecord::getUserId, userId)
                .eq(ExamRecord::getExamId, examId);

        ExamRecord record = this.getOne(wrapper, false);
        if (record != null) {
            return record.getTryCount();
        }

        return 0;
    }

    @Override
    public IPage<ExamRecordDTO> clientPaging(PagingReqDTO<ExamRecordListReqDTO> reqDTO) {
        return baseMapper.clientPaging(reqDTO.toPage(), reqDTO.getParams());
    }

}
