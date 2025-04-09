package com.yf.system.modules.depart.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
* <p>
* 部门信息数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2020-09-02 17:25
*/
@Data
@Schema(name="部门信息", description="部门信息")
public class SysDepartDTO implements Serializable {

    private static final long serialVersionUID = 1L;


   @Schema(description = "ID")
    private String id;

   @Schema(description = "1公司2部门")
    private Integer deptType;

   @Schema(description = "所属上级")
    private String parentId;

   @Schema(description = "部门名称")
    private String deptName;

   @Schema(description = "部门编码")
    private String deptCode;

   @Schema(description = "部门层级")
    private Integer deptLevel;

   @Schema(description = "排序")
    private Integer sort;

   @Schema(description = "创建时间")
    private Date createTime;

   @Schema(description = "更新时间")
    private Date updateTime;

   @Schema(description = "创建人")
    private String createBy;

   @Schema(description = "修改人")
    private String updateBy;

}
