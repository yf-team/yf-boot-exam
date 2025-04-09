package com.yf.system.modules.dict.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
* <p>
* 分类字典值数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2020-12-01 14:00
*/
@Data
@Schema(name="数据字典请求类", description="数据字典请求类")
public class SysDicValueReqDTO implements Serializable {

    private static final long serialVersionUID = 1L;


   @Schema(description = "归属字典")
    private String dicCode;

   @Schema(description = "排除值")
    private List<String> excludes;


}
