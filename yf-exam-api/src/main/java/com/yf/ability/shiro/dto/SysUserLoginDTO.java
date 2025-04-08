package com.yf.ability.shiro.dto;

import com.yf.base.api.annon.Dict;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
* <p>
* 管理用户请求类
* </p>
*
* @author 聪明笨狗
* @since 2020-04-13 16:57
*/
@Data
@Schema(name="管理用户登录响应类", description="管理用户登录响应类")
public class SysUserLoginDTO implements Serializable {

    private static final long serialVersionUID = 1L;


   @Schema(description = "ID", required=true)
    private String id;

   @Schema(description = "用户名", required=true)
    private String userName;

   @Schema(description = "头像", required=true)
    private String avatar;

   @Schema(description = "真实姓名", required=true)
    private String realName;

   @Schema(description = "身份证号", required=true)
    private String idCard;

   @Schema(description = "邮箱", required=true)
    private String email;

   @Schema(description = "手机", required=true)
    private String mobile;

   @Schema(description = "数据权限", required=true)
    private Integer dataScope;

   @Schema(description = "权限级别", required=true)
    private Integer roleLevel;

    @Dict(dictTable = "el_sys_depart", dicCode = "dept_code", dicText = "dept_name")
   @Schema(description = "部门编码", required=true)
    private String deptCode;

   @Schema(description = "角色类型", required=true)
    private Integer roleType;

   @Schema(description = "实人认证状态", required=true)
    private Boolean realPerson;

   @Schema(description = "状态", required=true)
    private Integer state;

   @Schema(description = "角色列表", required=true)
    private List<String> roles;

   @Schema(description = "权限列表", required=true)
    private List<String> permissions;

   @Schema(description = "登录令牌", required=true)
    private String token;
}
