package com.yf.system.modules.role.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 角色菜单授权数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2021-03-02 15:44
*/
@Data
@Schema(name="角色菜单授权", description="角色菜单授权")
public class SysRoleMenuDTO implements Serializable {

    private static final long serialVersionUID = 1L;


   @Schema(description = "ID", required=true)
    private String id;

   @Schema(description = "角色ID", required=true)
    private String roleId;

   @Schema(description = "菜单ID", required=true)
    private String menuId;

}
