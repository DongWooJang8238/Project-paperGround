package org.joonzis.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.extern.log4j.Log4j;

@Log4j
@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
    	
    	log.warn("이미지 로드.. 로드.. 로드..");
        registry.addResourceHandler("/images/**")
                .addResourceLocations("file:///C:/upload/");
        // 로그 출력
        System.out.println("WebConfig is initialized and resource handler is set.");
    }
}

