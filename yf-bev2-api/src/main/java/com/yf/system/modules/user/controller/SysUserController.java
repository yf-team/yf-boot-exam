package com.yf.system.modules.user.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yf.ability.shiro.dto.SysUserLoginDTO;
import com.yf.base.api.annon.DataProtect;
import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.*;
import com.yf.base.api.exception.ServiceException;
import com.yf.system.modules.user.dto.request.*;
import com.yf.system.modules.user.dto.response.UserListRespDTO;
import com.yf.system.modules.user.entity.SysUser;
import com.yf.system.modules.user.enums.UserState;
import com.yf.system.modules.user.service.SysUserRoleService;
import com.yf.system.modules.user.service.SysUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 管理用户控制器
 * </p>
 *
 * @author 聪明笨狗
 * @since 2020-04-13 16:57
 */
@Tag(name = "用户管理")
@RestController
@Log4j2
@RequestMapping("/api/sys/user")
@RequiredArgsConstructor
public class SysUserController extends BaseController {

    private final SysUserService baseService;

    private final SysUserRoleService sysUserRoleService;


    /**
     * 用户详情
     *
     * @return
     */
    @RequiresPermissions(value = {"sys:user:add", "sys:user:edit"}, logical = Logical.OR)
    @Operation(summary = "用户详情")
    @PostMapping("/detail")
    public ApiRest<SysUserSaveReqDTO> detail(@RequestBody BaseIdReqDTO reqDTO) {
        SysUserSaveReqDTO respDTO = baseService.detail(reqDTO.getId());
        return super.success(respDTO);
    }

    /**
     * 用户登录
     *
     * @return
     */
    @Operation(summary = "账号密码登录")
    @PostMapping(value = "/login")
    public ApiRest<SysUserLoginDTO> login(@RequestBody SysUserLoginReqDTO reqDTO) {
        SysUserLoginDTO respDTO = baseService.login(reqDTO);
        return super.success(respDTO);
    }


    /**
     * 用户登录
     *
     * @return
     */
    @Operation(summary = "退出登录")
    @PostMapping("/logout")
    public ApiRest<?> logout(HttpServletRequest request) {
        String token = request.getHeader("token");
        baseService.logout(token);
        return super.success();
    }

    /**
     * 获取会话
     *
     * @return
     */
    @Operation(summary = "获取会话")
    @PostMapping("/info")
    public ApiRest<?> info(@RequestBody BaseTokenReqDTO reqDTO) {
        SysUserLoginDTO respDTO = baseService.token(reqDTO.getToken());
        return success(respDTO);
    }

    /**
     * 修改用户资料
     *
     * @return
     */
    @DataProtect(clazz = SysUser.class, update = true, currUsr = true)
    @Operation(summary = "修改用户资料")
    @PostMapping("/update")
    public ApiRest<?> update(@RequestBody SysUserUpdateReqDTO reqDTO) {
        baseService.update(reqDTO);
        return success();
    }


    /**
     * 修改密码
     *
     * @return
     */
    @DataProtect(clazz = SysUser.class, update = true, currUsr = true)
    @Operation(summary = "修改密码")
    @PostMapping("/update-pass")
    public ApiRest<?> updatePass(@RequestBody SysUserPassReqDTO reqDTO) {
        baseService.pass(reqDTO);
        return success();
    }

    /**
     * 保存或修改系统用户
     *
     * @return
     */
    @RequiresPermissions(value = {"sys:user:add", "sys:user:edit"}, logical = Logical.OR)
    @DataProtect(clazz = SysUser.class, update = true)
    @Operation(summary = "保存或修改")
    @PostMapping("/save")
    public ApiRest<?> save(@RequestBody SysUserSaveReqDTO reqDTO) {
        baseService.save(reqDTO);
        return success();
    }


    /**
     * 批量删除
     *
     * @param reqDTO
     * @return
     */
    @RequiresPermissions(value = {"sys:user:delete"})
    @DataProtect(clazz = SysUser.class, delete = true)
    @Operation(summary = "批量删除")
    @PostMapping("/delete")
    public ApiRest<?> delete(@RequestBody BaseIdsReqDTO reqDTO) {
        //根据ID删除
        baseService.delete(reqDTO.getIds());
        return super.success();
    }

    /**
     * 分页查找
     *
     * @param reqDTO
     * @return
     */
    @RequiresPermissions(value = {"sys:user:paging"})
    @Operation(summary = "分页查找")
    @PostMapping("/paging")
    public ApiRest<IPage<UserListRespDTO>> paging(@RequestBody PagingReqDTO<SysUserQueryReqDTO> reqDTO) {

        //分页查询并转换
        IPage<UserListRespDTO> page = baseService.paging(reqDTO);
        return super.success(page);
    }

    /**
     * 修改状态
     *
     * @param reqDTO
     * @return
     */
    @RequiresPermissions(value = {"sys:user:state"})
    @Operation(summary = "修改状态")
    @PostMapping("/state")
    public ApiRest<?> state(@RequestBody BaseStateReqDTO reqDTO) {

        // 条件
        QueryWrapper<SysUser> wrapper = new QueryWrapper<>();
        wrapper.lambda()
                .in(SysUser::getId, reqDTO.getIds())
                .ne(SysUser::getUserName, "admin");

        SysUser record = new SysUser();
        record.setState(reqDTO.getState());
        baseService.update(record, wrapper);
        return super.success();
    }

    /**
     * 用户注册
     *
     * @return
     */
    @Operation(summary = "用户注册", description = "通过账号密码注册")
    @PostMapping("/reg")
    public ApiRest<SysUserLoginDTO> reg(@RequestBody UserRegReqDTO reqDTO) {
        SysUserLoginDTO respDTO = baseService.reg(reqDTO);

        // 待审核的状态
        if (UserState.AUDIT.equals(respDTO.getState())) {
            throw new ServiceException("注册成功，管理员审核后方可登录！");
        }
        return success(respDTO);
    }


    /**
     * 批量修改角色
     *
     * @return
     */
    @RequiresPermissions(value = {"sys:user:batch-role"})
    @Operation(summary = "批量修改角色")
    @PostMapping("/batch-role")
    public ApiRest<?> batchRole(@RequestBody UserRoleReqDTO reqDTO) {
        sysUserRoleService.batchRole(reqDTO);
        return success();
    }

}
