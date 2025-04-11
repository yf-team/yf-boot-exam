package com.yf.mudules.exam.repo.dto.request;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

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
@ApiModel(value="候选答案", description="候选答案")
public class RepoQuAnswerDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    
    @ApiModelProperty(value = "ID", required=true)
    private String id;
    
    @ApiModelProperty(value = "问题ID", required=true)
    private String quId;
    
    @ApiModelProperty(value = "是否正确", required=true)
    private Boolean isRight;
    
    @ApiModelProperty(value = "答案内容", required=true)
    private String content;
    
    @ApiModelProperty(value = "图片地址")
    private String image;
    
    @ApiModelProperty(value = "ABCD标签")
    private String tag;
    
}
