package com.yf.ability.upload.factory;

import com.yf.ability.upload.service.UploadService;
import com.yf.base.utils.SpringUtils;
import com.yf.system.modules.plugin.service.PluginDataService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

/**
 * 服务器端上传文件方法
 *
 * @author van
 */
@Log4j2
@RequiredArgsConstructor
@Service
public class UploadFactory {

    /**
     * 配置分组
     */
    private static final String GROUP_ID = "upload";

    private final PluginDataService pluginDataService;

    /**
     * 获取工厂实例
     *
     * @return
     */
    public UploadService getService() {

        // 获得实现类
        String clazz = pluginDataService.findServiceClazz(GROUP_ID);

        log.info("+++++服务实现类：" + clazz);

        try {
            return (UploadService) SpringUtils.getBean(Class.forName(clazz));
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
