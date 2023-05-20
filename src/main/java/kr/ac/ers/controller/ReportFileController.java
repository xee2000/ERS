package kr.ac.ers.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import jakarta.annotation.Resource;
import kr.ac.ers.dto.MemberReportLsupporterVO;
import kr.ac.ers.dto.ReportFileVO;
import kr.ac.ers.service.ReportFileService;
import kr.ac.ers.utils.MakeFileName;

@Controller
public class ReportFileController {

	/*
	 * @Autowired private ReportFileService reportFileService;
	 * 
	 * @Resource(name = "fileUploadPath") private String fileUploadPath;
	 * 
	 */

	private List<ReportFileVO> saveFileToReportList(List<MultipartFile> multiFiles, String savePath) throws Exception {
		List<ReportFileVO> reportFileList = new ArrayList<ReportFileVO>();
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

				reportFileList.add(reportfile);
			}
		}
		return reportFileList;
	}

	/*
	 * @PostMapping(value = "/regist", produces = "text/plain;charset=utf-8") public
	 * String regist(ReportFileVO reportfile) throws Exception { String url =
	 * "/ers/reportList";
	 * 
	 * List<MultipartFile> multiFiles = reportfile.getUploadFile(); String savePath
	 * = this.fileUploadPath;
	 * 
	 * List<ReportFileVO> reportList = saveFileToReportList(multiFiles, savePath);
	 * 
	 * // DB ReportFileVO file = reportfile.toReportFileVO();
	 * file.setReportList(reportList);
	 * 
	 * reportFileService.regist(file);
	 * 
	 * return url; }
	 */

	/*
	 * @GetMapping("/detail") public ModelAndView detail(int pno, String
	 * from,ModelAndView mnv)throws Exception{ String url = "/pds/detail";
	 * 
	 * PdsVO pds = null; if (from != null && from.equals("list")) { pds =
	 * pdsService.getPds(pno); url = "redirect:/pds/detail.do?pno="+pno;
	 * mnv.setViewName(url); return mnv; }
	 * 
	 * pds = pdsService.getPdsForModify(pno);
	 * 
	 * // 파일명 재정의 if (pds != null) { List<AttachVO> attachList =
	 * pds.getAttachList(); if (attachList != null) { for (AttachVO attach :
	 * attachList) { String fileName =
	 * MakeFileName.parseFileNameFromUUID(attach.getFileName(), "\\$\\$");
	 * attach.setFileName(fileName); } } }
	 * 
	 * mnv.addObject("pds", pds); mnv.setViewName(url);
	 * 
	 * return mnv; }
	 * 
	 * @GetMapping("/modifyForm") public ModelAndView modifyForm(ModelAndView mnv,
	 * int pno) throws Exception { String url = "/pds/modify";
	 * 
	 * PdsVO pds = pdsService.getPdsForModify(pno);
	 * 
	 * // 파일명 재정의 if (pds != null) { List<AttachVO> attachList =
	 * pds.getAttachList(); if (attachList != null) { for (AttachVO attach :
	 * attachList) { String fileName =
	 * MakeFileName.parseFileNameFromUUID(attach.getFileName(), "\\$\\$");
	 * attach.setFileName(fileName); } } }
	 * 
	 * mnv.addObject("pds",pds); mnv.setViewName(url); return mnv; }
	 * 
	 * 
	 * @PostMapping(value="/modify", produces = "text/plain;charset=utf-8") public
	 * String modifyPOST(PdsModifyCommand modifyReq,Model model)throws Exception{
	 * String url="/pds/modify_success";
	 * 
	 * // 파일 삭제 if (modifyReq.getDeleteFile() != null &&
	 * modifyReq.getDeleteFile().length > 0) { for (String anoStr :
	 * modifyReq.getDeleteFile()) { int ano = Integer.parseInt(anoStr); AttachVO
	 * attach = pdsService.getAttachByAno(ano);
	 * 
	 * File deleteFile = new File(attach.getUploadPath(), attach.getFileName());
	 * 
	 * if (deleteFile.exists()) { deleteFile.delete(); // File 삭제 }
	 * pdsService.removeAttachByAno(ano); // DB 삭제
	 * 
	 * } }
	 * 
	 * //파일저장 List<AttachVO> attachList =
	 * saveFileToAttaches(modifyReq.getUploadFile(), fileUploadPath);
	 * 
	 * // PdsVO settting PdsVO pds = modifyReq.toPdsVO();
	 * pds.setAttachList(attachList);
	 * 
	 * // DB 저장 pdsService.modify(pds);
	 * 
	 * model.addAttribute("pds",pds);
	 * 
	 * return url; }
	 * 
	 * @GetMapping("/getFile") public String getFile(int ano,Model model) throws
	 * Exception {
	 * 
	 * String url="downloadFile"; //bean name
	 * 
	 * AttachVO attach = pdsService.getAttachByAno(ano);
	 * 
	 * 
	 * model.addAttribute("savedPath", attach.getUploadPath());
	 * model.addAttribute("fileName", attach.getFileName());
	 * 
	 * return url; }
	 */
}
