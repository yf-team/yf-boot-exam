package com.yf.modules.exam.paper.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.BaseIdReqDTO;
import com.yf.base.api.api.dto.BaseIdRespDTO;
import com.yf.base.api.api.dto.BaseIdsReqDTO;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.modules.exam.paper.dto.PaperDTO;
import com.yf.modules.exam.paper.dto.response.PaperCheckRespDTO;
import com.yf.modules.exam.paper.dto.response.PaperRealTimeRespDTO;
import com.yf.modules.exam.paper.service.PaperService;
import com.yf.system.modules.user.UserUtils;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 试卷控制器
 * </p>
 *
 * @author 聪明笨狗
 * @since 2025-04-14 17:40
 */
@Tag(name = "试卷")
@RestController
@RequestMapping("/api/exam/paper/paper")
public class PaperController extends BaseController {

    @Autowired
    private PaperService baseService;

    /**
     * 添加或修改
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "添加或修改")
    @RequestMapping(value = "/save", method = {RequestMethod.POST})
    public ApiRest<?> save(@RequestBody PaperDTO reqDTO) {
        baseService.save(reqDTO);
        return super.success();
    }

    /**
     * 批量删除
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "批量删除")
    @RequestMapping(value = "/delete", method = {RequestMethod.POST})
    public ApiRest<?> delete(@RequestBody BaseIdsReqDTO reqDTO) {
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
    @Operation(summary = "查找详情")
    @RequestMapping(value = "/detail", method = {RequestMethod.POST})
    public ApiRest<PaperDTO> detail(@RequestBody BaseIdReqDTO reqDTO) {
        PaperDTO dto = baseService.detail(reqDTO.getId());
        return super.success(dto);
    }

    /**
     * 分页查找
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "分页查找")
    @RequestMapping(value = "/paging", method = {RequestMethod.POST})
    public ApiRest<IPage<PaperDTO>> paging(@RequestBody PagingReqDTO<PaperDTO> reqDTO) {

        //分页查询并转换
        IPage<PaperDTO> page = baseService.paging(reqDTO);

        return super.success(page);
    }

    /**
     * 创建考试
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "考试校验", description = "学员进入考试")
    @PostMapping("/pre-check")
    public ApiRest<PaperCheckRespDTO> preCheck(@RequestBody BaseIdReqDTO reqDTO) {
        PaperCheckRespDTO respDTO = baseService.preCheck(reqDTO.getId(), UserUtils.getUserId());
        return super.success(respDTO);
    }


    /**
     * 创建考试
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "创建考试", description = "学员进入考试")
    @PostMapping("/create")
    public ApiRest<BaseIdRespDTO> create(@RequestBody BaseIdReqDTO reqDTO) {
        //分页查询并转换
        String paperId = baseService.createPaper(reqDTO.getId(), UserUtils.getUserId());
        return super.success(new BaseIdRespDTO(paperId));
    }

    /**
     * 学员交卷
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "学员交卷", description = "学员主动交卷")
    @PostMapping("/hand")
    public ApiRest<BaseIdRespDTO> hand(@RequestBody BaseIdReqDTO reqDTO) {
        baseService.handPaper(reqDTO.getId());
        return super.success();
    }


    /**
     * 获取试卷的实时状态
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "获取试卷的实时状态", description = "获取试卷的实时状态，包含剩余时间、是否已交卷等")
    @PostMapping("/real-time-state")
    public ApiRest<PaperRealTimeRespDTO> realTimeState(@RequestBody BaseIdReqDTO reqDTO) {
        PaperRealTimeRespDTO respDTO = baseService.realTimeState(reqDTO.getId());
        return super.success(respDTO);
    }
}
