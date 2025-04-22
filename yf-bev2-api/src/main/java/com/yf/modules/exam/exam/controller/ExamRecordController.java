package com.yf.modules.exam.exam.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.modules.exam.exam.dto.ExamRecordDTO;
import com.yf.modules.exam.exam.dto.request.ExamRecordListReqDTO;
import com.yf.modules.exam.exam.service.ExamRecordService;
import com.yf.system.modules.user.UserUtils;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
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
@Tag(name = "考试记录")
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/exam/exam/record")
public class ExamRecordController extends BaseController {

    private final ExamRecordService examRecordService;


    /**
     * 分页查找
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "分页查找")
    @RequiresPermissions("exam:record:list")
    @PostMapping("/paging")
    public ApiRest<IPage<ExamRecordDTO>> paging(@RequestBody PagingReqDTO<ExamRecordListReqDTO> reqDTO) {

        //分页查询并转换
        IPage<ExamRecordDTO> page = examRecordService.paging(reqDTO);

        return super.success(page);
    }


    /**
     * 分页查找
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "分页查找")
    @PostMapping("/client-paging")
    public ApiRest<IPage<ExamRecordDTO>> clientPaging(@RequestBody PagingReqDTO<ExamRecordListReqDTO> reqDTO) {

        ExamRecordListReqDTO params = reqDTO.getParams();
        if (params == null) {
            params = new ExamRecordListReqDTO();
        }

        // 限定查找自己的考试记录
        params.setUserId(UserUtils.getUserId());

        //分页查询并转换
        IPage<ExamRecordDTO> page = examRecordService.clientPaging(reqDTO);

        return super.success(page);
    }

}
