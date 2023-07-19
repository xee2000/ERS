package kr.ac.ers.controller.lsupporter;



import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.ers.command.NoticeFileWriteCommand;
import kr.ac.ers.command.NoticeModifyCommand;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.CalinderVO;
import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.LsupporterVO;
import kr.ac.ers.dto.MemberDetailVO;
import kr.ac.ers.dto.MemberReportLsupporterVO;
import kr.ac.ers.dto.NoticeFileVO;
import kr.ac.ers.dto.NoticeVO;
import kr.ac.ers.dto.ReplyVO;
import kr.ac.ers.service.LsupporterService;
import kr.ac.ers.utils.MailContentSend;
import kr.ac.ers.utils.MakeFileName;
import kr.ac.ers.view.FileDownloadView;

@Controller
public class LsupporterController {
	
	 @Autowired
	 private LsupporterService lsupporterService;
	 
	 @Value("${lsupporterpicturePath}")
		private String lsupporterpicturePath;
	 

		@Value("${noticefileuploadpath}")
		private String noticefileuploadpath;
	
	@RequestMapping("/ers/lsupporter/main")
	public String Showmain(Model model, HttpServletRequest request,HttpSession session) {
		session= request.getSession();
		 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		 LsupporterStatusVO lsupporterstatus = lsupporterService.selectlsupporterStatus(loginUser.getWid());
		int futureDate =  lsupporterService.getmaineducationfutureDate(loginUser.getWid());
		int clearDate =  lsupporterService.getmaineducationclearDate(loginUser.getWid());
		int notmachine =  lsupporterService.getmaineducationnotmachine(loginUser.getWid());
		int emergencyall = lsupporterService.getmainemergencyall(loginUser.getWid());
		int emergencymiss = lsupporterService.getmainemergencymiss(loginUser.getWid());
		int emergencyclear = lsupporterService.getmainemergencyclear(loginUser.getWid());
		
		model.addAttribute("lsupporterstatus",lsupporterstatus);
		model.addAttribute("futureDate",futureDate);
		model.addAttribute("clearDate",clearDate);
		model.addAttribute("notmachine",notmachine);
		model.addAttribute("emergencyall",emergencyall);
		model.addAttribute("emergencymiss",emergencymiss);
		model.addAttribute("emergencyclear",emergencyclear);
		
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
	
	@RequestMapping("/ers/lsupporter/memberdetail")
	public String Showmemberdetail(String searchType,String keyword, String perPageNum, String page, Model model,String id, HttpServletRequest request,HttpSession session,String startday,String endday) {
		 
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
		Map<String,Object> dataMap = new HashMap<String,Object> ();
		 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		 Map<String,Object> reportListMap =lsupporterService.getReportList(cri,loginUser.getWid(),startday,endday);
		MemberDetailVO memberdetail = lsupporterService.getMemberDetail(loginUser.getWid(),id);
		List<MemberDetailVO> machinList = lsupporterService.getMembermachin(loginUser.getWid(),id);
		List<MemberDetailVO> memberEcall = lsupporterService.getMemberEcall(loginUser.getWid(),id);
		int emergencyCount = lsupporterService.getemergencyCount(loginUser.getWid(),id);
		int fireCount = lsupporterService.getfireCount(loginUser.getWid(),id);
		
		 dataMap.put("memberdetail",memberdetail);
		 dataMap.put("memberEcall", memberEcall);
		 dataMap.put("emergencyCount", emergencyCount);
		 dataMap.put("fireCount", fireCount);
		 dataMap.put("machinList", machinList);
		 
		 model.addAttribute("dataMap", dataMap);
		 model.addAttribute("reportListMap",reportListMap);
		 return "lsupporter/memberdetail";
	}
	
	@RequestMapping("/ers/lsupporter/lifemodifyForm")
	public String Showlifeupdate(String id,HttpSession session, HttpServletRequest request, Model model) {
		 session= request.getSession();
		 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		 MemberReportLsupporterVO lifereport = lsupporterService.getlifemodifyForm(id,loginUser.getWCode());
			MemberDetailVO memberdetail = lsupporterService.getMemberDetail(loginUser.getWid(),id);
		 model.addAttribute("memberdetail", memberdetail);
		 model.addAttribute("lifereport", lifereport);
		 
		return "lsupporter/lifemodifyForm";
	}
	
	@PostMapping("/ers/lsupporter/lifemodify")
	   public String lifemodify(String orgdisease, String drug, String mentalstatus,String allergy,String id,HttpSession session, HttpServletRequest request) throws Exception {
		String url = "redirect:/ers/lsupporter/memberdetail?id="+id;
	 	 session= request.getSession();
		 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
	      lsupporterService.getlifemodify(orgdisease,drug,mentalstatus,allergy,id,loginUser.getWid());
	      return url;
	      }

	
	@RequestMapping("/ers/lsupporter/idcheckForm")
	public String ShowidcheckForm() {
		return "lsupporter/idcheckForm";
	}
	@RequestMapping("/ers/lsupporter/pwcheckForm")
	public String ShowpwcheckForm() {
		return "lsupporter/pwcheckForm";
	}
	
	@GetMapping("/ers/lsupporter/lsupporterstatus")
	public String showLsupporterStatus(Model model, HttpSession session, HttpServletRequest request) {
		 session= request.getSession();
		 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		 LsupporterStatusVO lsupporter = lsupporterService.selectlsupporterStatus(loginUser.getWid());
	    
	    model.addAttribute("lsupporter", lsupporter);
	    return "lsupporter/lsupporterstatus";
	}
	
	
	@GetMapping("/ers/lsupporter/lsupporterstatusModifyForm")
	public String showLsupporterStatusModifyForm(Model model, HttpSession session, HttpServletRequest request) {
		session= request.getSession();
		 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		 LsupporterStatusVO lsupporter = lsupporterService.selectlsupporterStatus(loginUser.getWid());
		 model.addAttribute("lsupporter", lsupporter);
	    return "lsupporter/lsupporterstatusModifyForm";
	}
	

	
	public String savePicture(String oldPicture, MultipartFile multi) throws Exception {

        String fileName = "";

        /* 파일저장폴더설정 */
        String uploadPath = this.lsupporterpicturePath;

        /* 파일유뮤확인 */
        if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 1)) {

           fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
           File storeFile = new File(uploadPath, fileName);

           // 파일경로 생성
           storeFile.mkdirs();

           // local HDD에 저장
           multi.transferTo(storeFile);

        }

        // 기존파일 삭제
        if (oldPicture != null && !oldPicture.isEmpty()) {

           File oldFile = new File(uploadPath, oldPicture);
           if (oldFile.exists()) {
              oldFile.delete();
           }

        }

        return fileName;

     }
	
	
	@RequestMapping("/ers/lsupporter/emergancydetail")
	public String Showemergancydetail() {
		return "lsupporter/emergancydetail";
	}
		
	@RequestMapping("/ers/lsupporter/sitemain")
	public String Showsitemain() {
		return "lsupporter/sitemain";
	}

	
	@RequestMapping("/ers/lsupporter/calinder")
	public String Showcalinder(HttpSession session, HttpServletRequest request, Model model) {
		
		session= request.getSession();
		 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");	
		 List<CalinderVO> calinderList = new ArrayList<CalinderVO>();
		 calinderList = lsupporterService.getcalinderList(loginUser.getWid());
		 model.addAttribute("calinderList",calinderList);
		return "lsupporter/calinder" ;
	}
	
	@RequestMapping("/ers/lsupporter/calinderdetail")
	public String Showcalinderdetail(HttpSession session, HttpServletRequest request, Model model, int id) {
		
		session= request.getSession();
		 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");	
		 CalinderVO calinder = lsupporterService.getcalinderDetail(loginUser.getWid(),id);
		 model.addAttribute("calinder",calinder);
		return "lsupporter/calinderdetail" ;
	}
	
	@RequestMapping("/ers/lsupporter/calinderregistForm")
	public String ShowcalinderregistForm(HttpSession session, HttpServletRequest request, Model model) {
		
		session= request.getSession();
		 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");	
		 model.addAttribute("wid",loginUser.getWid());
		 return "lsupporter/calinderregistForm" ;
	}
	
	@RequestMapping("/ers/lsupporter/calindermodifyForm")
	public String ShowcalindermodfiyForm(HttpSession session, HttpServletRequest request, Model model, int id) {
		
		session= request.getSession();
		 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");	
		 CalinderVO calinder = lsupporterService.getcalinderDetail(loginUser.getWid(),id);
		 model.addAttribute("calinder",calinder);
		 return "lsupporter/calindermodifyForm" ;
	}
	
	@PostMapping(value = "/ers/lsupporter/calinderregist", produces = "text/plain;charset=utf-8")
	public String Showcalinder(HttpSession session, HttpServletRequest request, Model model,
			String title, String content, @DateTimeFormat(pattern = "yyyy-MM-dd")Date regDate){
			session = request.getSession();
			LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
			lsupporterService.calinderregist(loginUser.getWid(),title,content,regDate);

	    return "lsupporter/calinder";
	}
	
	@PostMapping(value = "/ers/lsupporter/calindermodify", produces = "text/plain;charset=utf-8")
	public String Showcalindermodify(HttpSession session, HttpServletRequest request, Model model,int id,
			String title, String content, @DateTimeFormat(pattern = "yyyy-MM-dd")Date regDate, @DateTimeFormat(pattern ="yyyy-MM-dd")Date updateDate){
			session = request.getSession();
			LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
			lsupporterService.calindermodify(loginUser.getWid(),id,title,content,regDate,updateDate);
	    return "lsupporter/calinder";
	}
	
	@PostMapping(value = "/ers/lsupporter/calinderremove", produces = "text/plain;charset=utf-8")
	public String Showcalinderremove(HttpSession session, HttpServletRequest request, Model model,int id
			){
			session = request.getSession();
			LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
			lsupporterService.calinderremove(loginUser.getWid(),id);
	    return "lsupporter/calinder";
	}

	
	@PostMapping("/ers/lsupporter/idcheck")
	public String Showidcheck(String name, String email, HttpServletRequest request, HttpServletResponse response) {
		String url = null;
		
		int result = lsupporterService.selectcountemail(name,email);
		System.out.println("name :" +name);
		if(result == 1) {
			
			LsupporterVO lsupporterwid = lsupporterService.getLsupportByemail(email);
			String mailSet_Server="smtp.naver.com"; // 보내는 메일 server
			String mailSet_ID="xee2000";        // 보내는 메일 ID
			String mailSet_PW="dlwjdgh0**^";        // 보내는 메일 비밀번호
			
			String mailFromName ="EmergencyService.";            // 보내는 사람 이름
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

	    int result = lsupporterService.login(wid, pwd);
	    switch (result) {
	        case 0: // login successful
	            LsupporterVO loginUser = lsupporterService.getLsupporter(wid);
	            session.setAttribute("loginUser", loginUser);
	            session.setMaxInactiveInterval(6000 * 30);
	            break; 
	        case 1: // ID mismatch
	            url = "redirect:/ers/lsupporter/loginForm?error=1";
	            break;
	        case 2: // password mismatch
	            url = "redirect:/ers/lsupporter/loginForm?error=2";
	            break;
	    }

	    return url;
	}

	 
	   @GetMapping("/ers/lsupporter/logout")
	   public String logout(HttpSession session) throws Exception {
	      String url = "redirect:/ers/lsupporter/loginForm";

	      session.invalidate();

	      return url;
	   }
	   
	   @GetMapping("/ers/lsupporter/notice/detail")
	   public String logout(Model model, HttpSession session, HttpServletRequest request,int nNo) throws Exception {
			session = request.getSession();
			 LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
			NoticeVO notice =  lsupporterService.noticeDetail(nNo);
		List<ReplyVO> replyList = lsupporterService.replyList(nNo);
		List<NoticeFileVO> noticeFileList = lsupporterService.noticeFileList(nNo);
		
		
			 model.addAttribute("wid",loginUser.getWid());
			 model.addAttribute("notice",notice);
			 model.addAttribute("replyList", replyList);
			 model.addAttribute("noticeFileList", noticeFileList);
	      return "lsupporter/noticedetail";
	   }
	   
	   @GetMapping("/ers/lsupporter/notice/writeForm")
	   public String noticeWriteForm() {
	       return "lsupporter/noticewriteForm";
	   }
	   
	   @PostMapping(value = "/ers/lsupporter/notice/write", produces = "text/plain;charset=utf-8")
	   public String noticewrrite(HttpSession session, HttpServletRequest request, NoticeFileWriteCommand noticeReq) {
		   String url = "redirect:/ers/lsupporter/notice";
		   session = request.getSession();
		   LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
		   List<MultipartFile> multiFiles = noticeReq.getUploadFile();
			String savePath = this.noticefileuploadpath;		
			List<NoticeFileVO> noticeFileList;
			try {
				noticeFileList = saveFileToAttaches(multiFiles,savePath);
				lsupporterService.noticewrite(noticeFileList,loginUser.getWid(),noticeReq);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  
		   return url;
	   }
	   
	   public class FileSizeConverter {
		    public static String convertFileSize(long bytes) {
		        if (bytes < 1024) {
		            return bytes + " B";
		        } else if (bytes < 1024 * 1024) {
		            double kb = bytes / 1024.0;
		            return formatDouble(kb) + " KB";
		        } else {
		            double mb = bytes / (1024.0 * 1024.0);
		            return formatDouble(mb) + " MB";
		        }
		    }
		    
		    private static String formatDouble(double value) {
		        DecimalFormat df = new DecimalFormat("#.##");
		        return df.format(value);
		    }
		}
	   
	   private List<NoticeFileVO> saveFileToAttaches(List<MultipartFile> multiFiles, String savePath) throws Exception {
			List<NoticeFileVO> noticeFileList = new ArrayList<NoticeFileVO>();
			// 저장 -> attachVO -> list.add
			if (multiFiles  != null) {
				for (MultipartFile multi : multiFiles) {
					String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
					File target = new File(savePath, fileName);
					target.mkdirs();
					multi.transferTo(target);
						
					NoticeFileVO noticeFile = new NoticeFileVO();
					noticeFile.setUploadpath(savePath);
					noticeFile.setFilename(fileName);
					noticeFile.setFiletype(fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase());
					 long fileSizeInBytes = multi.getSize();
			            String formattedFileSize = FileSizeConverter.convertFileSize(fileSizeInBytes);
			            noticeFile.setFilesize(formattedFileSize);				
					noticeFileList.add(noticeFile);
				}
			}
			return noticeFileList;
		}
	   
	  
	   @PostMapping("/ers/lsupporter/reply/write")
	   public String replyWrite(HttpSession session, Model model, ReplyVO reply) {
	       String url = "redirect:/ers/lsupporter/notice/detail?nNo=" + reply.getNNo();
	       LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
	       reply.setWriter(loginUser.getWid());
	       lsupporterService.replyWrite(reply);
	       return url;
	   }
	   
	   @PostMapping("/ers/lsupporter/reply/removereply")
	   public String replyWrite(int rNo, int nNo) {
	       String url = "redirect:/ers/lsupporter/notice/detail?nNo="+nNo;
	       lsupporterService.replyRemove(rNo, nNo);
	       return url;
	   }
	   
	   @GetMapping("/ers/lsupporter/notice/getFile")
		public ModelAndView getFile(int fNo, Model model) throws Exception {
		    ModelAndView modelAndView = new ModelAndView(new FileDownloadView());

		    NoticeFileVO noticefile = lsupporterService.getNoticeFileByfNo(fNo);
		    modelAndView.addObject("savedPath", noticefile.getUploadpath());
		    modelAndView.addObject("fileName", noticefile.getFilename());

		    return modelAndView;
		}
	   
	   @GetMapping("/ers/lsupporter/notice/ModifyForm")
	   public String noticemodifyForm(int nNo, Model model) {
		   NoticeVO notice =  lsupporterService.noticeDetail(nNo);
		 List<NoticeFileVO> noticeFileList = lsupporterService.noticeFileList(nNo);
		 model.addAttribute("notice",notice);
		 model.addAttribute("noticeFileList",noticeFileList);
	       return "lsupporter/noticemodifyForm";
	   }
	   
	   @GetMapping("/reply/modifyForm")
	   @ResponseBody
	   public String replyModifyForm(String rNo, Model model) {
	       int replyNo = Integer.parseInt(rNo);
	       ReplyVO reply = lsupporterService.replyDetail(replyNo);
	       Gson gson = new Gson();
	       String json = gson.toJson(reply);
	       return json;
	   }
	   
	   @PostMapping("/reply/modify")
	   public String replymodify(String content, int nNo, int rNo, HttpSession session, Model model) {
		   String url="redirect:/ers/lsupporter/notice/detail?nNo="+nNo;
		     lsupporterService.replymodify(content,rNo);
		     
		   return url;
	   }


		@PostMapping(value="/ers/lsupporter/notice/modify", produces = "text/plain;charset=utf-8")
		public String modifyPOST(NoticeModifyCommand modifyReq ,Model model)throws Exception{
		    String url = "redirect:/ers/lsupporter/notice/detail?nNo="+modifyReq.getNNo();
		    // 파일 삭제
			if (modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
				for (String anoStr : modifyReq.getDeleteFile()) {
					int fNo = Integer.parseInt(anoStr);
					NoticeFileVO noticeFile = lsupporterService.getNoticeFileByfNo(fNo);
					File deleteFile = new File(noticeFile.getUploadpath(), noticeFile.getFilename());
					
					if (deleteFile.exists()) {
						deleteFile.delete(); // File 삭제
					}
					lsupporterService.removeNoticeFileByfNo(fNo); // DB 삭제
					
				}
			}
			
			//파일저장
			List<NoticeFileVO> NoticeFileList = saveFileToAttaches(modifyReq.getUploadFile(),noticefileuploadpath);
			lsupporterService.NoticeModify(NoticeFileList,modifyReq);
			
			
			return url;
		}
	
}
