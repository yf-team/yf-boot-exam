package com.yf.system.modules.dict.controller;

import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.BaseIdRespDTO;
import com.yf.base.api.api.dto.BaseIdsReqDTO;
import com.yf.system.modules.dict.dto.SysDicValueDTO;
import com.yf.system.modules.dict.dto.ext.DicValueTreeDTO;
import com.yf.system.modules.dict.dto.request.SysDicValueReqDTO;
import com.yf.system.modules.dict.service.SysDicValueService;
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
 * 分类字典控制器
 * </p>
 *
 * @author 聪明笨狗
 * @since 2020-12-01 14:00
 */
@Tag(name = "字典值管理")
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/sys/dic/value")
public class SysDicValueController extends BaseController {
    
    private final SysDicValueService baseService;

    /**
     * 添加或修改
     *
     * @param reqDTO
     * @return
     */
    @RequiresPermissions(value = {"sys:dict:add", "sys:dict:edit"}, logical = Logical.OR)
    @Operation(summary = "添加或修改")
    @PostMapping("/save")
    public ApiRest<BaseIdRespDTO> save(@RequestBody SysDicValueDTO reqDTO) {
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
    @Operation(summary = "批量删除")
    @PostMapping("/delete")
    public ApiRest<?> edit(@RequestBody BaseIdsReqDTO reqDTO) {
        //根据ID删除
        baseService.removeByIds(reqDTO.getIds());
        return super.success();
    }

    /**
     * 分类树列表
     *
     * @return
     */
    @Operation(summary = "分类树列表")
    @PostMapping("/tree")
    public ApiRest<List<DicValueTreeDTO>> tree(@RequestBody SysDicValueReqDTO reqDTO) {
        List<DicValueTreeDTO> dtoList = baseService.findTree(reqDTO);
        return super.success(dtoList);
    }

}
