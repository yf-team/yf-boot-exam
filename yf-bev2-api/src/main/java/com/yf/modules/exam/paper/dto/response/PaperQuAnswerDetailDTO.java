package com.yf.modules.exam.paper.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
* <p>
* 试卷候选答案
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@Data
@Schema(description="试卷候选答案")
public class PaperQuAnswerDetailDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;
    
    
    @Schema(description = "ID")
    private String id;

    @Schema(description = "答案内容")
    private String content;

    @Schema(description = "试卷ID")
    private String paperId;

    @Schema(description = "回答项ID")
    private String answerId;

    @Schema(description = "题目ID")
    private String quId;

    @Schema(description = "是否选中")
    private Boolean checked;

    @Schema(description = "排序")
    private Integer sort;

    @Schema(description = "选项标签")
    private String abc;
    
}
