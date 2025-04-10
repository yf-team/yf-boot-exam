package com.yf.config;

// import com.yf.system.aspect.mybatis.QueryInterceptor;
// import com.yf.system.aspect.mybatis.UpdateInterceptor;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Mybatis过滤器配置
 * 注意：必须按顺序进行配置，否则容易出现业务异常
 *
 * @author bool
 */
@Configuration
@MapperScan("com.yf.**.mapper")
public class MybatisConfig {


    /**
     * 添加分页插件
     */
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
        return interceptor;
    }


//    /**
//     * 数据查询过滤器
//     */
//    @Bean
//    public QueryInterceptor queryInterceptor() {
//        QueryInterceptor query = new QueryInterceptor();
//        query.setLimit(-1L);
//        return query;
//    }

//    /**
//     * 插入数据过滤器
//     */
//    @Bean
//    public UpdateInterceptor updateInterceptor() {
//        return new UpdateInterceptor();
//    }


}
