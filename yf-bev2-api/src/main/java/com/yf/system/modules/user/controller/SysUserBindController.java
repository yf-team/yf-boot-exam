package com.yf.system.modules.user.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yf.base.api.api.ApiRest;
import com.yf.base.api.api.controller.BaseController;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.system.modules.user.dto.SysUserBindDTO;
import com.yf.system.modules.user.service.SysUserBindService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
* <p>
* 登录绑定控制器
* </p>
*
* @author 聪明笨狗
* @since 2021-08-02 14:49
*/
@Tag(name="登录绑定")
@RestController
@RequestMapping("/api/sys/user/bind")
@RequiredArgsConstructor
public class SysUserBindController extends BaseController {

    private final SysUserBindService baseService;


    /**
    * 绑定列表
    * @param reqDTO
    * @return
    */
    @Operation(summary = "绑定列表")
    @RequestMapping(value = "/paging", method = { RequestMethod.POST})
    public ApiRest<IPage<SysUserBindDTO>> paging(@RequestBody PagingReqDTO<SysUserBindDTO> reqDTO) {

        //分页查询并转换
        IPage<SysUserBindDTO> page = baseService.paging(reqDTO);

        return super.success(page);
    }

    /**
     * 绑定列表
     * @param reqDTO
     * @return
     */
    @Operation(summary = "绑定列表", description = "前端查询绑定列表")
    @RequestMapping(value = "/bind-list", method = { RequestMethod.POST})
    public ApiRest<IPage<SysUserBindDTO>> bindList(@RequestBody PagingReqDTO<SysUserBindDTO> reqDTO) {

        //分页查询并转换
        IPage<SysUserBindDTO> page = baseService.paging(reqDTO);

        return super.success(page);
    }
}
