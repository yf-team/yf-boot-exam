package com.yf.base.api.api.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * <p>
 * 通用状态请求类，用于修改状态什么的
 * </p>
 *
 * @author 聪明笨狗
 * @since 2019-04-20 12:15
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(name = "通用状态请求类", description = "通用状态请求类")
public class BaseStateReqDTO extends BaseDTO {


    @Schema(description = "要修改对象的ID列表")
    private List<String> ids;

    @Schema(description = "通用状态，0为正常，1为禁用")
    private Integer state;
}
