package com.yf.plugins.upload.local.config;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 本地文件上传配置数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2021-02-05 11:16
*/
@Data
@Schema(name="本地文件上传配置", description="本地文件上传配置")
public class LocalConfig implements Serializable {

    private static final long serialVersionUID = 1L;


   @Schema(description = "ID", required=true)
    private String id;

   @Schema(description = "本地目录地址")
    private String localDir;

   @Schema(description = "访问路径")
    private String visitUrl;

}
