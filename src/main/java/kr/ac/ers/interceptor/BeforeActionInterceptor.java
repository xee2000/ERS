package kr.ac.ers.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.ers.service.LsupporterService;

@Component
public class BeforeActionInterceptor implements HandlerInterceptor {
	
	@Autowired
	private LsupporterService lsupporterService;
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		return HandlerInterceptor.super.preHandle(req, resp, handler);
	}
}
