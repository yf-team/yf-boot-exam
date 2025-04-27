package com.yf.system.modules.depart.controller;

import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.BaseIdReqDTO;
import com.yf.base.api.api.dto.BaseIdsReqDTO;
import com.yf.base.utils.BeanMapper;
import com.yf.system.modules.depart.dto.SysDepartDTO;
import com.yf.system.modules.depart.dto.request.DepartSortReqDTO;
import com.yf.system.modules.depart.dto.response.SysDepartTreeDTO;
import com.yf.system.modules.depart.entity.SysDepart;
import com.yf.system.modules.depart.service.SysDepartService;
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
 * 部门信息控制器
 * </p>
 *
 * @author 聪明笨狗
 * @since 2020-09-02 17:25
 */
@Tag(name = "部门信息")
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/sys/depart")
public class SysDepartController extends BaseController {

    private final SysDepartService baseService;

    /**
     * 添加或修改
     *
     * @param reqDTO
     * @return
     */
    @RequiresPermissions(value = {"sys:depart:add", "sys:depart:edit"}, logical = Logical.OR)
    @Operation(summary = "添加或修改")
    @PostMapping("/save")
    public ApiRest<?> save(@RequestBody SysDepartDTO reqDTO) {
        baseService.save(reqDTO);
        return super.success();
    }

    /**
     * 批量删除
     *
     * @param reqDTO
     * @return
     */
    @RequiresPermissions(value = {"sys:depart:delete"})
    @Operation(summary = "批量删除")
    @PostMapping("/delete")
    public ApiRest<?> edit(@RequestBody BaseIdsReqDTO reqDTO) {
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
    @RequiresPermissions(value = {"sys:depart:list"})
    @Operation(summary = "查找详情")
    @PostMapping("/detail")
    public ApiRest<SysDepartDTO> find(@RequestBody BaseIdReqDTO reqDTO) {
        SysDepart entity = baseService.getById(reqDTO.getId());
        SysDepartDTO dto = new SysDepartDTO();
        BeanMapper.copy(entity, dto);
        return super.success(dto);
    }


    /**
     * 树列表
     *
     * @return
     */
    @Operation(summary = "部门树列表")
    @PostMapping("/tree")
    public ApiRest<List<SysDepartTreeDTO>> tree() {
        List<SysDepartTreeDTO> dtoList = baseService.findTree(true);
        return super.success(dtoList);
    }


    /**
     * 部门树-注册用
     *
     * @return
     */
    @Operation(summary = "部门树-用于用户注册", description = "部门树权限为公开的，需求登录即可访问")
    @PostMapping("/tree-select")
    public ApiRest<List<SysDepartTreeDTO>> treeSelect() {
        List<SysDepartTreeDTO> dtoList = baseService.findTree(false);
        return super.success(dtoList);
    }

    /**
     * 分类排序
     *
     * @param reqDTO
     * @return
     */
    @RequiresPermissions(value = {"sys:depart:edit"}, logical = Logical.OR)
    @Operation(summary = "调整部门排序")
    @PostMapping("/sort")
    public ApiRest<?> sort(@RequestBody DepartSortReqDTO reqDTO) {
        baseService.sort(reqDTO);
        return super.success();
    }
}
