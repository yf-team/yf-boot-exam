package com.yf.system.modules.role.dto;

import com.yf.base.api.annon.Dict;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 角色请求类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2020-04-13 16:57
 */
@Data
@Schema(name = "角色", description = "角色")
public class SysRoleDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Schema(description = "角色ID")
    private String id;

    @Schema(description = "角色名称")
    private String roleName;

    @Dict(dicCode = "data_scope")
    @Schema(description = "数据权限")
    private Integer dataScope;

    @Schema(description = "越大越高")
    private Integer roleLevel;

    @Schema(description = "备注信息")
    private String remark;

    @Schema(description = "创建时间")
    private Date createTime;

    @Schema(description = "更新时间")
    private Date updateTime;

    @Schema(description = "创建人")
    private String createBy;

    @Schema(description = "修改人")
    private String updateBy;

}
