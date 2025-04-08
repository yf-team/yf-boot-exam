package com.yf.base.api.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * <p>
 * 主键通用请求类，用于根据ID查询
 * </p>
 *
 * @author 聪明笨狗
 * @since 2019-04-20 12:15
 */
@Data
@Schema(name="主键通用请求类", description="主键通用请求类")
public class BaseIdReqDTO extends BaseDTO {


   @Schema(description = "主键ID", required=true)
    private String id;

    @JsonIgnore
    private String userId;

}
