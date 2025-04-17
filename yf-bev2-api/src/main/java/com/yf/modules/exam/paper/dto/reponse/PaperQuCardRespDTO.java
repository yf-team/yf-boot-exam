package com.yf.modules.exam.paper.dto.reponse;

import com.yf.base.api.annon.Dict;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * <p>
 * 答题卡视图响应类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:40
 */
@Data
@Schema(description = "答题卡视图响应类")
public class PaperQuCardRespDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Dict(dicCode = "qu_type")
    @Schema(description = "题型")
    private String quType;

    @Schema(description = "题目列表")
    private List<String> quIdList;
}
