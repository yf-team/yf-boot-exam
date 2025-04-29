package com.yf.modules.exam.paper.controller;

import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.BaseIdReqDTO;
import com.yf.modules.exam.paper.dto.request.PaperDetailReqDTO;
import com.yf.modules.exam.paper.dto.request.PaperQuFillReqDTO;
import com.yf.modules.exam.paper.dto.response.PaperQuCardRespDTO;
import com.yf.modules.exam.paper.dto.response.PaperQuDetailDTO;
import com.yf.modules.exam.paper.dto.response.PaperQuFillRespDTO;
import com.yf.modules.exam.paper.service.PaperQuService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 试卷考题控制器
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:40
 */
@Tag(name = "在线考试")
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/exam/paper/qu")
public class PaperQuController extends BaseController {

    private final PaperQuService baseService;

    /**
     * 试题详情
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "试题详情", description = "查找试题详情用于答题")
    @PostMapping("/detail-for-answer")
    public ApiRest<PaperQuDetailDTO> detail(@RequestBody PaperDetailReqDTO reqDTO) {
        PaperQuDetailDTO dto = baseService.detailForAnswer(reqDTO.getPaperId(), reqDTO.getQuId());
        return super.success(dto);
    }


    /**
     * 查找答题卡列表
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "查找答题卡列表")
    @PostMapping("/list-card")
    public ApiRest<List<PaperQuCardRespDTO>> list(@RequestBody BaseIdReqDTO reqDTO) {
        // 查找列表
        List<PaperQuCardRespDTO> dtoList = baseService.listQuCard(reqDTO.getId());
        return super.success(dtoList);
    }

    /**
     * 进行答题"
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "保存答题", description = "考试过程中实时保存答题内容")
    @PostMapping("/fill-answer")
    public ApiRest<PaperQuFillRespDTO> fillAnswer(@RequestBody PaperQuFillReqDTO reqDTO) {
        PaperQuFillRespDTO respDTO = baseService.fillAnswer(reqDTO);
        return super.success(respDTO);
    }
}
