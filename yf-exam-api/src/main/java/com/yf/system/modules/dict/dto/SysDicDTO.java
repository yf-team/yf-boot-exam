package com.yf.system.modules.dict.dto;

import com.yf.base.api.annon.Dict;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 分类字典数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2020-12-01 14:00
*/
@Data
@Schema(name="分类字典", description="分类字典")
public class SysDicDTO implements Serializable {

    private static final long serialVersionUID = 1L;


   @Schema(description = "ID", required=true)
    private String id;

   @Schema(description = "字典编码")
    private String code;

    @Dict(dicCode = "dic_type")
   @Schema(description = "1分类字典,2数据字典")
    private Integer type;

   @Schema(description = "字典名称")
    private String title;

   @Schema(description = "字典描述")
    private String remark;

}
