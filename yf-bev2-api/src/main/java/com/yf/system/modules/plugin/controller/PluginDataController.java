package com.yf.system.modules.plugin.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.system.modules.plugin.dto.PluginDataDTO;
import com.yf.system.modules.plugin.service.PluginDataService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 插件信息控制器
 * </p>
 *
 * @author 聪明笨狗
 * @since 2022-09-05 10:05
 */
@Tag(name = "插件信息")
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/sys/plugin/data")
public class PluginDataController extends BaseController {

    private final PluginDataService baseService;

    /**
     * 添加或修改
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "添加或修改")
    @PostMapping("/save")
    public ApiRest<?> save(@RequestBody PluginDataDTO reqDTO) {
        baseService.save(reqDTO);
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
    public ApiRest<IPage<PluginDataDTO>> paging(@RequestBody PagingReqDTO<PluginDataDTO> reqDTO) {

        //分页查询并转换
        IPage<PluginDataDTO> page = baseService.paging(reqDTO);

        return super.success(page);
    }

}
