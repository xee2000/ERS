package kr.ac.ers.Intercepter;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginCheckInterceptor implements HandlerInterceptor {
   	@Override
   	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
   		HttpSession session = request.getSession(false);
   		if (session == null || session.getAttribute("loginUser") == null) {
   			System.out.println("사용자 인요청");
   			//로그인으로 redirect
   			response.sendRedirect("/ers/lsupporter/loginForm");
   			return false;
  		 }
          return true;
  	 }
  }