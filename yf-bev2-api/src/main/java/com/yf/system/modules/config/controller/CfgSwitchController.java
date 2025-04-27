package com.yf.system.modules.config.controller;

import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.system.modules.config.service.CfgSwitchService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * <p>
 * 通用配置控制器
 * </p>
 *
 * @author 聪明笨狗
 * @since 2020-04-17 09:12
 */
@Tag(name = "功能配置")
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/sys/config/switch")
public class CfgSwitchController extends BaseController {

    private final CfgSwitchService baseService;


    /**
     * 保存功能开关
     *
     * @param map
     * @return
     */
    @Operation(summary = "添加或修改")
    @PostMapping("/save")
    public ApiRest<?> save(@RequestBody Map<String, Object> map) {
        baseService.save(map);
        return super.success();
    }

    /**
     * 查找配置详情
     *
     * @return
     */
    @Operation(summary = "查找详情")
    @PostMapping("/detail")
    public ApiRest<?> detail() {
        Map<String, Object> map = baseService.allMap();
        return super.success(map);
    }
}
