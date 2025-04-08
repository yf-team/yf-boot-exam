package com.yf.system.modules.user.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 管理员登录请求类
* </p>
*
* @author 聪明笨狗
* @since 2020-04-13 16:57
*/
@Data
@Schema(name="管理员登录请求类", description="管理员登录请求类")
public class SysUserLoginReqDTO implements Serializable {

    private static final long serialVersionUID = 1L;

   @Schema(description = "用户名", required=true)
    private String userName;

   @Schema(description = "密码", required=true)
    private String password;

   @Schema(description = "验证码key", required=true)
    private String captchaKey;

   @Schema(description = "用户输入的验证码值", required=true)
    private String captchaValue;

}
