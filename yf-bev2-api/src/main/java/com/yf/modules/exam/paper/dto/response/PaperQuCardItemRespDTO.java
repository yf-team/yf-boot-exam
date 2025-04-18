package com.yf.modules.exam.paper.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;


/**
 * <p>
 * 答题卡题目
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:40
 */
@Data
@Schema(description = "答题卡题目")
public class PaperQuCardItemRespDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "试题ID")
    private String quId;

    @Schema(description = "已答")
    Boolean answered;

    @Schema(description = "标记")
    Boolean mark;

}
