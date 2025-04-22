package com.yf.modules.exam.paper.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * <p>
 * 考试题目详情类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-11 09:42
 */
@Data
@Schema(description = "考试校验响应类")
public class PaperCheckRespDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "校验是否通过")
    private Boolean validated;

    @Schema(description = "错误信息")
    private String message;

    @Schema(description = "进行中的考试ID")
    private String paperId;

}
