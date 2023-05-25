package kr.ac.ers.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.LsupporterVO;
import kr.ac.ers.dto.MemberDetailVO;
import kr.ac.ers.dto.MemberReportLsupporterVO;
import kr.ac.ers.dto.ReportFileVO;
import kr.ac.ers.service.LsupporterService;
import kr.ac.ers.utils.MakeFileName;

@Controller
public class LsupporterReportController {

	@Value("${fileUploadPath}")
	private String fileUploadPath;

	@Autowired
	private LsupporterService lsupporterService;
	

	@RequestMapping("/ers/lsupporter/membersearch")
	public String Showmembersearch() {
		return "lsupporter/membersearch";
	}

	@RequestMapping("/ers/lsupporter/reportdetail")
	public String Showreportdetail(Model model,int rNo) {
		MemberDetailVO reportdetail = lsupporterService.getReportDetail(rNo);
		model.addAttribute("reportdetail",reportdetail);
		return "lsupporter/reportdetail";
	}

	@RequestMapping("/ers/lsupporter/nonmemberreportForm")
	public String ShownonmemberreportForm(String searchType, String keyword, String perPageNum, String page,
			Model model, HttpSession session, HttpServletRequest request) {
		SearchCriteria cri = new SearchCriteria();
		if (perPageNum == null || perPageNum.isEmpty())
			perPageNum = "5";
		if (page == null || page.isEmpty())
			page = "1";
		if (searchType == null)
			searchType = "";
		if (keyword == null)
			keyword = "";
		cri.setPage(page);
		cri.setPerPageNum(perPageNum);
		cri.setSearchType(searchType);
		cri.setKeyword(keyword);
		session = request.getSession();
		LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		int wCode = loginUser.getWCode();
		String wid = loginUser.getWid();
		Map<String, Object> dataMap = lsupporterService.getLsupporterMemberList(loginUser.getWid(), cri);
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("wCode", wCode);
		model.addAttribute("wid", wid);
		return "lsupporter/nonmemberreportForm";
	}

	private List<ReportFileVO> saveFileToAttaches(List<MultipartFile> multiFiles, String savePath) throws Exception {
		List<ReportFileVO> reportfileList = new ArrayList<ReportFileVO>();
		// 저장 -> attachVO -> list.add
		if (multiFiles != null) {
			for (MultipartFile multi : multiFiles) {
				String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
				File target = new File(savePath, fileName);
				target.mkdirs();
				multi.transferTo(target);

				ReportFileVO reportfile = new ReportFileVO();
				reportfile.setUploadpath(savePath);
				reportfile.setFilename(fileName);
				reportfile.setFiletype(savePath);
				reportfileList.add(reportfile);
			}
		}
		return reportfileList;
	}
	
	
	@PostMapping(value = "/ers/lsupporter/nonmemberreportregist", produces = "text/plain;charset=utf-8")
	public String regist(MemberReportLsupporterVO reportlsupporter,HttpSession session, HttpServletRequest request) throws Exception {
		String url = "redirect:/ers/lsupporter/reportlist";
		session = request.getSession();
		LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		List<MultipartFile> multiFiles = reportlsupporter.getUploadFile();
		String savePath = this.fileUploadPath;		
		List<ReportFileVO> reportfileList = saveFileToAttaches(multiFiles,savePath);
		//DB 	
		reportlsupporter.setReportFileList(reportfileList);
		lsupporterService.reportregist(reportlsupporter,loginUser.getWid());
		return url;
	}

	@GetMapping("/ers/lsupporter/nonmemberreportFormAction")
	@ResponseBody
	public Map<String, Object> shownonmemberreportFormAction(@RequestParam String searchType,
			@RequestParam String keyword, HttpSession session, HttpServletRequest request) {

		SearchCriteria cri = new SearchCriteria();

		if (cri.getPerPageNum() == 0) {

			cri.setPerPageNum(5);
		}
		if (cri.getPage() == 0) {
			cri.setPage(1);
		}
		if (searchType == null || searchType.isEmpty()) {
			cri.setSearchType("");
		} else {
			cri.setSearchType(searchType);
		}
		if (keyword == null || keyword.isEmpty()) {
			cri.setKeyword("");
		} else {
			cri.setKeyword(keyword);
		}
		session = request.getSession();
		LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		Map<String, Object> dataMap = lsupporterService.getLsupporterMemberList(loginUser.getWid(), cri);
		return dataMap;
	}

}
