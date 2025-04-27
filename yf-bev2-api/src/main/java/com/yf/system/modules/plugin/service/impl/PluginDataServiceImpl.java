package com.yf.system.modules.plugin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.core.type.TypeReference;
import com.yf.base.api.api.dto.PagingReqDTO;
import com.yf.base.api.exception.ServiceException;
import com.yf.base.utils.BeanMapper;
import com.yf.base.utils.jackson.JsonHelper;
import com.yf.system.modules.plugin.dto.PluginDataDTO;
import com.yf.system.modules.plugin.entity.PluginData;
import com.yf.system.modules.plugin.mapper.PluginDataMapper;
import com.yf.system.modules.plugin.service.PluginDataService;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 插件信息业务实现类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2022-09-05 10:05
 */
@Log4j2
@Service
public class PluginDataServiceImpl extends ServiceImpl<PluginDataMapper, PluginData> implements PluginDataService {

    @Override
    public IPage<PluginDataDTO> paging(PagingReqDTO<PluginDataDTO> reqDTO) {

        //查询条件
        QueryWrapper<PluginData> wrapper = new QueryWrapper<>();
        //获得数据
        IPage<PluginData> page = this.page(reqDTO.toPage(), wrapper);
        //转换结果
        return JsonHelper.parseObject(page, new TypeReference<Page<PluginDataDTO>>() {});
    }


    @Override
    public void save(PluginDataDTO reqDTO) {
        //复制参数
        PluginData entity = new PluginData();
        BeanMapper.copy(reqDTO, entity);
        this.saveOrUpdate(entity);
    }

    @Override
    public String findConfig(String code) {
        //分页查询并转换
        QueryWrapper<PluginData> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(PluginData::getCode, code);

        PluginData data = this.getOne(wrapper, false);
        if (data == null) {
            throw new ServiceException("插件配置不存在！");
        }

        return data.getConfigData();
    }

    @Override
    public String findServiceClazz(String groupId) {
        //分页查询并转换
        QueryWrapper<PluginData> wrapper = new QueryWrapper<>();
        wrapper.lambda()
                .eq(PluginData::getGroupId, groupId)
                .orderByDesc(PluginData::getInUse);

        PluginData data = this.getOne(wrapper, false);
        if (data == null) {
            throw new ServiceException("插件配置不存在！");
        }

        return data.getServiceClazz();
    }
}
