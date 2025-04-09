package com.yf.base.utils;


import com.github.dozermapper.core.DozerBeanMapperBuilder;
import com.github.dozermapper.core.Mapper;
import com.github.dozermapper.core.loader.api.BeanMappingBuilder;
import com.github.dozermapper.core.loader.api.TypeMappingOptions;

import java.util.ArrayList;
import java.util.List;


/**
 * Dozer工具类，用于实体参数之间的转换和复制
 * @author Van
 * @since 2025-04-09 16:00:00
 */
public class BeanMapper {


    /**
     * 持有Dozer单例, 使用延迟初始化Holder模式保证线程安全
     */
    private static class MapperHolder {
        private static final Mapper INSTANCE = DozerBeanMapperBuilder.create()
                .withMappingBuilder(new BeanMappingBuilder() {
                    @Override
                    protected void configure() {
                        // 全局配置：使用新版API设置空值映射策略
                        mapping(Object.class,
                                Object.class,
                                TypeMappingOptions.mapNull(false),
                                TypeMappingOptions.mapEmptyString(false));
                    }
                })
                .build();
    }

    private static Mapper getMapper() {
        return MapperHolder.INSTANCE;
    }

    /**
     * 基于Dozer转换对象的类型.
     * @param source 源对象
     * @param destinationClass 目标类型
     * @return 目标对象
     */
    public static <T> T map(Object source, Class<T> destinationClass) {
        if (source == null) {
            return null;
        }
        return getMapper().map(source, destinationClass);
    }

    /**
     * 基于Dozer转换Collection中对象的类型.
     * @param sourceList 源集合
     * @param destinationClass 目标类型
     * @return 目标对象列表
     */
    public static <T> List<T> mapList(Iterable<?> sourceList, Class<T> destinationClass) {
        if (sourceList == null) {
            return null;
        }

        List<T> destinationList = new ArrayList<>();
        for (Object sourceObject : sourceList) {
            if (sourceObject != null) {
                destinationList.add(getMapper().map(sourceObject, destinationClass));
            }
        }
        return destinationList;
    }

    /**
     * 基于Dozer将对象A的值拷贝到对象B中.
     * @param source 源对象
     * @param destinationObject 目标对象
     */
    public static void copy(Object source, Object destinationObject) {
        if (source != null && destinationObject != null) {
            getMapper().map(source, destinationObject);
        }
    }
}
