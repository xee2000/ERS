package kr.ac.ers.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.ac.ers.interceptor.BeforeActionInterceptor;
import kr.ac.ers.interceptor.LsupporterInterceptor;

@Configuration
public class MyWebMvcConfigurer implements WebMvcConfigurer {
	
	// NeedLogoutInterceptor 불러오기
	@Autowired
	LsupporterInterceptor lsupporterInterceptor;
	
	@Autowired
	BeforeActionInterceptor beforeActionInterceptor;

	// 이 함수는 인터셉터를 적용하는 역할을 합니다.
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		InterceptorRegistration ir;
		ir = registry.addInterceptor(beforeActionInterceptor);
		ir.addPathPatterns("/**");
		ir.excludePathPatterns("/error");
		ir.excludePathPatterns("/resource/**");
		
		ir = registry.addInterceptor(lsupporterInterceptor);
		ir.addPathPatterns("/ers/lsupporter/login");
		ir.addPathPatterns("/ers/lsupporter/logout");
	}
}
