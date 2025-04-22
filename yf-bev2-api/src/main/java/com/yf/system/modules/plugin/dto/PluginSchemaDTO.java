package com.yf.system.modules.plugin.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 插件元数据数据传输类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2022-09-05 10:05
 */
@Data
@Schema(name = "插件元数据", description = "插件元数据")
public class PluginSchemaDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Schema(description = "ID")
    private String id;

    @Schema(description = "元数据")
    private String schemaData;

    @Schema(description = "分组")
    private String groupId;

}
