package com.yf.modules.exam.paper.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.BaseIdReqDTO;
import com.yf.base.api.api.dto.BaseIdsReqDTO;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.modules.exam.paper.dto.PaperQuDTO;
import com.yf.modules.exam.paper.dto.reponse.PaperQuCardRespDTO;
import com.yf.modules.exam.paper.dto.reponse.PaperQuFillRespDTO;
import com.yf.modules.exam.paper.dto.request.PaperQuFillReqDTO;
import com.yf.modules.exam.paper.service.PaperQuService;
import com.yf.modules.exam.repo.dto.request.RepoQuDetailDTO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* <p>
* 试卷考题控制器
* </p>
*
* @author 聪明笨狗
* @since 2025-04-14 17:40
*/
@Tag(name="试卷考题")
@RestController
@RequestMapping("/api/exam/paper/qu")
public class PaperQuController extends BaseController {

    @Autowired
    private PaperQuService baseService;



    /**
    * 试题详情
    * @param reqDTO
    * @return
    */
    @Operation(summary = "试题详情", description = "查找试题详情用于答题")
    @PostMapping("/detail-for-answer")
    public ApiRest<RepoQuDetailDTO> detail(@RequestBody BaseIdReqDTO reqDTO) {
        RepoQuDetailDTO dto = baseService.detailForAnswer(reqDTO.getId());
        return super.success(dto);
    }


    /**
     * 查找答题卡列表
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
     * @param reqDTO
     * @return
     */
    @Operation(summary = "进行答题", description = "答题填充答案")
    @PostMapping("/fill-answer")
    public ApiRest<PaperQuFillRespDTO> fillAnswer(@RequestBody PaperQuFillReqDTO reqDTO) {
        PaperQuFillRespDTO respDTO = baseService.fillAnswer(reqDTO);
        return super.success(respDTO);
    }
}
