package com.yf.config.shiro;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.Collection;
import java.util.Set;
import java.util.concurrent.TimeUnit;

public class ShiroRedisCacheManager implements CacheManager {

    private final RedisTemplate<String, Object> redisTemplate;
    private final Long expireSeconds;

    public ShiroRedisCacheManager(RedisTemplate<String, Object> redisTemplate, Long expireSeconds) {
        this.redisTemplate = redisTemplate;

        // 默认30分钟
        if (expireSeconds == null) {
            expireSeconds = 1800L;
        }
        this.expireSeconds = expireSeconds;
    }

    @Override
    public <K, V> Cache<K, V> getCache(String name) {
        return new Cache<K, V>() {
            private final String prefix = "shiro:" + name + ":";

            @Override
            public V get(K key) throws CacheException {
                return (V) redisTemplate.opsForValue().get(prefix + key);
            }

            @Override
            public V put(K key, V value) throws CacheException {
                redisTemplate.opsForValue().set(prefix + key, value, expireSeconds, TimeUnit.SECONDS);
                return value;
            }

            @Override
            public V remove(K key) throws CacheException {
                V value = get(key);
                redisTemplate.delete(prefix + key);
                return value;
            }

            // 以下方法按需实现（极简版直接留空）
            @Override public void clear() throws CacheException {}
            @Override public int size() { return 0; }
            @Override public Set<K> keys() { return null; }
            @Override public Collection<V> values() { return null; }
        };
    }
}