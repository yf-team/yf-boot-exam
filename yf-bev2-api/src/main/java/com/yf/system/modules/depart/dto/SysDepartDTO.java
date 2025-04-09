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


   @Schema(description = "ID", required=true)
    private String id;

   @Schema(description = "1公司2部门", required=true)
    private Integer deptType;

   @Schema(description = "所属上级", required=true)
    private String parentId;

   @Schema(description = "部门名称", required=true)
    private String deptName;

   @Schema(description = "部门编码", required=true)
    private String deptCode;

   @Schema(description = "部门层级", required=true)
    private Integer deptLevel;

   @Schema(description = "排序", required=true)
    private Integer sort;

   @Schema(description = "创建时间", required=true)
    private Date createTime;

   @Schema(description = "更新时间", required=true)
    private Date updateTime;

   @Schema(description = "创建人", required=true)
    private String createBy;

   @Schema(description = "修改人", required=true)
    private String updateBy;

}
