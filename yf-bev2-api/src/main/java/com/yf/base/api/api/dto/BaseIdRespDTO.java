package com.yf.base.api.api.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 主键通用响应类，用于添加后返回内容
 * </p>
 *
 * @author 聪明笨狗
 * @since 2019-04-20 12:15
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(name="主键通用响应类", description="主键通用响应类")
public class BaseIdRespDTO extends BaseDTO {

   @Schema(description = "主键ID")
    private String id;
}
