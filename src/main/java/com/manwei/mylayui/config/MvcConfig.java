package com.manwei.mylayui.config;


import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.format.FormatterRegistry;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author 高亚轩
 * @date 2018/10/24 0024 下午 4:23
 */

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.manwei.mylayui.controller")
@PropertySource(value = "classpath:application.properties", ignoreResourceNotFound = true, encoding = "UTF-8")
public class MvcConfig implements WebMvcConfigurer {


    /**
     * 配置静态资源路径
     *
     * @param registry registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
    }


}
