package com.yf.system.modules.user.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
*
* </p>
*
* @author 聪明笨狗
* @since 2020-04-13 16:57
*/
@Data
@Schema(name="用户注册请求类", description="用户注册请求类")
public class UserRegReqDTO implements Serializable {

    private static final long serialVersionUID = 1L;

   @Schema(description = "帐号", required=true)
    private String userName;

   @Schema(description = "密码", required=true)
    private String password;

   @Schema(description = "姓名", required=true)
    private String realName;

   @Schema(description = "部门", required=true)
    private String deptCode;

   @Schema(description = "验证码KEY", required=true)
    private String captchaKey;

   @Schema(description = "验证码值", required=true)
    private String captchaValue;


}
