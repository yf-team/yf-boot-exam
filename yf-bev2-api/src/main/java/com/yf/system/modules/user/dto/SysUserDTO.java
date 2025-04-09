package com.yf.system.modules.user.dto;

import com.yf.base.api.annon.Dict;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
* <p>
* 管理用户请求类
* </p>
*
* @author 聪明笨狗
* @since 2020-04-13 16:57
*/
@Data
@Schema(name="管理用户", description="管理用户")
public class SysUserDTO implements Serializable {

    private static final long serialVersionUID = 1L;


   @Schema(description = "ID")
    private String id;

   @Schema(description = "用户名")
    private String userName;

   @Schema(description = "头像")
    private String avatar;

   @Schema(description = "真实姓名")
    private String realName;

   @Schema(description = "密码")
    private String password;

   @Schema(description = "密码盐")
    private String salt;

   @Schema(description = "状态")
    private Integer state;

   @Schema(description = "身份证号码")
    private String idCard;

   @Schema(description = "手机号")
    private String mobile;

   @Schema(description = "邮箱")
    private String email;

    @Dict(dictTable = "el_sys_depart", dicCode = "dept_code", dicText = "dept_name")
   @Schema(description = "部门编码")
    private String deptCode;

   @Schema(description = "创建时间")
    private Date createTime;

   @Schema(description = "更新时间")
    private Date updateTime;

   @Schema(description = "创建人")
    private String createBy;

   @Schema(description = "修改人")
    private String updateBy;

}
