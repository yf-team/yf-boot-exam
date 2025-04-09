package com.yf.system.modules.config.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 通用配置请求类
* </p>
*
* @author 聪明笨狗
* @since 2020-04-17 09:12
*/
@Data
@Schema(name="通用配置", description="通用配置")
public class CfgBaseDTO implements Serializable {

    private static final long serialVersionUID = 1L;


   @Schema(description = "ID")
    private String id;

   @Schema(description = "系统名称")
    private String siteName;

   @Schema(description = "登录LOGO")
    private String loginLogo;

   @Schema(description = "登录背景")
    private String loginBg;

   @Schema(description = "后台LOGO")
    private String backLogo;

   @Schema(description = "版权信息")
    private String copyRight;

}
