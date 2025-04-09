package com.yf.system.modules.user.dto.request;

import com.yf.system.modules.user.dto.SysUserDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

/**
* <p>
* 管理员登录请求类
* </p>
*
* @author 聪明笨狗
* @since 2020-04-13 16:57
*/
@Data
@Schema(name="管理员保存请求类", description="管理员保存请求类")
public class SysUserSaveReqDTO extends SysUserDTO {

   @Schema(description = "角色列表", required=true)
    private List<String> roles;
}
