package com.yf.modules.exam.repo.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.BaseIdReqDTO;
import com.yf.base.api.api.dto.BaseIdsReqDTO;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.modules.exam.repo.dto.RepoDTO;
import com.yf.modules.exam.repo.dto.response.RepoListRespDTO;
import com.yf.modules.exam.repo.service.RepoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* <p>
* 题库控制器
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@Tag(name="题库")
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/exam/repo/repo")
public class RepoController extends BaseController {

    private final RepoService repoService;

    /**
    * 添加或修改
    * @param reqDTO
    * @return
    */
    @RequiresPermissions(value = {"repo:repo:edit", "repo:repo:add"}, logical = Logical.OR)
    @Operation(summary = "添加或修改")
    @PostMapping("/save")
    public ApiRest<?> save(@RequestBody RepoDTO reqDTO) {
        repoService.save(reqDTO);
        return super.success();
    }

    /**
    * 批量删除
    * @param reqDTO
    * @return
    */
    @RequiresPermissions("repo:repo:delete")
    @PostMapping("/delete")
    public ApiRest<?> delete(@RequestBody BaseIdsReqDTO reqDTO) {
        //根据ID删除
        repoService.delete(reqDTO.getIds());
        return super.success();
    }

    /**
    * 查找详情
    * @param reqDTO
    * @return
    */
    @Operation(summary = "查找详情")
    @RequiresPermissions("repo:repo:view")
    @PostMapping("/detail")
    public ApiRest<RepoDTO> detail(@RequestBody BaseIdReqDTO reqDTO) {
        RepoDTO dto = repoService.detail(reqDTO.getId());
        return super.success(dto);
    }

    /**
    * 分页查找
    * @param reqDTO
    * @return
    */
    @Operation(summary = "分页查找")
    @RequiresPermissions("repo:repo:view")
    @PostMapping("/paging")
    public ApiRest<IPage<RepoListRespDTO>> paging(@RequestBody PagingReqDTO<RepoDTO> reqDTO) {

        //分页查询并转换
        IPage<RepoListRespDTO> page = repoService.paging(reqDTO);

        return super.success(page);
    }

    /**
     * 查找列表，每次最多返回200条数据
     * @param reqDTO
     * @return
     */
    @Operation(summary = "查找列表")
    @RequiresPermissions("repo:repo:view")
    @PostMapping("/list")
    public ApiRest<List<RepoDTO>> list(@RequestBody RepoDTO reqDTO) {
        // 查找列表
        List<RepoDTO> dtoList = repoService.list(reqDTO);
        return super.success(dtoList);
    }
}
