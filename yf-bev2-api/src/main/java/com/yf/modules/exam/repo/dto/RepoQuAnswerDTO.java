package com.yf.modules.exam.repo.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
* <p>
* 候选答案数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@Data
@Schema(description="候选答案")
public class RepoQuAnswerDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;
    
    
    @Schema(description = "ID")
    private String id;
    
    @Schema(description = "问题ID")
    private String quId;
    
    @Schema(description = "是否正确")
    private Boolean isRight;
    
    @Schema(description = "答案内容")
    private String content;
    
    @Schema(description = "图片地址")
    private String image;
    
    @Schema(description = "ABCD标签")
    private String tag;
    
}
