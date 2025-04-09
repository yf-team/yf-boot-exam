package com.yf.system.modules.user.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 用户角色请求类
* </p>
*
* @author 聪明笨狗
* @since 2020-04-13 16:57
*/
@Data
@Schema(name="用户角色", description="用户角色")
public class SysUserRoleDTO implements Serializable {

    private static final long serialVersionUID = 1L;


   @Schema(description = "ID")
    private String id;

   @Schema(description = "用户ID")
    private String userId;

   @Schema(description = "角色ID")
    private String roleId;

}
