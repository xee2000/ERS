package kr.ac.ers.controller.lsupporter;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.ac.ers.command.ReportModifyCommand;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.LsupporterVO;
import kr.ac.ers.dto.MemberReportLsupporterVO;
import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.dto.ReportFileVO;
import kr.ac.ers.service.LsupporterService;
import kr.ac.ers.utils.MakeFileName;
import kr.ac.ers.view.FileDownloadView;

@Controller
public class LsupporterReportController {

	@Value("${lsupporterfileUploadPath}")
	private String lsupporterfileUploadPath;

	@Autowired
	private LsupporterService lsupporterService;
	

	@RequestMapping("/ers/lsupporter/membersearch")
	public String Showmembersearch() {
		return "lsupporter/membersearch";
	}
	
	
	
	@RequestMapping("/ers/lsupporter/reportModifyForm")
	public String ShowmodifyForm(Model model, int rNo) throws Exception {
		
		MemberReportLsupporterVO reportlsupporter = lsupporterService.getreportLsupporterForModify(rNo);
		
		// 파일명 재정의
		if (reportlsupporter != null) {
			List<ReportFileVO> reportFileList = reportlsupporter.getReportFileList();
			if (reportFileList != null) {
				for (ReportFileVO reportFile : reportFileList) {
					String fileName = 
					MakeFileName.parseFileNameFromUUID(reportFile.getFilename(), "\\$\\$");
					reportFile.setFilename(fileName);
				}
			}
		}
		
		model.addAttribute("reportlsupporter",reportlsupporter);
		return "lsupporter/reportModifyForm";
	}
	
	 
	 @RequestMapping("/ers/lsupporter/reportForm")
		public String ShowreportForm(String id,HttpServletRequest request,HttpSession session,Model model) {
		 session= request.getSession();
		 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
	MemberVO member = lsupporterService.getmemById(id);
		 int wCode = loginUser.getWCode();
		String member_id = member.getId();
		String member_name =  member.getName();
		model.addAttribute("wCode",wCode);
		model.addAttribute("member_id",member_id);
		model.addAttribute("member_name",member_name);
			return "lsupporter/reportForm";
		}
	 
	
	@PostMapping(value = "/ers/lsupporter/reportregist", produces = "text/plain;charset=utf-8")
	public String reportregist(@DateTimeFormat(pattern = "yyyy-MM-dd")MemberReportLsupporterVO reportlsupporter,HttpSession session, HttpServletRequest request) throws Exception {
		String url = "redirect:/ers/lsupporter/memberdetail?id="+reportlsupporter.getId();
		session = request.getSession();
		LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		List<MultipartFile> multiFiles = reportlsupporter.getUploadFile();
		String savePath = this.lsupporterfileUploadPath;		
		List<ReportFileVO> reportfileList = saveFileToAttaches(multiFiles,savePath);
			//DB 	
			reportlsupporter.setReportFileList(reportfileList);
			lsupporterService.reportregist(reportlsupporter,loginUser.getWid());
		return url;
	}
	
	@PostMapping(value="/ers/lsupporter/reportModify", produces = "text/plain;charset=utf-8")
	public String modifyPOST(ReportModifyCommand modifyReq ,Model model, int rNo)throws Exception{
		String url="/ers/lsupporter/reportdetail?rNo="+rNo;
		// 파일 삭제
		if (modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for (String anoStr : modifyReq.getDeleteFile()) {
				int sfNo = Integer.parseInt(anoStr);
				ReportFileVO reportfile = lsupporterService.getReportFileBysfNo(sfNo);
				File deleteFile = new File(reportfile.getUploadpath(), reportfile.getFilename());
				
				if (deleteFile.exists()) {
					deleteFile.delete(); // File 삭제
				}
				lsupporterService.removeReportFileBysfNo(sfNo); // DB 삭제
				
			}
		}
		
		//파일저장
		List<ReportFileVO> reportFileList = saveFileToAttaches(modifyReq.getUploadFile(),lsupporterfileUploadPath);
		MemberReportLsupporterVO reportlsupporter = modifyReq.toreportVO();
		reportlsupporter.setReportFileList(reportFileList);
		
		
		model.addAttribute("reportlsupporter",reportlsupporter);
		
		return url;
	}
	
	
	
	@RequestMapping("/ers/lsupporter/reportdetail")
	public String detail(int rNo,Model model)throws Exception{
		MemberReportLsupporterVO reportlsupporter = null;

		
		reportlsupporter = lsupporterService.getreportLsupporterForModify(rNo);
		
		// 파일명 재정의
		if (reportlsupporter != null) {
			List<ReportFileVO> reportFileList = reportlsupporter.getReportFileList();
			if (reportFileList != null) {
				for (ReportFileVO reportFile : reportFileList) {
					String fileName = 
					MakeFileName.parseFileNameFromUUID(reportFile.getFilename(), "\\$\\$");
					reportFile.setFilename(fileName);
				}
			}
		}
		model.addAttribute("reportlsupporter", reportlsupporter);

		return "lsupporter/reportdetail";
	} 

	@GetMapping("/ers/lsupporter/getFile")
	public ModelAndView getFile(int sfNo, Model model) throws Exception {
	    ModelAndView modelAndView = new ModelAndView(new FileDownloadView());

	    ReportFileVO reportfile = lsupporterService.getReportFileBysfNo(sfNo);
	    modelAndView.addObject("savedPath", reportfile.getUploadpath());
	    modelAndView.addObject("fileName", reportfile.getFilename());

	    return modelAndView;
	}

	
	
	@RequestMapping("/ers/lsupporter/nonmemberreportForm")
	public String ShownonmemberreportForm(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		int wCode = loginUser.getWCode();
		String wid = loginUser.getWid();
		model.addAttribute("wCode", wCode);
		model.addAttribute("wid", wid);
		return "lsupporter/nonmemberreportForm";
	}
	
	@RequestMapping("/ers/lsupporter/carenonmemberreportForm")
	public String ShowcarenonmemberreportForm(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		int wCode = loginUser.getWCode();
		String wid = loginUser.getWid();
		model.addAttribute("wCode", wCode);
		model.addAttribute("wid", wid);
		return "lsupporter/carenonmemberreportForm";
	}
	
	
	@RequestMapping("/ers/lsupporter/emergencynonmemberreportForm")
	public String ShowemergencynonmemberreportForm(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		int wCode = loginUser.getWCode();
		String wid = loginUser.getWid();
		model.addAttribute("wCode", wCode);
		model.addAttribute("wid", wid);
		return "lsupporter/emergencynonmemberreportForm";
	}
	
	@RequestMapping("/ers/lsupporter/LsupportermembersearchList")
	public String ShowLsupportermembersearchList(String searchType, String keyword, String perPageNum, String page,
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
		Map<String, Object> dataMap = lsupporterService.getLsupportermembersearchList(loginUser.getWid(), cri);
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("wCode", wCode);
		model.addAttribute("wid", wid);
		return "lsupporter/LsupportermembersearchList";
	}

	private List<ReportFileVO> saveFileToAttaches(List<MultipartFile> multiFiles, String savePath) throws Exception {
		List<ReportFileVO> reportfileList = new ArrayList<ReportFileVO>();
		// 저장 -> attachVO -> list.add
		if (multiFiles  != null) {
			for (MultipartFile multi : multiFiles) {
				String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
				File target = new File(savePath, fileName);
				target.mkdirs();
				multi.transferTo(target);
					
				ReportFileVO reportfile = new ReportFileVO();
				reportfile.setUploadpath(savePath);
				reportfile.setFilename(fileName);
				reportfile.setFiletype(fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase());
				reportfileList.add(reportfile);
			}
		}
		return reportfileList;
	}
	
	
	@PostMapping(value = "/ers/lsupporter/nonmemberreportregist", produces = "text/plain;charset=utf-8")
	public String regist(@DateTimeFormat(pattern = "yyyy-MM-dd")MemberReportLsupporterVO reportlsupporter,HttpSession session, HttpServletRequest request) throws Exception {
		String url = "redirect:/ers/lsupporter/reportlist";
		session = request.getSession();
		LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		List<MultipartFile> multiFiles = reportlsupporter.getUploadFile();
		String savePath = this.lsupporterfileUploadPath;		
		List<ReportFileVO> reportfileList = saveFileToAttaches(multiFiles,savePath);
			//DB 	
			reportlsupporter.setReportFileList(reportfileList);
			lsupporterService.reportregist(reportlsupporter,loginUser.getWid());
		return url;
	}
	
	@PostMapping(value = "/ers/lsupporter/emergencynonmemberreportregist", produces = "text/plain;charset=utf-8")
	public String emergencyregist(@DateTimeFormat(pattern = "yyyy-MM-dd")MemberReportLsupporterVO reportlsupporter,HttpSession session, HttpServletRequest request) throws Exception {
		String url = "redirect:/ers/lsupporter/emergencylist";
		session = request.getSession();
		LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		List<MultipartFile> multiFiles = reportlsupporter.getUploadFile();
		String savePath = this.lsupporterfileUploadPath;		
		List<ReportFileVO> reportfileList = saveFileToAttaches(multiFiles,savePath);
			//DB 	
			reportlsupporter.setReportFileList(reportfileList);
			lsupporterService.reportregist(reportlsupporter,loginUser.getWid());
		return url;
	}
	
	@PostMapping(value = "/ers/lsupporter/carenonmemberreportregist", produces = "text/plain;charset=utf-8")
	public String careregist(@DateTimeFormat(pattern = "yyyy-MM-dd")MemberReportLsupporterVO reportlsupporter,HttpSession session, HttpServletRequest request) throws Exception {
		String url = "redirect:/ers/lsupporter/carelist";
		session = request.getSession();
		LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		List<MultipartFile> multiFiles = reportlsupporter.getUploadFile();
		String savePath = this.lsupporterfileUploadPath;		
		List<ReportFileVO> reportfileList = saveFileToAttaches(multiFiles,savePath);
			//DB 	
			reportlsupporter.setReportFileList(reportfileList);
			lsupporterService.reportregist(reportlsupporter,loginUser.getWid());
		return url;
	}

	
	@RequestMapping(value = "/ers/lsupporter/reportlistremove", produces = "text/plain;charset=utf-8")
	public String reportlistremove(int rNo) throws Exception {
		String url = "redirect:/ers/lsupporter/reportlist";
		MemberReportLsupporterVO reportlsupporter = lsupporterService.getReportByRNo(rNo);
		List<ReportFileVO> reportFileList = reportlsupporter.getReportFileList();
		if(reportFileList != null) for(ReportFileVO reportfile: reportFileList) {
			
			String savedPath = reportfile.getUploadpath();
			String fileName = reportfile.getFilename();
			
			File file = new File(savedPath+File.separator+fileName);
			
			if(file.exists())file.delete();
			
		}

		lsupporterService.remove(rNo);
		return url;
	}
	
	@RequestMapping(value = "/ers/lsupporter/emergencyremove", produces = "text/plain;charset=utf-8")
	public String emergencyremove(int rNo) throws Exception {
		String url = "redirect:/ers/lsupporter/emergencylist";
		MemberReportLsupporterVO reportlsupporter = lsupporterService.getReportByRNo(rNo);
		List<ReportFileVO> reportFileList = reportlsupporter.getReportFileList();
		if(reportFileList != null) for(ReportFileVO reportfile: reportFileList) {
			
			String savedPath = reportfile.getUploadpath();
			String fileName = reportfile.getFilename();
			
			File file = new File(savedPath+File.separator+fileName);
			
			if(file.exists())file.delete();
			
		}

		lsupporterService.remove(rNo);
		return url;
	}
	
	
	@RequestMapping(value = "/ers/lsupporter/carelistremove", produces = "text/plain;charset=utf-8")
	public String carelistremove(int rNo) throws Exception {
		String url = "redirect:/ers/lsupporter/carelist";
		MemberReportLsupporterVO reportlsupporter = lsupporterService.getReportByRNo(rNo);
		List<ReportFileVO> reportFileList = reportlsupporter.getReportFileList();
		if(reportFileList != null) for(ReportFileVO reportfile: reportFileList) {
			
			String savedPath = reportfile.getUploadpath();
			String fileName = reportfile.getFilename();
			
			File file = new File(savedPath+File.separator+fileName);
			
			if(file.exists())file.delete();
			
		}

		lsupporterService.remove(rNo);
		return url;
	}
	
	@RequestMapping(value = "/ers/lsupporter/nowreportListremove", produces = "text/plain;charset=utf-8")
	public String nowreportlistremove(int rNo) throws Exception {
		String url = "redirect:/ers/lsupporter/nowreportList";
		MemberReportLsupporterVO reportlsupporter = lsupporterService.getReportByRNo(rNo);
		List<ReportFileVO> reportFileList = reportlsupporter.getReportFileList();
		if(reportFileList != null) for(ReportFileVO reportfile: reportFileList) {
			
			String savedPath = reportfile.getUploadpath();
			String fileName = reportfile.getFilename();
			
			File file = new File(savedPath+File.separator+fileName);
			
			if(file.exists())file.delete();
			
		}

		lsupporterService.remove(rNo);
		return url;
	}
	
}
