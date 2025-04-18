package com.yf.modules.exam.paper.dto.response;

import com.yf.base.api.annon.Dict;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.List;

/**
* <p>
* 考试题目详情类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@Data
@Schema(description="考试题目详情类")
public class PaperQuDetailDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;
    
    
    @Schema(description = "ID")
    private String id;

    @Schema(description = "试卷ID")
    private String paperId;

    @Schema(description = "试题ID")
    private String quId;

    @Dict(dicCode = "qu_type")
    @Schema(description = "题目类型")
    private String quType;
    
    @Schema(description = "题目内容")
    private String content;

    @Schema(description = "选项列表")
    private List<PaperQuAnswerDetailDTO> answerList;
    
}
