package com.yf.config;


import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {


    @Bean
    public OpenAPI docsOpenApi() {
        return new OpenAPI()
                .info(new Info().title("云帆考试系统")
                        .description("云帆考试系统V2版本接口文档")
                        .version("v2.0"))
                .externalDocs(new ExternalDocumentation()
                        .description("云帆互联")
                        .url("https://www.yfhl.net"));
    }


    @Bean
    public GroupedOpenApi commonApi() {
        return GroupedOpenApi.builder().group("公共能力模块")
                .pathsToMatch("/api/common/**")
                .build();
    }

    @Bean
    public GroupedOpenApi sysApi() {
        return GroupedOpenApi.builder().group("系统模块接口")
                .pathsToMatch("/api/sys/**")
                .build();
    }

    @Bean
    public GroupedOpenApi examApi() {
        return GroupedOpenApi.builder().group("考试模块接口")
                .pathsToMatch("/api/exam/**")
                .build();
    }

}
