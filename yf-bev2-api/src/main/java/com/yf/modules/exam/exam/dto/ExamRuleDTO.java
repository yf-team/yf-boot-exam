package com.yf.modules.exam.exam.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * <p>
 * 考试规则数据传输类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:29
 */
@Data
@Schema(description = "考试规则")
public class ExamRuleDTO implements Serializable {


    @Serial
    private static final long serialVersionUID = 1L;


    @Schema(description = "ID")
    private String id;

    @Schema(description = "考试ID")
    private String examId;

    @Schema(description = "题库ID")
    private String repoId;

    @Schema(description = "题型")
    private String quType;

    @Schema(description = "出题数量")
    private Integer quCount;

    @Schema(description = "每题分数")
    private BigDecimal quScore;

}
