package com.yf.base.api.api.dto;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * <p>
 * 按关键字查询请求通用类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2019-04-20 12:15
 */
@Data
@Schema(name="按关键字查询请求通用类", description="按关键字查询请求通用类")
@AllArgsConstructor
@NoArgsConstructor
public class BaseQueryReqDTO extends BaseDTO {


    @Schema(name = "日期开始", required=true)
    private Date statDateL;

   @Schema(description = "日期结束", required=true)
    private Date statDateR;

   @Schema(description = "关键字查询", required=true)
    private String q;
}
