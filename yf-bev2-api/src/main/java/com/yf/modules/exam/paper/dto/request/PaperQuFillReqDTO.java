package com.yf.modules.exam.paper.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 考生答题请求类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:40
 */
@Data
@Schema(description = "考生答题请求类")
public class PaperQuFillReqDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;


    @Schema(description = "试卷ID")
    private String paperId;

    @Schema(description = "试题ID")
    private String quId;

    @Schema(description = "选定的项目")
    private List<String> checkedItems;
}
