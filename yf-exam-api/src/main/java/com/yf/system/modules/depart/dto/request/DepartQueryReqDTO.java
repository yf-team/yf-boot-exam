package com.yf.system.modules.depart.dto.request;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 部门排序请求类
* </p>
*
* @author 聪明笨狗
* @since 2020-03-14 10:37
*/
@Data
@Schema(name="部门查询请求类", description="部门排序请求类")
public class DepartQueryReqDTO implements Serializable {

    private static final long serialVersionUID = 1L;

   @Schema(description = "分类ID")
    private String parentId;

    @JsonIgnore
    private String deptCodes;

    @JsonIgnore
    private String likeCode;

   @Schema(description = "部门编号")
    private String deptCode;

   @Schema(description = "部门名称")
    private String deptName;
}
