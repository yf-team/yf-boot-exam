package com.yf.system.modules.menu.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
* <p>
* 系统菜单数据传输类
* </p>
*
* @author 聪明笨狗
* @since 2021-03-02 13:09
*/
@Data
@Schema(name="系统菜单", description="系统菜单")
public class SysMenuDTO implements Serializable {

    private static final long serialVersionUID = 1L;


   @Schema(description = "ID")
    private String id;

   @Schema(description = "上级菜单")
    private String parentId;

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

   @Schema(description = "创建时间")
    private Date createTime;

   @Schema(description = "更新时间")
    private Date updateTime;

   @Schema(description = "创建人")
    private String createBy;

   @Schema(description = "修改人")
    private String updateBy;

}
