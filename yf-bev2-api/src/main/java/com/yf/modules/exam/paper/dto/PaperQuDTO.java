package com.yf.modules.exam.paper.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * <p>
 * 试卷考题数据传输类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:40
 */
@Data
@Schema(description = "试卷考题")
public class PaperQuDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;


    @Schema(description = "ID")
    private String id;

    @Schema(description = "试卷ID")
    private String paperId;

    @Schema(description = "题目ID")
    private String quId;

    @Schema(description = "题目类型")
    private String quType;

    @Schema(description = "是否已答")
    private Boolean answered;

    @Schema(description = "是否标记")
    private Boolean mark;

    @Schema(description = "问题排序")
    private Integer sort;

    @Schema(description = "单题分分值")
    private BigDecimal score;

    @Schema(description = "实际得分(主观题)")
    private BigDecimal actualScore;

    @Schema(description = "是否答对")
    private Boolean isRight;

}
