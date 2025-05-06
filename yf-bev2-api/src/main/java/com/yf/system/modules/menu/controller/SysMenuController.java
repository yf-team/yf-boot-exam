package com.yf.system.modules.menu.controller;

import com.yf.base.api.annon.DataProtect;
import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.BaseIdReqDTO;
import com.yf.base.api.api.dto.BaseIdsReqDTO;
import com.yf.base.utils.BeanMapper;
import com.yf.system.modules.depart.dto.request.DepartSortReqDTO;
import com.yf.system.modules.menu.dto.SysMenuDTO;
import com.yf.system.modules.menu.dto.response.MenuTreeRespDTO;
import com.yf.system.modules.menu.dto.response.RouteRespDTO;
import com.yf.system.modules.menu.entity.SysMenu;
import com.yf.system.modules.menu.service.SysMenuService;
import com.yf.system.modules.user.UserUtils;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 系统菜单控制器
 * </p>
 *
 * @author 聪明笨狗
 * @since 2021-03-02 13:09
 */
@Tag(name = "菜单管理")
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/sys/menu")
public class SysMenuController extends BaseController {

    private final SysMenuService baseService;

    /**
     * 查找菜单路由
     *
     * @return
     */
    @Operation(summary = "获取菜单路由", description = "根据不同用户获取授权的菜单路由")
    @PostMapping("/routes")
    public ApiRest<List<RouteRespDTO>> routes() {
        List<String> roles = UserUtils.getRoles();
        List<RouteRespDTO> list = baseService.listMenuByRoles(roles);
        return super.success(list);
    }

    /**
     * 添加或修改
     *
     * @param reqDTO
     * @return
     */
    @RequiresPermissions(value = {"sys:menu:add", "sys:menu:update"}, logical = Logical.OR)
    @DataProtect(clazz = SysMenu.class, update = true)
    @Operation(summary = "添加或修改")
    @PostMapping("/save")
    public ApiRest<?> save(@RequestBody SysMenuDTO reqDTO) {
        baseService.save(reqDTO);
        return super.success();
    }

    /**
     * 批量删除
     *
     * @param reqDTO
     * @return
     */
    @RequiresPermissions(value = {"sys:menu:delete"})
    @DataProtect(clazz = SysMenu.class, delete = true)
    @Operation(summary = "批量删除")
    @PostMapping("/delete")
    public ApiRest<?> delete(@RequestBody BaseIdsReqDTO reqDTO) {
        //根据ID删除
        baseService.delete(reqDTO.getIds());
        return super.success();
    }

    /**
     * 查找详情
     *
     * @param reqDTO
     * @return
     */

    @Operation(summary = "查找详情")
    @PostMapping("/detail")
    public ApiRest<SysMenuDTO> find(@RequestBody BaseIdReqDTO reqDTO) {
        SysMenu entity = baseService.getById(reqDTO.getId());
        SysMenuDTO dto = new SysMenuDTO();
        BeanMapper.copy(entity, dto);
        return super.success(dto);
    }


    /**
     * 分页查找树结构
     *
     * @return
     */
    @Operation(summary = "菜单树结构", description = "一次性加载完全部数据，用于后端维护")
    @PostMapping("/tree")
    public ApiRest<List<MenuTreeRespDTO>> tree() {
        //分页查询并转换
        List<MenuTreeRespDTO> list = baseService.listTree();
        return super.success(list);
    }


    /**
     * 分类排序
     *
     * @param reqDTO
     * @return
     */
    @RequiresPermissions(value = {"sys:menu:sort"})
    @DataProtect(clazz = SysMenu.class, update = true)
    @Operation(summary = "调整菜单排序")
    @PostMapping("/sort")
    public ApiRest<?> sort(@RequestBody DepartSortReqDTO reqDTO) {
        baseService.sort(reqDTO);
        return super.success();
    }


}
