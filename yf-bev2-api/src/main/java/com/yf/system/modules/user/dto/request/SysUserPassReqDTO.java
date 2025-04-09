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
@Schema(name="密码修改请求类", description="密码修改请求类")
public class SysUserPassReqDTO implements Serializable {


   @Schema(description = "旧密码", required=true)
    private String oldPassword;

   @Schema(description = "新密码", required=true)
    private String password;

}
