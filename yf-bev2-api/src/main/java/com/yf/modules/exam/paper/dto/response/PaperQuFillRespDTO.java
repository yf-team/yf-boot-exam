package com.yf.modules.exam.paper.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * <p>
 * 考生答题响应类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:40
 */
@Data
@Schema(description = "考生答题响应类")
public class PaperQuFillRespDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "试卷ID")
    private Boolean filled;
}
