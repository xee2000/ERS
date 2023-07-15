package kr.ac.ers.controller.lsupporter;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.LsupporterVO;
import kr.ac.ers.dto.NoticeVO;
import kr.ac.ers.service.LsupporterService;

@Controller
public class LsupporterListController {
	
	 @Autowired
	 private LsupporterService lsupporterService;
	 
	 
	 
	 @RequestMapping("/ers/lsupporter/nowreportList")
		public String Shownowcare(String searchType,String keyword, String perPageNum, String page, Model model, HttpServletRequest request,HttpSession session) {
		 SearchCriteria cri = new SearchCriteria();
			if(perPageNum == null || perPageNum.isEmpty())perPageNum="5";
			if(page == null || page.isEmpty())page="1";
			if(searchType == null) searchType="";
			if(keyword==null) keyword="";
			cri.setPage(page);
			cri.setPerPageNum(perPageNum);
			cri.setSearchType(searchType);
			cri.setKeyword(keyword);
			 session= request.getSession();
			 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
			 Map<String, Object> dataMap = lsupporterService.getNowReportList(cri,loginUser.getWid());
			model.addAttribute("dataMap", dataMap);		
			return "lsupporter/nowreportList";
		}
	
	 


		@RequestMapping("/ers/lsupporter/carelist")
		public String Showcarelist(String searchType,String keyword, String perPageNum, String page, Model model, HttpServletRequest request,HttpSession session) {
			SearchCriteria cri = new SearchCriteria();
			if(perPageNum == null || perPageNum.isEmpty())perPageNum="5";
			if(page == null || page.isEmpty())page="1";
			if(searchType == null) searchType="";
			if(keyword==null) keyword="";
			cri.setPage(page);
			cri.setPerPageNum(perPageNum);
			cri.setSearchType(searchType);
			cri.setKeyword(keyword);
			 session= request.getSession();
			 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
			 Map<String, Object> dataMap = lsupporterService.getLsupportercarelist(cri,loginUser.getWid());
			model.addAttribute("dataMap", dataMap);		
			return "lsupporter/carelist";
		}
		@RequestMapping("/ers/lsupporter/reportlist")
		public String Showreportlist(String searchType, String keyword, String perPageNum, String page,String startday, String endday, Model model, HttpSession session,HttpServletRequest request) {
			SearchCriteria cri = new SearchCriteria();
			if(perPageNum == null || perPageNum.isEmpty())perPageNum="5";
			if(page == null || page.isEmpty())page="1";
			if(searchType == null) searchType="";
			if(keyword==null) keyword="";
			cri.setPage(page);
			cri.setPerPageNum(perPageNum);
			cri.setSearchType(searchType);
			cri.setKeyword(keyword);
			session= request.getSession();
			 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
			Map<String, Object> dataMap = lsupporterService.getReportList(cri,loginUser.getWid(),startday,endday);
			model.addAttribute("dataMap", dataMap);
			
			return "lsupporter/reportlist";
		}
		

		@RequestMapping("/ers/lsupporter/emergencylist")
		public String Showemergancylist(String searchType, String keyword, String perPageNum, String page,Model model,String startday, String endday, HttpServletRequest request, HttpServletResponse response , HttpSession session) {
			SearchCriteria cri = new SearchCriteria();
			if(perPageNum == null || perPageNum.isEmpty())perPageNum="5";
			if(page == null || page.isEmpty())page="1";
			if(searchType == null) searchType="";
			if(keyword==null) keyword="";
			cri.setPage(page);
			cri.setPerPageNum(perPageNum);
			cri.setSearchType(searchType);
			cri.setKeyword(keyword);
			
			session= request.getSession();
			 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
			 
		 
			Map<String,Object> dataMap = lsupporterService.getemergencyList(cri,loginUser.getWid(),startday,endday);
		
			model.addAttribute("dataMap", dataMap);
			return "lsupporter/emergencylist";
		}
		
		
		@RequestMapping("/ers/lsupporter/list")
		public String Showtlist() {
			
			return "lsupporter/list";
		}
		
		   @GetMapping("/ers/lsupporter/notice")
		   public String logout(String searchType, String keyword, String perPageNum, String page,Model model,String startday, String endday) throws Exception {
		      
		      SearchCriteria cri = new SearchCriteria();
				if(perPageNum == null || perPageNum.isEmpty())perPageNum="10";
				if(page == null || page.isEmpty())page="1";
				if(searchType == null) searchType="";
				if(keyword==null) keyword="";
				cri.setPage(page);
				cri.setPerPageNum(perPageNum);
				cri.setSearchType(searchType);
				cri.setKeyword(keyword);
				Map<String,Object> dataMap =  lsupporterService.noticeList(cri,startday,endday);
		     model.addAttribute("dataMap",dataMap);

		      return "lsupporter/notice";
		   }

		
}
