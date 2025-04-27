package com.yf.system.modules.plugin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yf.base.utils.BeanMapper;
import com.yf.system.modules.plugin.dto.PluginSchemaDTO;
import com.yf.system.modules.plugin.entity.PluginSchema;
import com.yf.system.modules.plugin.mapper.PluginSchemaMapper;
import com.yf.system.modules.plugin.service.PluginSchemaService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 插件元数据业务实现类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2022-09-05 10:05
 */
@Service
public class PluginSchemaServiceImpl extends ServiceImpl<PluginSchemaMapper, PluginSchema> implements PluginSchemaService {


    @Override
    public PluginSchemaDTO detail(String id) {
        PluginSchema entity = this.getById(id);
        PluginSchemaDTO dto = new PluginSchemaDTO();
        BeanMapper.copy(entity, dto);
        return dto;
    }
}
