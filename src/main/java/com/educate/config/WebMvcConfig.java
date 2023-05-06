package com.educate.config;

import com.educate.config.Interceptor.UserInterceptor;
import com.educate.entity.dto.UserInfo;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class WebMvcConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        UserInterceptor adminInterceptor=new UserInterceptor(UserInfo.ADMIN);
        UserInterceptor teacherInterceptor=new UserInterceptor(UserInfo.TEACHER);
        UserInterceptor studentInterceptor=new UserInterceptor(UserInfo.STUDENT);

        registry.addInterceptor(adminInterceptor).addPathPatterns("/admin/**");
        registry.addInterceptor(teacherInterceptor).addPathPatterns("/teacher/**");
        registry.addInterceptor(studentInterceptor).addPathPatterns("/student/**");
    }
}
