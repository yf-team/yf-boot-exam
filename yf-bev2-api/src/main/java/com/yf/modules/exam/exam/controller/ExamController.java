package com.yf.modules.exam.exam.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.BaseIdReqDTO;
import com.yf.base.api.api.dto.BaseIdsReqDTO;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.modules.exam.exam.dto.ExamDTO;
import com.yf.modules.exam.exam.dto.request.ExamListReqDTO;
import com.yf.modules.exam.exam.dto.response.ExamDetailDTO;
import com.yf.modules.exam.exam.service.ExamService;
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
 * 考试控制器
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:29
 */
@Tag(name = "考试管理")
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/exam/exam/exam")
public class ExamController extends BaseController {

    private final ExamService examService;

    /**
     * 添加或修改
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "添加或修改")
    @RequiresPermissions(value = {"exam:exam:add", "exam:exam:edit"}, logical = Logical.OR)
    @PostMapping("/save")
    public ApiRest<?> save(@RequestBody ExamDetailDTO reqDTO) {
        examService.save(reqDTO);
        return super.success();
    }

    /**
     * 批量删除
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "批量删除")
    @RequiresPermissions("exam:exam:delete")
    @PostMapping("/delete")
    public ApiRest<?> delete(@RequestBody BaseIdsReqDTO reqDTO) {
        //根据ID删除
        examService.delete(reqDTO.getIds());
        return super.success();
    }

    /**
     * 查找详情
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "查找详情")
    @RequiresPermissions("exam:exam:view")
    @PostMapping("/detail")
    public ApiRest<ExamDetailDTO> detail(@RequestBody BaseIdReqDTO reqDTO) {
        ExamDetailDTO dto = examService.detail(reqDTO.getId());
        return super.success(dto);
    }

    /**
     * 分页查找
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "分页查找")
    @RequiresPermissions("exam:exam:view")
    @PostMapping("/paging")
    public ApiRest<IPage<ExamDTO>> paging(@RequestBody PagingReqDTO<ExamListReqDTO> reqDTO) {

        //分页查询并转换
        IPage<ExamDTO> page = examService.paging(reqDTO);

        return super.success(page);
    }


    /**
     * 详情用于考试
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "详情用于考试")
    @PostMapping("/detail-for-exam")
    public ApiRest<ExamDetailDTO> detailForExam(@RequestBody BaseIdReqDTO reqDTO) {
        ExamDetailDTO dto = examService.detail(reqDTO.getId());
        return super.success(dto);
    }

    /**
     * 分页查找
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "分页查找")
    @PostMapping("/client-paging")
    public ApiRest<IPage<ExamDTO>> clientPaging(@RequestBody PagingReqDTO<ExamListReqDTO> reqDTO) {

        //分页查询并转换
        IPage<ExamDTO> page = examService.paging(reqDTO);

        return super.success(page);
    }
}
