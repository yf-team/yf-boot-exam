package com.yf.modules.exam.repo.dto.response;

import com.yf.base.api.annon.Dict;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * <p>
 * 题库统计响应类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-11 09:42
 */
@Data
@Schema(description = "题库统计响应类")
public class RepoStatRespDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Dict(dicCode = "qu_type")
    @Schema(description = "题型")
    private String quType;

    @Schema(description = "题目数量")
    private Integer quCount;


}
