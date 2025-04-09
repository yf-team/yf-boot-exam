package com.yf.system.modules.plugin.dto;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.yf.base.api.annon.Dict;
import com.yf.base.utils.jackson.DesensitizeSerializer;
import com.yf.base.utils.jackson.RawJsonDeserializer;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
* <p>
* 插件信息数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2022-09-05 10:05
*/
@AllArgsConstructor
@NoArgsConstructor
@Data
@Schema(name="插件信息", description="插件信息")
public class PluginDataDTO implements Serializable {

    private static final long serialVersionUID = 1L;


   @Schema(description = "ID")
    private String id;

   @Schema(description = "插件编号")
    private String code;

   @Schema(description = "插件名称")
    private String title;

   @Schema(description = "元数据ID")
    private String schemaId;

    @Dict(dicCode = "plugin_group")
   @Schema(description = "分组ID")
    private String groupId;

    @JsonSerialize(using = DesensitizeSerializer.class)
    @JsonDeserialize(using = RawJsonDeserializer.class)
   @Schema(description = "配置数据")
    private String configData;

   @Schema(description = "后端服务类")
    private String serviceClazz;

   @Schema(description = "前端页面")
    private String component;

   @Schema(description = "是否使用")
    private Boolean inUse;

   @Schema(description = "插件状态")
    private String state;

}
