package com.yf.system.modules.depart.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 部门排序请求类
* </p>
*
* @author 聪明笨狗
* @since 2020-03-14 10:37
*/
@Data
@Schema(name="拖动排序请求类", description="拖动排序请求类")
public class DepartSortReqDTO implements Serializable {

    private static final long serialVersionUID = 1L;

   @Schema(description = "源菜单ID")
    private String form;

   @Schema(description = "目标菜单ID")
    private String to;

   @Schema(description = "目标类型,inner放入,before放在前面,after放到后面")
    private String dropType;
}
