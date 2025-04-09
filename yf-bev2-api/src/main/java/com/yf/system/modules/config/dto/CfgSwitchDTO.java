package com.yf.system.modules.config.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 功能配置数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2021-11-06 12:02
*/
@Data
@Schema(name="功能配置", description="功能配置")
public class CfgSwitchDTO implements Serializable {

    private static final long serialVersionUID = 1L;


   @Schema(description = "功能名称", required=true)
    private String id;

   @Schema(description = "开关或值")
    private String val;

}
