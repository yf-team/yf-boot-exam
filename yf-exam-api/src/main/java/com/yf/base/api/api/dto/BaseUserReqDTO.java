package com.yf.base.api.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 用户通用请求类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2019-04-20 12:15
 */
@Data
@Schema(name="用户通用请求类", description="用户通用请求类")
@AllArgsConstructor
@NoArgsConstructor
public class BaseUserReqDTO extends BaseDTO {


    @JsonIgnore
   @Schema(description = "用户ID用来注入用的，可以不传")
    private String userId;

}
