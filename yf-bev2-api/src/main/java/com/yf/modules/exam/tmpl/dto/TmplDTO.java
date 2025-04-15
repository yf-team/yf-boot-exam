package com.yf.modules.exam.tmpl.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;

/**
* <p>
* 试卷数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-15 10:41
*/
@Data
@Schema(description="试卷")
public class TmplDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;
    
    
    @Schema(description = "ID")
    private String id;
    
    @Schema(description = "试卷标题")
    private String title;
    
    @Schema(description = "试卷分类")
    private String catId;
    
    @Schema(description = "组卷方式")
    private String joinType;
    
    @Schema(description = "题目数量")
    private Integer quCount;
    
    @Schema(description = "总分数")
    private BigDecimal totalScore;
    
}
