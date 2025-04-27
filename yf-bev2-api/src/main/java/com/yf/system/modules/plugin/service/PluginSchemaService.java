package com.yf.system.modules.plugin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.system.modules.plugin.dto.PluginSchemaDTO;
import com.yf.system.modules.plugin.entity.PluginSchema;

/**
 * <p>
 * 插件元数据业务接口类
 * </p>
 *
 * @author 聪明笨狗
 * @since 2022-09-05 10:05
 */
public interface PluginSchemaService extends IService<PluginSchema> {


    /**
     * 查找详情
     *
     * @param id
     * @return
     */
    PluginSchemaDTO detail(String id);

}
