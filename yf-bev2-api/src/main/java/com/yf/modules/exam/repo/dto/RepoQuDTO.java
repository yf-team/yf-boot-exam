package com.yf.mudules.exam.repo.dto.request;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

import java.io.Serializable;

/**
* <p>
* 问题题目数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@Data
@ApiModel(value="问题题目", description="问题题目")
public class RepoQuDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    
    @ApiModelProperty(value = "ID", required=true)
    private String id;
    
    @ApiModelProperty(value = "所属题库", required=true)
    private String repoId;
    
    @ApiModelProperty(value = "所属章节")
    private String chapterId;
    
    @ApiModelProperty(value = "题目类型", required=true)
    private String quType;
    
    @ApiModelProperty(value = "难度等级", required=true)
    private String difficultyLevel;
    
    @ApiModelProperty(value = "题目内容", required=true)
    private String content;
    
    @ApiModelProperty(value = "整题解析")
    private String analysis;
    
    @ApiModelProperty(value = "创建时间", required=true)
    private Date createTime;
    
    @ApiModelProperty(value = "更新时间", required=true)
    private Date updateTime;
    
    @ApiModelProperty(value = "创建人")
    private String createBy;
    
    @ApiModelProperty(value = "修改人")
    private String updateBy;
    
}
