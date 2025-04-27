package com.yf.system.modules.plugin.controller;

import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.BaseIdReqDTO;
import com.yf.system.modules.plugin.dto.PluginSchemaDTO;
import com.yf.system.modules.plugin.service.PluginSchemaService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 插件元数据控制器
 * </p>
 *
 * @author 聪明笨狗
 * @since 2022-09-05 10:05
 */
@Tag(name = "插件元数据")
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/sys/plugin/schema")
public class PluginSchemaController extends BaseController {

    private final PluginSchemaService baseService;


    /**
     * 查找详情
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary = "查找详情")
    @PostMapping("/detail")
    public ApiRest<PluginSchemaDTO> detail(@RequestBody BaseIdReqDTO reqDTO) {
        PluginSchemaDTO dto = baseService.detail(reqDTO.getId());
        return super.success(dto);
    }
}
