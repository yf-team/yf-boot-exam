package com.yf.system.modules.menu.dto.response;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author bool
 */
@Data
@Schema(name="路由响应类", description="路由响应类")
public class RouteRespDTO implements Serializable {


    private static final long serialVersionUID = 1L;


    @JsonIgnore
   @Schema(description = "ID")
    private String id;

    @JsonIgnore
   @Schema(description = "上级菜单")
    private String parentId;

   @Schema(description = "菜单类型")
    private Integer menuType;

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

   @Schema(description = "子路由表")
    private List<RouteRespDTO> children;

   @Schema(description = "路由属性")
    private Map<String,Object> meta;


    /**
     * 获取属性
     * @return
     */
    public Map<String,Object> getMeta(){
        Map<String,Object> meta = new HashMap<>(16);
        if(!StringUtils.isBlank(this.getMetaTitle())){
            meta.put("title", this.getMetaTitle());
        }

        if(!StringUtils.isBlank(this.getMetaIcon())){
            meta.put("icon", this.getMetaIcon());
        }

//        if(this.getMetaNoCache()!=null){
//            meta.put("noCache", this.getMetaNoCache());
//        }

//        if(!StringUtils.isBlank(this.getMetaActiveMenu())){
//            meta.put("activeMenu", this.getMetaActiveMenu());
//        }

        if((hidden==null || !hidden) && menuType.equals(1)){
            meta.put("alwaysShow", true);
        }
        return meta;
    }


}
