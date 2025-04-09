package com.yf.system.modules.menu.dto.response;

import com.yf.base.api.annon.Dict;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
* <p>
* 菜单树结构，用于后台菜单管理
* </p>
*
* @author 聪明笨狗
* @since 2021-03-02 13:09
*/
@Data
@Schema(name="菜单树结构响应类", description="菜单树结构响应类")
public class MenuTreeRespDTO implements Serializable {

    private static final long serialVersionUID = 1L;


   @Schema(description = "ID")
    private String id;

   @Schema(description = "上级菜单")
    private String parentId;

    @Dict(dicCode = "menu_type")
   @Schema(description = "1菜单2功能")
    private Integer menuType;

   @Schema(description = "权限标识")
    private String permissionTag;

   @Schema(description = "访问路径")
    private String path;

   @Schema(description = "视图或Layout")
    private String component;

   @Schema(description = "跳转地址")
    private String redirect;

   @Schema(description = "名称")
    private String name;

   @Schema(description = "路由标题")
    private String metaTitle;

   @Schema(description = "路由标题")
    private String metaIcon;

   @Schema(description = "高亮菜单")
    private String metaActiveMenu;

   @Schema(description = "是否缓存")
    private Boolean metaNoCache;

   @Schema(description = "是否隐藏")
    private Boolean hidden;

   @Schema(description = "越小越前")
    private Integer sort;

   @Schema(description = "子菜单列表")
    private List<MenuTreeRespDTO> children;


}
