package com.yf.base.utils.jackson;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;


/**
 * JSON工具类
 *
 * @author van
 */
@Log4j2
public class JsonHelper {

    /**
     * 转换为字符串
     *
     * @param obj
     * @return
     */
    public static String toJson(Object obj) {

        ObjectMapper mapper = getMapper();

        try {
            return mapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将字符转换为java对象
     *
     * @param json
     * @param clazz
     * @return
     */
    public static <T> T parseObject(String json, Class<T> clazz) {
        ObjectMapper mapper = getMapper();
        try {
            return mapper.readValue(json, clazz);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将对象转换为另外一个对象
     *
     * @param object
     * @param clazz
     * @return
     */
    public static <T> T parseObject(Object object, Class<T> clazz) {
        ObjectMapper mapper = getMapper();
        try {
            return mapper.readValue(toJson(object), clazz);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 复杂对象的转换
     *
     * @param object
     * @param typeReference
     * @param <T>
     * @return
     */
    public static <T> T parseObject(Object object, TypeReference<T> typeReference) {
        ObjectMapper mapper = getMapper();
        try {
            return mapper.readValue(toJson(object), typeReference);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 复杂对象的转换
     *
     * @param json
     * @param typeReference
     * @param <T>
     * @return
     */
    public static <T> T parseObject(String json, TypeReference<T> typeReference) {
        ObjectMapper mapper = getMapper();
        try {
            return mapper.readValue(json, typeReference);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 获取转换配置
     *
     * @return
     */
    public static ObjectMapper getMapper() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT, true);
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        objectMapper.configure(JsonParser.Feature.ALLOW_SINGLE_QUOTES, true);
        objectMapper.disable(SerializationFeature.FAIL_ON_EMPTY_BEANS);
        return objectMapper;
    }
}
