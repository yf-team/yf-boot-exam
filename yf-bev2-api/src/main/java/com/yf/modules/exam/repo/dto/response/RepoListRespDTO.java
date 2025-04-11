package com.yf.modules.exam.repo.dto.response;

import com.yf.base.utils.HtmlUtils;
import com.yf.modules.exam.repo.dto.RepoDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
* <p>
* 题库列表响应类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description="题库列表响应类")
public class RepoListRespDTO extends RepoDTO {

    @Serial
    private static final long serialVersionUID = 1L;
    
    @Schema(description = "题目数量")
    private Integer quCount;


    
}
