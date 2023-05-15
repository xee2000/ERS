package kr.ac.ers.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.LsupporterVO;
import kr.ac.ers.dto.SearchCriteria;
import kr.ac.ers.service.LsupporterService;
import kr.ac.ers.utils.MailContentSend;

@Controller
public class LsupporterController {
	
	 @Autowired
	 private LsupporterService lsupporterService;
	
	@RequestMapping("/ers/lsupporter/main")
	public String Showmain() {
		return "lsupporter/main";
	}
	@RequestMapping("/ers/lsupporter/loginForm")
	public String Showlogin() {
		return "lsupporter/loginForm";
	}
	@RequestMapping("/ers/lsupporter/mypage")
	public String Showmypage() {
		return "lsupporter/mypage";
	}
	@RequestMapping("/ers/lsupporter/nowcare")
	public String Shownowcare() {
		return "lsupporter/nowcare";
	}

	@RequestMapping("/ers/lsupporter/carelist")
	public String Showcarelist() {
		return "lsupporter/carelist";
	}
	@RequestMapping("/ers/lsupporter/memberdetail")
	public String Showmemberdetail() {
		return "lsupporter/memberdetail";
	}
	@RequestMapping("/ers/lsupporter/membersearch")
	public String Showmembersearch() {
		return "lsupporter/membersearch";
	}
	@RequestMapping("/ers/lsupporter/reportForm")
	public String ShowreportFormh() {
		return "lsupporter/reportForm";
	}
	@RequestMapping("/ers/lsupporter/idcheckForm")
	public String ShowidcheckForm() {
		return "lsupporter/idcheckForm";
	}
	@RequestMapping("/ers/lsupporter/pwcheckForm")
	public String ShowpwcheckForm() {
		return "lsupporter/pwcheckForm";
	}
	
	
	@RequestMapping("/ers/lsupporter/nonmemberreportForm")
	public String ShownonmemberreportForm(@RequestParam(defaultValue = "0")int gubun, String searchType, String keyword, String perPageNumParam, String pageParam, Model model, HttpSession session, HttpServletRequest request) {
		SearchCriteria cri = new SearchCriteria();
		if(perPageNumParam == null || perPageNumParam.isEmpty())perPageNumParam="5";
		if(pageParam == null || pageParam.isEmpty())pageParam="1";
		if(searchType == null) searchType="";
		if(keyword==null) keyword="";
		cri.setPage(pageParam);
		cri.setPerPageNum(perPageNumParam);
		cri.setSearchType(searchType);
		cri.setKeyword(keyword);
		session= request.getSession();
		 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		 Map<String,Object> dataMap = lsupporterService.getLsupporterMemberList(loginUser.getWid(), cri);
		 model.addAttribute("dataMap",dataMap);
		 model.addAttribute("gubun", gubun);
		return "lsupporter/nonmemberreportForm";
	}
	
	
	@GetMapping("/ers/lsupporter/lsupporterstatus")
	public String showLsupporterStatus(Model model, HttpSession session, HttpServletRequest request) {
		 session= request.getSession();
		 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		 LsupporterStatusVO lsupporter = lsupporterService.selectlsupporterStatus(loginUser.getWid());
	    
	    model.addAttribute("lsupporter", lsupporter);
	    return "lsupporter/lsupporterstatus";
	}

	
	@RequestMapping("/ers/lsupporter/reportlist")
	public String Showreportlist(String searchType,String keyword, String perPageNum, String page, Model model, HttpServletRequest request,HttpSession session) {
		if(perPageNum == null || perPageNum.isEmpty()) perPageNum = "10";
		if(page == null || page.isEmpty()) page = "1";
		
		if(searchType==null) searchType = "";
		if(keyword==null) keyword = "";
		if(searchType.equals("")) {
			searchType = "";
			keyword="";
		}
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(page);
		cri.setPerPageNum(perPageNum);
		cri.setSearchType(searchType);
		cri.setKeyword(keyword);
		
		try {
			 session= request.getSession();
			 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
			Map<String, Object> dataMap = lsupporterService.getMemberList(cri,loginUser.getWid());
			model.addAttribute("dataMap", dataMap);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "lsupporter/reportlist";
	}
	@RequestMapping("/ers/lsupporter/emergancylist")
	public String Showemergancylist() {
		return "lsupporter/emergancylist";
	}
	@RequestMapping("/ers/lsupporter/emergancydetail")
	public String Showemergancydetail() {
		return "lsupporter/emergancydetail";
	}
	@RequestMapping("/ers/lsupporter/calmain")
	public String Showcalmain() {
		return "lsupporter/calmain";
	}
	
	@PostMapping("/ers/lsupporter/idcheck")
	public String Showidcheck(String name, String email, HttpServletRequest request, HttpServletResponse response) {
		String url = null;
		
		int result = lsupporterService.findwidLsupporter(name,email);
		System.out.println("name :" +name);
		if(result == 1) {
			
			LsupporterVO lsupporterwid = lsupporterService.getLsupporterByWid(email);
			String mailSet_Server="smtp.naver.com"; // 보내는 메일 server
			String mailSet_ID="xee2000";        // 보내는 메일 ID
			String mailSet_PW="dlwjdgh0***";        // 보내는 메일 비밀번호
			
			String mailFromName ="응급안심안전서비스 입니다.";            // 보내는 사람 이름
			String mailFromAddress ="<xee2000@naver.com>"; // 보내는 메일 주소
			
			String mailTo   = (request).getParameter("email");           // 받는  메일 주소
			String mailTitle ="응급안전안심서비스 아이디 찾기 관련 메일 보내드립니다.";   // 메일 제목
			String content = "고객님의 ID는 " + lsupporterwid.getWid() + "입니다"; // 메일내용
			
			String mailFrom="";
			try {
				 mailFrom =new String(mailFromName.getBytes("utf-8"), "8859_1")+mailFromAddress;
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			MailContentSend ms = new MailContentSend();
			ms.setMail(mailSet_Server, mailSet_ID, mailSet_PW);
			try { 
				ms.sendMail(mailFrom,mailTo, mailTitle, content);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setContentType("text/plain;charset=utf-8");
			url = "/ers/lsupporter/loginForm";
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print(url);
			out.close();
			
			
			
		}else {
			String error = "없는 정보입니다 다시 입력해주세요.";
			url = "findLsupporterWidForm&error="+error;
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print(url);
			out.close();
		}
		
		return url;
	}
	
	@PostMapping("/ers/lsupporter/pwcheck")
	public String Showpwcheck(String name, String email, String wid, HttpServletRequest request, HttpServletResponse response) {
		String url = null;
		 final String ePw = createKey();
		int result = lsupporterService.findpwdLsupporter(name,email, wid);
		if(result == 1) {
			
			String mailSet_Server="smtp.naver.com"; // 보내는 메일 server
			String mailSet_ID="xee2000";        // 보내는 메일 ID
			String mailSet_PW="dlwjdgh0***";        // 보내는 메일 비밀번호
			
			String mailFromName ="응급안심안전서비스 입니다.";            // 보내는 사람 이름
			String mailFromAddress ="<xee2000@naver.com>"; // 보내는 메일 주소
			
			String mailTo   = (request).getParameter("email");           // 받는  메일 주소
			String mailTitle ="응급안전안심서비스 비밀번호 찾기 관련 메일 보내드립니다.";   // 메일 제목
			String content = "인증코드는 " + ePw + "입니다"; // 메일내용
			
			String mailFrom="";
			try {
				 mailFrom =new String(mailFromName.getBytes("utf-8"), "8859_1")+mailFromAddress;
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			MailContentSend ms = new MailContentSend();
			ms.setMail(mailSet_Server, mailSet_ID, mailSet_PW);
			try { 
				ms.sendMail(mailFrom,mailTo, mailTitle, content);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print(url);
			out.close();
			
			
			
		}else {
			String error = "없는 정보입니다 다시 입력해주세요.";
			url = "findLsupporterWidForm&error="+error;
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print(url);
			out.close();
		}
		
		return url;
	}
	
	
	private String createKey() {
		        StringBuffer key = new StringBuffer();
		        Random rnd = new Random();
		 
		        for (int i = 0; i < 8; i++) { // 인증코드 8자리
		            int index = rnd.nextInt(3); // 0~2 까지 랜덤
		 
		            switch (index) {
		                case 0:
		                    key.append((char) ((int) (rnd.nextInt(26)) + 97));
		                    //  a~z  (ex. 1+97=98 => (char)98 = 'b')
		                    break;
		                case 1:
		                    key.append((char) ((int) (rnd.nextInt(26)) + 65));
		                    //  A~Z
		                    break;
		                case 2:
		                    key.append((rnd.nextInt(10)));
		                    // 0~9
		                    break;
		            }
		        }
		        return key.toString();
	}
	@PostMapping("/ers/lsupporter/login")
	   public String login(String wid, String pwd, HttpSession session) throws Exception {
	      String url = "redirect:/ers/lsupporter/main";
	      String message;

	      int result = lsupporterService.login(wid, pwd);

	      switch (result) {
	      case 0: //로그인 성공
	    	  LsupporterVO loginUser = lsupporterService.getLsupporter(wid);
	         session.setAttribute("loginUser", loginUser);
	         session.setMaxInactiveInterval(600 * 100);
	         return url;
	      case 1: //아이디 불일치
	         url="redirect:/ers/lsupporter/loginForm";
	         message="아이디를 잘못입력하셨습니다.";
	         return message;
	      case 2: //패스워드 불일치
	    	  url="redirect:/ers/lsupporter/loginForm";
	    	  message="패스워드를 잘못입력하셨습니다.";
	    	  return message;
	    	  
	      }

	      return url;
	   }
	
	 
	   @GetMapping("/ers/lsupporter/logout")
	   public String logout(HttpSession session) throws Exception {
	      String url = "redirect:/ers/lsupporter/loginForm";

	      session.invalidate();

	      return url;
	   }

	
	
}
