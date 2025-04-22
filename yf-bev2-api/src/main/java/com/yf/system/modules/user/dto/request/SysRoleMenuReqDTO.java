package com.yf.system.modules.user.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 角色菜单授权请求类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2020-04-13 16:57
 */
@Data
@Schema(name = "角色菜单授权请求类", description = "角色菜单授权请求类")
public class SysRoleMenuReqDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "角色ID")
    private String id;

    @Schema(description = "菜单ID列表")
    private List<String> menuIds;

}
