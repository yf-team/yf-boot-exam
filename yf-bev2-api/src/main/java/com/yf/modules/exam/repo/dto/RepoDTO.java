package com.yf.mudules.exam.repo.dto.request;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

import java.io.Serializable;

/**
* <p>
* 题库数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@Data
@ApiModel(value="题库", description="题库")
public class RepoDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    
    @ApiModelProperty(value = "ID", required=true)
    private String id;
    
    @ApiModelProperty(value = "题库名称", required=true)
    private String title;
    
    @ApiModelProperty(value = "分类ID")
    private String catId;
    
    @ApiModelProperty(value = "题库备注")
    private String remark;
    
    @ApiModelProperty(value = "创建时间", required=true)
    private Date createTime;
    
    @ApiModelProperty(value = "更新时间", required=true)
    private Date updateTime;
    
    @ApiModelProperty(value = "创建人")
    private String createBy;
    
    @ApiModelProperty(value = "修改人")
    private String updateBy;
    
}
