package com.yf.modules.exam.exam.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.math.BigDecimal;
import java.io.Serializable;

/**
* <p>
* 考试记录数据传输类
* </p>
*
* @author 沉醉寒风
* @since 2025-04-17 14:59
*/
@Data
@Schema(description="考试记录")
public class ExamRecordDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;
    
    
    @Schema(description ="ID")
    private String id;
    
    @Schema(description ="用户ID")
    private String userId;
    
    @Schema(description ="考试ID")
    private String examId;
    
    @Schema(description ="结算的试卷ID")
    private String paperId;
    
    @Schema(description = "考试次数")
    private Integer tryCount;
    
    @Schema(description ="最高分数")
    private BigDecimal maxScore;
    
    @Schema(description ="最近分数")
    private BigDecimal lastScore;
    
    @Schema(description ="是否通过")
    private Boolean passed;
    
}
