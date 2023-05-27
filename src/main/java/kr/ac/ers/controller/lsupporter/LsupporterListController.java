package kr.ac.ers.controller.lsupporter;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.LsupporterVO;
import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.service.LsupporterService;

@Controller
public class LsupporterListController {
	
	 @Autowired
	 private LsupporterService lsupporterService;
	 
	 
	 
	 @RequestMapping("/ers/lsupporter/nowcare")
		public String Shownowcare() {
			return "lsupporter/nowcare";
		}
	
	 

		@RequestMapping("/ers/lsupporter/carelist")
		public String Showcarelist(String searchType,String keyword, String perPageNum, String page, Model model, HttpServletRequest request,HttpSession session) {
			SearchCriteria cri = new SearchCriteria();
			if(perPageNum == null || perPageNum.isEmpty())perPageNum="10";
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
		public String Showreportlist(String searchType, String keyword, String perPageNum, String page, Model model, HttpSession session, HttpServletRequest request) {
			SearchCriteria cri = new SearchCriteria();
			if(perPageNum == null || perPageNum.isEmpty())perPageNum="10";
			if(page == null || page.isEmpty())page="1";
			if(searchType == null) searchType="";
			if(keyword==null) keyword="";
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
		
		@GetMapping("/ers/lsupporter/reportlistAction")
		@ResponseBody
		public Map<String,Object> Showreportlist(String searchType,String keyword, String perPageNum, String page, Model model, HttpServletRequest request,HttpSession session) throws SQLException {
			 
			SearchCriteria cri = new SearchCriteria();
			
			if (cri.getPerPageNum() == 0) {
		    	
		        cri.setPerPageNum(5);
		    }
		    if (cri.getPage()==0) {
		    	cri.setPage(1);
		    }
		    if (searchType == null||searchType.isEmpty()) {
		        cri.setSearchType("");
		    }else {
		    	cri.setSearchType(searchType);
		    	}
		    if (keyword== null||keyword.isEmpty()) {
		        cri.setKeyword("");
		    }else {
		    	cri.setKeyword(keyword);
		    }
			
				 session= request.getSession();
				 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
				Map<String, Object> dataMap = lsupporterService.getMemberList(cri,loginUser.getWid());
			
				return dataMap;
		}


		@RequestMapping("/ers/lsupporter/emergencylist")
		public String Showemergancylist(String searchType, String keyword, String perPageNum, String page,Model model, HttpServletRequest request, HttpServletResponse response , HttpSession session) {
			SearchCriteria cri = new SearchCriteria();
			if(perPageNum == null || perPageNum.isEmpty())perPageNum="10";
			if(page == null || page.isEmpty())page="1";
			if(searchType == null) searchType="";
			if(keyword==null) keyword="";
			cri.setPage(page);
			cri.setPerPageNum(perPageNum);
			cri.setSearchType(searchType);
			cri.setKeyword(keyword);
			
			session= request.getSession();
			 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
			 
		 
			Map<String,Object> dataMap = lsupporterService.getemergencyList(loginUser.getWid(),cri);
		
			model.addAttribute("dataMap", dataMap);
			return "lsupporter/emergencylist";
		}
		
		
}
