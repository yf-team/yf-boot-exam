package com.yf.mudules.exam.repo.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yf.boot.base.api.api.ApiRest;
import com.yf.boot.base.api.api.controller.BaseController;
import com.yf.boot.base.api.api.dto.BaseIdReqDTO;
import com.yf.boot.base.api.api.dto.BaseIdRespDTO;
import com.yf.boot.base.api.api.dto.BaseIdsReqDTO;
import com.yf.boot.base.api.api.dto.PagingReqDTO;
import com.yf.boot.base.api.utils.BeanMapper;
import com.yf.mudules.exam.repo.dto.RepoQuDTO;
import com.yf.mudules.exam.repo.entity.RepoQu;
import com.yf.mudules.exam.repo.service.RepoQuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
* <p>
* 问题题目控制器
* </p>
*
* @author 聪明笨狗
* @since 2025-04-11 09:42
*/
@Api(tags={"问题题目"})
@RestController
@RequestMapping("/api/exam/repo/repo-qu")
public class RepoQuController extends BaseController {

    @Autowired
    private RepoQuService baseService;

    /**
    * 添加或修改
    * @param reqDTO
    * @return
    */
    @ApiOperation(value = "添加或修改")
    @RequestMapping(value = "/save", method = { RequestMethod.POST})
    public ApiRest save(@RequestBody RepoQuDTO reqDTO) {
        baseService.save(reqDTO);
        return super.success();
    }

    /**
    * 批量删除
    * @param reqDTO
    * @return
    */
    @ApiOperation(value = "批量删除")
    @RequestMapping(value = "/delete", method = { RequestMethod.POST})
    public ApiRest delete(@RequestBody BaseIdsReqDTO reqDTO) {
        //根据ID删除
        baseService.delete(reqDTO.getIds());
        return super.success();
    }

    /**
    * 查找详情
    * @param reqDTO
    * @return
    */
    @ApiOperation(value = "查找详情")
    @RequestMapping(value = "/detail", method = { RequestMethod.POST})
    public ApiRest<RepoQuDTO> detail(@RequestBody BaseIdReqDTO reqDTO) {
        RepoQuDTO dto = baseService.detail(reqDTO.getId());
        return super.success(dto);
    }

    /**
    * 分页查找
    * @param reqDTO
    * @return
    */
    @ApiOperation(value = "分页查找")
    @RequestMapping(value = "/paging", method = { RequestMethod.POST})
    public ApiRest<IPage<RepoQuDTO>> paging(@RequestBody PagingReqDTO<RepoQuDTO> reqDTO) {

        //分页查询并转换
        IPage<RepoQuDTO> page = baseService.paging(reqDTO);

        return super.success(page);
    }

    /**
     * 查找列表，每次最多返回200条数据
     * @param reqDTO
     * @return
     */
    @ApiOperation(value = "查找列表")
    @RequestMapping(value = "/list", method = { RequestMethod.POST})
    public ApiRest<List<RepoQuDTO>> list(@RequestBody RepoQuDTO reqDTO) {
        // 查找列表
        List<RepoQuDTO> dtoList = baseService.list(reqDTO);
        return super.success(dtoList);
    }
}
