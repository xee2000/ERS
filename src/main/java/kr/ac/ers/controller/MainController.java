package kr.ac.ers.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.service.MemberService;

@Controller
public class MainController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/main/index")
	public String root(Model model) {
		List<MemberVO> memberlist = memberService.getMemberList();
		model.addAttribute("memberlist", memberlist);
		return "main/index";
	}
	
}
