package kr.ac.ers.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.ers.command.NoticeFileWriteCommand;
import kr.ac.ers.command.NoticeModifyCommand;
import kr.ac.ers.command.PageMaker;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.CalinderVO;
import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.LsupporterVO;
import kr.ac.ers.dto.MemberDetailVO;
import kr.ac.ers.dto.MemberEmergencyReportVO;
import kr.ac.ers.dto.MemberReportLsupporterVO;
import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.dto.MembereducationVO;
import kr.ac.ers.dto.NoticeFileVO;
import kr.ac.ers.dto.NoticeVO;
import kr.ac.ers.dto.ReplyVO;
import kr.ac.ers.dto.ReportFileVO;
import kr.ac.ers.dto.ReportVO;
import kr.ac.ers.repository.LsupporterMapper;
import kr.ac.ers.repository.ReportFileMapper;

@Service
public class LsupporterService {

	@Autowired
	private LsupporterMapper lsupportMapper;

	@Autowired
	private ReportFileMapper reportFileMapper;

	// 로그인
	public int login(String wid, String pwd) {
		int result = 0;
		try {
			LsupporterVO lsupport = lsupportMapper.selectLsupportBywid(wid);
			if (lsupport != null) {
				if (!lsupport.getPwd().equals(pwd)) {// 패스워드 불일치
					result = 2;
				}
			} else {// 아이디 불일치
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public LsupporterVO getLsupporter(String wid) {
		return lsupportMapper.selectLsupportBywid(wid);
	}

	public int selectcountemail(String name, String email) {

		return lsupportMapper.selectcountemail(name, email);
	}

	public LsupporterVO getLsupportByemail(String email) {

		return lsupportMapper.selectLsupportByemail(email);
	}

	public int findpwdLsupporter(String name, String email, String wid) {

		return lsupportMapper.selectLsupportBypwd(name, email, wid);
	}

	public LsupporterStatusVO selectlsupporterStatus(String wid) {
		return lsupportMapper.selectlsupporterStatus(wid);

	}



	public void LsupporterModify(LsupporterStatusVO lsupporter) {
		lsupportMapper.LsupporterModify(lsupporter);
	}

	public void reportregist(MemberReportLsupporterVO reportlsupporter, String wid) {
		int rNo = lsupportMapper.selectReportSequenceNextValue();

		reportlsupporter.setRNo(rNo);
		lsupportMapper.insertMemberReport(reportlsupporter);
		if (reportlsupporter.getReportFileList() != null)
			for (ReportFileVO reportfile : reportlsupporter.getReportFileList()) {
				reportfile.setSfNo(reportFileMapper.selectReportFileSequenceNextValue());
				reportfile.setRNo(rNo);
				reportfile.setAttacher(wid);
				reportfile.setFilename(reportlsupporter.getReportFileList().get(0).getFilename());
				reportfile.setUploadpath(reportlsupporter.getReportFileList().get(0).getUploadpath());
				reportfile.setFiletype(reportlsupporter.getReportFileList().get(0).getFileType());
				reportfile.setSize(reportlsupporter.getReportFileList().get(0).getSize());
				reportFileMapper.save(reportfile);
			}
	}

	public Map<String, Object> getLsupportercarelist(SearchCriteria cri, String wid) {

		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("cri", cri);
		returnMap.put("wid", wid);
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(), cri.getPerPageNum());

		List<MembereducationVO> carelist = lsupportMapper.selectmembereducationList(returnMap, rowbounds);
		dataMap.put("carelist", carelist);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lsupportMapper.selectmembereducationListCount(returnMap));
		dataMap.put("pageMaker", pageMaker);

		return dataMap;

	}
	public int getmaineducationfutureDate(String wid) {
		return lsupportMapper.selectmaineducationfutureDate(wid);
	}

	public int getmaineducationnotmachine(String wid) {
		return lsupportMapper.selectmaineducationnotmachine(wid);
	}

	public int getmaineducationclearDate(String wid) {
		return lsupportMapper.selectmaineducationclearDate(wid);
	}

	public int getmainemergencyall(String wid) {
		return lsupportMapper.selectmainemergencyall(wid);
	}
	public int getmainemergencymiss(String wid) {
		return lsupportMapper.selectmainemergencymiss(wid);
	}

	public int getmainemergencyclear(String wid) {
		return lsupportMapper.selectmainemergencyclear(wid);
	}
	

	public Map<String, Object> getemergencyList(SearchCriteria cri, String wid, String startday, String endday) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("cri", cri);
		returnMap.put("wid", wid);
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(), cri.getPerPageNum());

		List<MemberReportLsupporterVO> emergencyList = lsupportMapper.selectemergencyList(returnMap, rowbounds);
		dataMap.put("emergencyList", emergencyList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lsupportMapper.selectemergencyListCount(returnMap));
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	public MemberDetailVO getMemberDetail(String wid, String id) {
		 
		return lsupportMapper.selectMemberDetail(wid, id);
				
	}

	public List<MemberDetailVO> getMemberEcall(String wid, String id) {
		return lsupportMapper.selectMemberEcall(wid, id);
	}

	public int getemergencyCount(String wid, String id) {
		// TODO Auto-generated method stub
		return lsupportMapper.selectemergencyCount(wid, id);
	}

	public int getfireCount(String wid, String id) {
		// TODO Auto-generated method stub
		return lsupportMapper.selectfireCount(wid, id);
	}

	public List<MemberDetailVO> getMembermachin(String wid, String id) {
		return lsupportMapper.selectMemberDetailmachine(wid, id);
	}


	public ReportVO getModifyreportForm(int rNo) {
		ReportVO reportmodify = lsupportMapper.selectReportModifyForm(rNo);
		return reportmodify;
	}

	public MemberReportLsupporterVO getreportLsupporterForModify(int rNo) {
		MemberReportLsupporterVO reportlsupporter = lsupportMapper.selectLsupporterreport(rNo);
		List<ReportFileVO> reportFileList = reportFileMapper.selectReportFileByrNo(rNo);
		reportlsupporter.setReportFileList(reportFileList);
		return reportlsupporter;
	}

	public ReportFileVO getReportFileBysfNo(int sfNo) {
		ReportFileVO reportfile = reportFileMapper.selectReportFileBysfNo(sfNo);
		return reportfile;
	}

	public void removeReportFileBysfNo(int sfNo) {
		reportFileMapper.removeReportFileBysfNo(sfNo);

	}

	public void modify(MemberReportLsupporterVO reportlsupporter) {
		lsupportMapper.updatereport(reportlsupporter);
		if (reportlsupporter.getReportFileList() != null)
			for (ReportFileVO reportfile : reportlsupporter.getReportFileList()) {
				reportfile.setRNo(reportlsupporter.getRNo());
				reportfile.setAttacher(reportlsupporter.getWid());
				reportFileMapper.save(reportfile);
			}

	}

	public MemberReportLsupporterVO getReportByRNo(int rNo) {
		MemberReportLsupporterVO reportlsupporter = lsupportMapper.selectLsupporterreport(rNo);
		return reportlsupporter;
	}

	public void remove(int rNo) {
		List<ReportFileVO> reportfiles = reportFileMapper.selectReportFileByrNo(rNo);
	    if (reportfiles != null && !reportfiles.isEmpty()) {
	    	reportFileMapper.remove(reportfiles.get(0).getRNo());
	    }
	    lsupportMapper.remove(rNo);
	}

	public MemberVO getmemById(String id) {
	MemberVO member = lsupportMapper.selectMemberById(id);
		return member;
	}

	public Map<String, Object> getemergencyLsupporterMemberList(String wid, SearchCriteria cri) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("cri", cri);
		returnMap.put("wid", wid);
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(), cri.getPerPageNum());

		List<MemberEmergencyReportVO> memberList = lsupportMapper.selectSearchemergencyMemberList(returnMap, rowbounds);
		dataMap.put("memberList", memberList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lsupportMapper.selectSearchemergencyMemberListCount(returnMap));
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	public Map<String, Object> getLsupportermembersearchList(String wid, SearchCriteria cri) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("cri", cri);
		returnMap.put("wid", wid);
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(), cri.getPerPageNum());

		List<MemberEmergencyReportVO> memberList = lsupportMapper.selectSearchemergencyMemberList(returnMap, rowbounds);
		dataMap.put("memberList", memberList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lsupportMapper.selectSearchemergencyMemberListCount(returnMap));
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	public Map<String, Object> getNowReportList(SearchCriteria cri, String wid) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("cri", cri);
		returnMap.put("wid", wid);
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(), cri.getPerPageNum());

		List<MemberReportLsupporterVO> memberList = lsupportMapper.selectNowReportList(returnMap, rowbounds);
		int educationCount = lsupportMapper.educationreportCount(wid);
		int lifereportCount = lsupportMapper.lifereportCount(wid);
		int falsereportCount = lsupportMapper.falsereportCount(wid);
		int longreportCount = lsupportMapper.longreportCount(wid);
		int devilreportCount = lsupportMapper.devilreportCount(wid);
		dataMap.put("memberList", memberList);
		dataMap.put("educationCount", educationCount);
		dataMap.put("lifereportCount", lifereportCount);
		dataMap.put("falsereportCount", falsereportCount);
		dataMap.put("longreportCount", longreportCount);
		dataMap.put("devilreportCount", devilreportCount);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lsupportMapper.selectNowReportListCount(returnMap));
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}


	public MemberReportLsupporterVO getlifemodifyForm(String id,int wCode) {
		MemberReportLsupporterVO report = lsupportMapper.selectlifemodifyForm(id, wCode);
		return report;
	}

	public void getlifemodify(String orgdisease, String drug, String mentalstatus, String allergy, String id, String wid) {
		lsupportMapper.lifemodify(orgdisease,drug,mentalstatus,allergy,id,wid);
	}

	public Map<String, Object> getReportList(SearchCriteria cri, String wid, String startday, String endday) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("cri", cri);
		returnMap.put("wid", wid);
		returnMap.put("startday", startday);
		returnMap.put("endday", endday);
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(), cri.getPerPageNum());

		List<MemberReportLsupporterVO> reportList = lsupportMapper.selectReportList(returnMap, rowbounds);
		dataMap.put("reportList", reportList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lsupportMapper.selectReportListCount(returnMap));
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	public List<CalinderVO> getcalinderList(String wid) {
		
		return lsupportMapper.selectcalinderList(wid);
	}

	public CalinderVO getcalinderDetail(String wid, int id) {

		return lsupportMapper.selectcalinderDetail(wid,id);
	}

	public void calinderregist(String wid, String title, String content, Date regDate) {
		int id = lsupportMapper.selectcalinderSequenceNextValue();
		lsupportMapper.insertcalinder(id,wid,title,content,regDate);
		
	}

	public void calindermodify(String wid, int id, String title, String content, Date regDate, Date updateDate) {
		
		lsupportMapper.modifycalinder(id,wid,title,content,regDate,updateDate);
	}

	public void calinderremove(String wid, int id) {
		
		lsupportMapper.calinderremove(wid,id);
	}

	public Map<String, Object> noticeList(SearchCriteria cri, String startday, String endday) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("cri", cri);
		returnMap.put("startday", startday);
		returnMap.put("endday", endday);
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(), cri.getPerPageNum());

		List<NoticeVO> noticeList = lsupportMapper.selectnoticeList(returnMap, rowbounds);
		dataMap.put("noticeList", noticeList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lsupportMapper.selectnoticeListCount(returnMap));
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	public NoticeVO noticeDetail(int nNo) {
	
			return lsupportMapper.noticeDetail(nNo);
	}

	public List<ReplyVO> replyList(int nNo) {
		
		return lsupportMapper.replyList(nNo);
	}
	

	public void replyWrite(ReplyVO reply) {
		reply.setRNo(lsupportMapper.selectreplySequenceNextValue());	
		System.out.println("reply : " +reply);
		lsupportMapper.replyWrite(reply);
	}

	public void replyRemove(int rNo, int nNo) {
		
		lsupportMapper.replyRemove(rNo, nNo);
	}

	public void noticewrite(List<NoticeFileVO> noticeFileList, String wid, NoticeFileWriteCommand noticeReq) {
	    int nNo = lsupportMapper.selectNoticeSequenceNextValue();
	    NoticeVO notice = new NoticeVO();
	    notice.setNNo(nNo);
	    notice.setManId(wid);
	    notice.setTitle(noticeReq.getTitle());
	    notice.setContent(noticeReq.getContent());
	    lsupportMapper.insertNotice(notice);

	    if (noticeReq.getUploadFile() != null) {
	        for (int i = 0; i < noticeFileList.size(); i++) {
	            NoticeFileVO noticefile = noticeFileList.get(i);
	            System.out.println("noticeFileList : " + noticeFileList);
	            int fNo = lsupportMapper.selectNoticeFileSequenceNextValue();
	            noticefile.setFNo(fNo);
	            noticefile.setNNo(nNo);
	            lsupportMapper.insertnoticeFile(noticefile);
	        }
	    }
	}

	public NoticeFileVO getNoticeFileByfNo(int fNo) {
		return lsupportMapper.selectNoticeByfNo(fNo);
	}

	public List<NoticeFileVO> noticeFileList(int nNo) {
		return lsupportMapper.selectNoticeFileList(nNo);
	}

	public void removeNoticeFileByfNo(int fNo) {
		
		lsupportMapper.removeNoticeFileByfNo(fNo);
	}


	public void NoticeModify(List<NoticeFileVO> noticeFileList, NoticeModifyCommand modifyReq) {
		lsupportMapper.NoticeModify(modifyReq);
		   if (noticeFileList != null) {
		        for (int i = 0; i < noticeFileList.size(); i++) {
		        	System.out.println("noticeFileList : " + noticeFileList);
		            NoticeFileVO noticefile = noticeFileList.get(i);
		            int fNo = lsupportMapper.selectNoticeFileSequenceNextValue();
		            noticefile.setFNo(fNo);
		            noticefile.setNNo(modifyReq.getNNo());
		            lsupportMapper.insertnoticeFile(noticefile);
		        }
		    }
		
	}

	public ReplyVO replyDetail(int rNo) {
			return lsupportMapper.selectreplyDetail(rNo);
	}

	public void replymodify(String content, int rNo) {
		lsupportMapper.replymodify(content,rNo);
	}

	public void noticeremove(int nNo) {
		
		lsupportMapper.noticeremove(nNo);
		
		
	}

	public void addviewCount(int nNo) {

		lsupportMapper.updateviewCount(nNo);
	}

	public int socialkakaologin(String id) {
		int count = 0;
		try {
			LsupporterVO lsupport = lsupportMapper.socialkakaologin(id);
			
			if (lsupport != null) {
			//아이디 일치	
				count = 0;
				return count;
			} else {// 아이디 불일치
				count = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}



}