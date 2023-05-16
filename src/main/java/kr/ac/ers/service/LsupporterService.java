package kr.ac.ers.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.LsupporterVO;
import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.dto.PageMaker;
import kr.ac.ers.dto.SearchCriteria;
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

		List<MemberVO> memberList = lsupportMapper.selectSearchMemberList(cri, wid);
		dataMap.put("memberList", memberList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lsupportMapper.selectSearchMemberListCount(cri, wid));
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	public Map<String, Object> getLsupporterMemberList(String wid, SearchCriteria cri) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<MemberVO> memberList = lsupportMapper.selectLsupporterMemberList(cri,wid);
		dataMap.put("memberList", memberList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lsupportMapper.selectSearchLsupporterMemberListCount(cri, wid));
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	public void LsupporterModify(LsupporterStatusVO lsupporter) {
		
		lsupportMapper.LsupporterModify(lsupporter);
	}

}
