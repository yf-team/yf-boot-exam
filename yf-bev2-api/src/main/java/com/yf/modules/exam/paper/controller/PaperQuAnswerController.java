package com.yf.modules.exam.paper.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.BaseIdReqDTO;
import com.yf.base.api.api.dto.BaseIdsReqDTO;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.modules.exam.paper.dto.PaperQuAnswerDTO;
import com.yf.modules.exam.paper.service.PaperQuAnswerService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
* <p>
* 试卷考题备选答案控制器
* </p>
*
* @author 聪明笨狗
* @since 2025-04-14 17:40
*/
@Tag(name="试卷考题备选答案")
@RestController
@RequestMapping("/api/exam/paper/paper-qu-answer")
public class PaperQuAnswerController extends BaseController {

    @Autowired
    private PaperQuAnswerService baseService;

    /**
    * 添加或修改
    * @param reqDTO
    * @return
    */
    @Operation(summary = "添加或修改")
    @RequestMapping(value = "/save", method = { RequestMethod.POST})
    public ApiRest<?> save(@RequestBody PaperQuAnswerDTO reqDTO) {
        baseService.save(reqDTO);
        return super.success();
    }

    /**
    * 批量删除
    * @param reqDTO
    * @return
    */
    @Operation(summary = "批量删除")
    @RequestMapping(value = "/delete", method = { RequestMethod.POST})
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
    @Operation(summary = "查找详情")
    @RequestMapping(value = "/detail", method = { RequestMethod.POST})
    public ApiRest<PaperQuAnswerDTO> detail(@RequestBody BaseIdReqDTO reqDTO) {
        PaperQuAnswerDTO dto = baseService.detail(reqDTO.getId());
        return super.success(dto);
    }

    /**
    * 分页查找
    * @param reqDTO
    * @return
    */
    @Operation(summary = "分页查找")
    @RequestMapping(value = "/paging", method = { RequestMethod.POST})
    public ApiRest<IPage<PaperQuAnswerDTO>> paging(@RequestBody PagingReqDTO<PaperQuAnswerDTO> reqDTO) {

        //分页查询并转换
        IPage<PaperQuAnswerDTO> page = baseService.paging(reqDTO);

        return super.success(page);
    }

    /**
     * 查找列表，每次最多返回200条数据
     * @param reqDTO
     * @return
     */
    @Operation(summary = "查找列表")
    @RequestMapping(value = "/list", method = { RequestMethod.POST})
    public ApiRest<List<PaperQuAnswerDTO>> list(@RequestBody PaperQuAnswerDTO reqDTO) {
        // 查找列表
        List<PaperQuAnswerDTO> dtoList = baseService.list(reqDTO);
        return super.success(dtoList);
    }
}
