package com.yf.modules.exam.paper.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * <p>
 * 试卷考题备选答案数据传输类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:40
 */
@Data
@Schema(description = "试卷考题备选答案")
public class PaperQuAnswerDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;


    @Schema(description = "ID")
    private String id;

    @Schema(description = "试卷ID")
    private String paperId;

    @Schema(description = "回答项ID")
    private String answerId;

    @Schema(description = "题目ID")
    private String quId;

    @Schema(description = "是否正确项")
    private Boolean isRight;

    @Schema(description = "填空题")
    private String answer;

    @Schema(description = "是否选中")
    private Boolean checked;

    @Schema(description = "排序")
    private Integer sort;

    @Schema(description = "选项标签")
    private String abc;

}
