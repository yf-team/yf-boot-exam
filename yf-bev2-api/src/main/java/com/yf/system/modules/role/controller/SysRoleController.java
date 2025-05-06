package com.yf.system.modules.role.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yf.base.api.annon.DataProtect;
import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.BaseIdReqDTO;
import com.yf.base.api.api.dto.BaseIdsReqDTO;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.base.utils.BeanMapper;
import com.yf.system.modules.role.dto.SysRoleDTO;
import com.yf.system.modules.role.entity.SysRole;
import com.yf.system.modules.role.service.SysRoleMenuService;
import com.yf.system.modules.role.service.SysRoleService;
import com.yf.system.modules.user.dto.request.SysRoleMenuReqDTO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 管理用户控制器
 * </p>
 *
 * @author 聪明笨狗
 * @since 2020-04-13 16:57
 */
@Tag(name = "角色管理")
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/sys/role")
public class SysRoleController extends BaseController {

    private final SysRoleService baseService;
    private final SysRoleMenuService sysRoleMenuService;

    /**
     * 添加或修改
     *
     * @param reqDTO
     * @return
     */
    @RequiresPermissions(value = {"sys:role:add", "sys:role:update"}, logical = Logical.OR)
    @DataProtect(clazz = SysRole.class, update = true)
    @Operation(summary = "添加或修改")
    @PostMapping("/save")
    public ApiRest<?> save(@Validated @RequestBody SysRoleDTO reqDTO) {
        baseService.save(reqDTO);
        return super.success();
    }

    /**
     * 批量删除
     *
     * @param reqDTO
     * @return
     */
    @RequiresPermissions(value = {"sys:role:delete"})
    @DataProtect(clazz = SysRole.class, delete = true)
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
    @RequiresPermissions(value = {"sys:role:add", "sys:role:update"}, logical = Logical.OR)
    @Operation(summary = "查找详情")
    @PostMapping("/detail")
    public ApiRest<SysRoleDTO> detail(@RequestBody BaseIdReqDTO reqDTO) {
        SysRole entity = baseService.getById(reqDTO.getId());
        SysRoleDTO dto = new SysRoleDTO();
        BeanMapper.copy(entity, dto);
        return super.success(dto);
    }


    /**
     * 分页查找
     *
     * @param reqDTO
     * @return
     */
    @RequiresPermissions(value = {"sys:role:paging"})
    @Operation(summary = "分页查找")
    @PostMapping("/paging")
    public ApiRest<IPage<SysRoleDTO>> paging(@RequestBody PagingReqDTO<SysRoleDTO> reqDTO) {

        //分页查询并转换
        IPage<SysRoleDTO> page = baseService.paging(reqDTO);
        return super.success(page);
    }

    /**
     * 查找角色菜单授权
     *
     * @return
     */
    @RequiresPermissions(value = {"sys:role:grant"})
    @Operation(summary = "查找角色菜单授权")
    @PostMapping("/list-menus")
    public ApiRest<List<String>> listMenus(@RequestBody BaseIdReqDTO reqDTO) {
        //分页查询并转换
        List<String> ids = sysRoleMenuService.findRoleMenus(reqDTO.getId());
        return super.success(ids);
    }


    /**
     * 保存角色菜单授权
     *
     * @return
     */
    @DataProtect(clazz = SysRole.class, update = true)
    @RequiresPermissions(value = {"sys:role:grant"})
    @Operation(summary = "保存角色菜单授权")
    @PostMapping("/save-menus")
    public ApiRest<?> saveMenus(@RequestBody SysRoleMenuReqDTO reqDTO) {

        // 保存授权
        sysRoleMenuService.saveRoleIds(reqDTO.getId(), reqDTO.getMenuIds());
        return super.success();
    }


}
