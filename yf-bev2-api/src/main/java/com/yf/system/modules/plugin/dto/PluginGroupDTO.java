package com.yf.system.modules.plugin.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 插件分组数据传输类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2022-09-05 10:05
 */
@Data
@Schema(name = "插件分组", description = "插件分组")
public class PluginGroupDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Schema(description = "ID")
    private String id;

    @Schema(description = "分组名称")
    private String title;

    @Schema(description = "独立排斥")
    private Boolean single;

}
