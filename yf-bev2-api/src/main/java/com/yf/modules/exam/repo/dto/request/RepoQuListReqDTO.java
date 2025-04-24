package com.yf.modules.exam.repo.dto.request;

import com.yf.base.api.annon.Dict;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * <p>
 * 试题列表请求类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-11 09:42
 */
@Data
@Schema(description = "试题列表请求类")
public class RepoQuListReqDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "所属题库")
    private String repoId;

    @Dict(dicCode = "qu_type")
    @Schema(description = "题目类型")
    private String quType;

    @Dict(dicCode = "qu_difficulty_level")
    @Schema(description = "难度等级")
    private String difficultyLevel;

    @Schema(description = "题目内容")
    private String content;

}
