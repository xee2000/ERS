package kr.ac.ers.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.command.PageMaker;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.LsupporterVO;
import kr.ac.ers.dto.MemberDetailVO;
import kr.ac.ers.dto.MemberReportLsupporterVO;
import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.dto.MembereducationVO;
import kr.ac.ers.repository.LsupporterMapper;

@Service
public class LsupporterService {

	@Autowired
	private LsupporterMapper lsupportMapper;

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

	public int findwidLsupporter(String name, String email) {

		return lsupportMapper.selectcountemail(name, email);
	}

	public LsupporterVO getLsupporterByWid(String email) {

		return lsupportMapper.selectLsupportByemail(email);
	}

	public int findpwdLsupporter(String name, String email, String wid) {

		return lsupportMapper.selectLsupportBypwd(name, email, wid);
	}

	public LsupporterStatusVO selectlsupporterStatus(String wid) {
		return lsupportMapper.selectlsupporterStatus(wid);

	}

	public Map<String, Object> getMemberList(SearchCriteria cri, String wid) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("cri", cri);		
		returnMap.put("wid", wid);		
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(),cri.getPerPageNum());
		
		List<MemberReportLsupporterVO> memberList = lsupportMapper.selectSearchMemberList(returnMap, rowbounds);
		dataMap.put("memberList", memberList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lsupportMapper.selectSearchMemberListCount(cri, wid));
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	public Map<String, Object> getLsupporterMemberList(String wid, SearchCriteria cri) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("cri", cri);
		returnMap.put("wid", wid);
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(),cri.getPerPageNum());
		
		List<MemberVO> memberList = lsupportMapper.selectLsupporterMemberList(returnMap,rowbounds);
		dataMap.put("memberList", memberList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lsupportMapper.selectSearchLsupporterMemberListCount(returnMap));
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	public void LsupporterModify(LsupporterStatusVO lsupporter) {
		lsupportMapper.LsupporterModify(lsupporter);
	}

	public void reportregist(MemberReportLsupporterVO reportlsupporter) {
		int rNo = lsupportMapper.selectReportSequenceNextValue();
		reportlsupporter.setRNo(rNo);
		lsupportMapper.insertMemberReport(reportlsupporter);
	}

	public Map<String,Object> getLsupportercarelist(SearchCriteria cri, String wid) {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("cri", cri);		
		returnMap.put("wid", wid);		
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(),cri.getPerPageNum());
		
		List<MembereducationVO> memberList = lsupportMapper.selectmembereducationList(returnMap, rowbounds);
		dataMap.put("memberList", memberList);
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

	public int getmainemergancyall(String wid) {
		return lsupportMapper.selectmainemergancyall(wid);
	}

	public int getmainemergancyno(String wid) {
		return lsupportMapper.selectmainemergancyno(wid);
	}

	public Map<String, Object> getemergancyList(String wid, SearchCriteria cri) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("cri", cri);		
		returnMap.put("wid", wid);		
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(),cri.getPerPageNum());
		
		List<MemberReportLsupporterVO> emergancyList = lsupportMapper.selectemergancyList(returnMap, rowbounds);
		dataMap.put("emergancyList",emergancyList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lsupportMapper.selectemergancyListCount(returnMap));
		dataMap.put("pageMaker", pageMaker);

		
		return dataMap;
	}

	public MemberDetailVO getMemberDetail(String wid, String id) {
		
		return lsupportMapper.selectMemberDetail(wid,id);
	}

	public List<MemberDetailVO> getMemberEcall(String wid, String id) {
		return lsupportMapper.selectMemberEcall(wid,id);
	}

	public int getemergencyCount(String wid, String id) {
		// TODO Auto-generated method stub
		return lsupportMapper.selectemergencyCount(wid,id);
	}

	public int getfireCount(String wid, String id) {
		// TODO Auto-generated method stub
		return lsupportMapper.selectfireCount(wid,id);
	}

	public List<MemberDetailVO> getMembermachin(String wid, String id) {
		return lsupportMapper.selectMemberDetailmachine(wid,id);
	}

	public Map<String, Object> getReportList(String id, SearchCriteria cri) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("cri", cri);		
		returnMap.put("id", id);		
		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(),cri.getPerPageNum());
		
		List<MemberReportLsupporterVO> reportList = lsupportMapper.selectReportList(returnMap, rowbounds);
		dataMap.put("reportList",reportList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lsupportMapper.selectReportListCount(returnMap));
		dataMap.put("pageMaker", pageMaker);

		
		return dataMap;
	}
	

}
