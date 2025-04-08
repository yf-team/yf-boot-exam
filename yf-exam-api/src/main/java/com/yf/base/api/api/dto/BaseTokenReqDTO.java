package com.yf.base.api.api.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * <p>
 * token通用请求类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2019-04-20 12:15
 */
@Data
@Schema(name="token通用请求类", description="token通用请求类")
public class BaseTokenReqDTO extends BaseDTO {


   @Schema(description = "令牌", required=true)
    private String token;

}
