package com.yf.modules.exam.tmpl.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.BaseIdReqDTO;
import com.yf.base.api.api.dto.BaseIdsReqDTO;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.modules.exam.tmpl.dto.TmplDTO;
import com.yf.modules.exam.tmpl.service.TmplService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
* <p>
* 试卷控制器
* </p>
*
* @author 聪明笨狗
* @since 2025-04-15 10:41
*/
@Schema(description = "试卷")
@RestController
@RequestMapping("/api/exam/tmpl/tmpl")
public class TmplController extends BaseController {

    @Autowired
    private TmplService baseService;

    /**
    * 添加或修改
    * @param reqDTO
    * @return
    */
    @Operation(summary ="添加或修改")
    @RequiresPermissions(value = {"exam:tmpl:add", "exam:tmpl:edit"}, logical = Logical.OR)
    @PostMapping("/save")
    public ApiRest<?> save(@RequestBody TmplDTO reqDTO) {
        baseService.save(reqDTO);
        return super.success();
    }

    /**
    * 批量删除
    * @param reqDTO
    * @return
    */
    @Operation(summary ="批量删除")
    @RequiresPermissions("exam:tmpl:delete")
    @PostMapping("/delete")
    public ApiRest<?> delete(@RequestBody BaseIdsReqDTO reqDTO) {
        //根据ID删除
        baseService.delete(reqDTO.getIds());
        return super.success();
    }

    /**
    * 查找详情
    * @param reqDTO
    * @return
    */
    @Operation(summary ="查找详情")
    @RequiresPermissions("exam:tmpl:view")
    @PostMapping("/detail")
    public ApiRest<TmplDTO> detail(@RequestBody BaseIdReqDTO reqDTO) {
        TmplDTO dto = baseService.detail(reqDTO.getId());
        return super.success(dto);
    }

    /**
    * 分页查找
    * @param reqDTO
    * @return
    */
    @Operation(summary ="分页查找")
    @RequiresPermissions("exam:tmpl:view")
    @PostMapping("/paging")
    public ApiRest<IPage<TmplDTO>> paging(@RequestBody PagingReqDTO<TmplDTO> reqDTO) {

        //分页查询并转换
        IPage<TmplDTO> page = baseService.paging(reqDTO);

        return super.success(page);
    }
}
