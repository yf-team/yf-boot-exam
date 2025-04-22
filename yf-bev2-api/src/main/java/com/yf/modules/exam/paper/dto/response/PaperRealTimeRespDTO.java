package com.yf.modules.exam.paper.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * <p>
 * 试卷实时状态
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-11 09:42
 */
@Data
@Schema(description = "试卷实时状态")
public class PaperRealTimeRespDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "剩余时间")
    private Integer leftSeconds;

    @Schema(description = "错误信息")
    private Boolean handed;

    @Schema(description = "状态消息，预留")
    private String message;

}
