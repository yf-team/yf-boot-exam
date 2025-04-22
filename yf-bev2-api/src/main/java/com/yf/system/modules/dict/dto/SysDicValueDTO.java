package com.yf.system.modules.dict.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * <p>
 * 分类字典值数据传输类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2020-12-01 14:00
 */
@Data
@Schema(name = "分类字典值", description = "分类字典值")
public class SysDicValueDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;


    @Schema(description = "ID/字典编码")
    private String id;

    @Schema(description = "归属字典")
    private String dicCode;

    @Schema(description = "子项编码")
    private String dicValue;

    @Schema(description = "分类名称")
    private String title;

    @Schema(description = "上级ID")
    private String parentId;

    @Schema(description = "描述")
    private String remark;

}
