package com.yf.system.modules.user.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 用户修改请求类
* </p>
*
* @author 聪明笨狗
* @since 2020-04-13 16:57
*/
@Data
@Schema(name="用户修改请求类", description="用户修改请求类")
public class SysUserUpdateReqDTO implements Serializable {

    private static final long serialVersionUID = 1L;


   @Schema(description = "头像", required=true)
    private String avatar;

   @Schema(description = "真实姓名", required=true)
    private String realName;

   @Schema(description = "密码", required=true)
    private String password;

   @Schema(description = "身份证号码")
    private String idCard;

   @Schema(description = "手机号")
    private String mobile;

   @Schema(description = "邮箱")
    private String email;
}
