package kr.ac.ers.interceptor;


import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.ers.dto.LsupporterVO;

@Component
public class LsupporterInterceptor implements HandlerInterceptor {

	
	public String preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler,HttpSession session) throws Exception {
		 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		if (loginUser == null) {
				return "ers/lsupporter/loginForm";
			}
		return "ers/lsupporter/main";
	}
}
