package com.yf.system.modules.dict.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yf.base.api.annon.DataProtect;
import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.BaseIdsReqDTO;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.system.modules.dict.dto.SysDicDTO;
import com.yf.system.modules.dict.entity.SysDic;
import com.yf.system.modules.dict.service.SysDicService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 分类字典控制器
 * </p>
 *
 * @author 聪明笨狗
 * @since 2020-12-01 14:00
 */
@Tag(name = "字典项管理", description = "数据字典项管理，也就是一级目录")
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/sys/dic")
public class SysDicController extends BaseController {

    private final SysDicService baseService;

    /**
     * 添加或修改
     *
     * @param reqDTO
     * @return
     */
    @RequiresPermissions(value = {"sys:dict:add", "sys:dict:edit"}, logical = Logical.OR)
    @DataProtect(clazz = SysDic.class, update = true)
    @Operation(summary = "添加或修改")
    @PostMapping("/save")
    public ApiRest<?> save(@RequestBody SysDicDTO reqDTO) {
        baseService.save(reqDTO);
        return super.success();
    }

    /**
     * 批量删除
     *
     * @param reqDTO
     * @return
     */
    @RequiresPermissions(value = {"sys:dict:delete"})
    @DataProtect(clazz = SysDic.class, delete = true)
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
    @Operation(summary = "分页查找")
    @PostMapping("/paging")
    public ApiRest<IPage<SysDicDTO>> paging(@RequestBody PagingReqDTO<SysDicDTO> reqDTO) {
        //分页查询并转换
        IPage<SysDicDTO> page = baseService.paging(reqDTO);
        return super.success(page);
    }

}
