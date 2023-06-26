package kr.ac.ers.controller.lsupporter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.ers.service.OAuthService;

@Controller
public class OAuthController {
	
	@Autowired
	private OAuthService oAuthService;
	
	 @ResponseBody
	    @GetMapping("/oauth/kakao")
	    public void kakaoCallback(@RequestParam String code) {
		 oAuthService.getKakaoAccessToken(code);
	        System.out.println(code);
	    }
}
