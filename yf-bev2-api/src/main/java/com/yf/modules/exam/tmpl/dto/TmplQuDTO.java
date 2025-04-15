package com.yf.modules.exam.tmpl.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;

/**
* <p>
* 试卷题目数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-15 10:41
*/
@Data
@Schema(description="试卷题目")
public class TmplQuDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;
    
    
    @Schema(description = "ID")
    private String id;
    
    @Schema(description = "模板ID")
    private String tmplId;
    
    @Schema(description = "题目ID")
    private String quId;
    
    @Schema(description = "题目类型")
    private String quType;
    
    @Schema(description = "分数")
    private BigDecimal quScore;
    
    @Schema(description = "排序")
    private Integer sort;
    
}
