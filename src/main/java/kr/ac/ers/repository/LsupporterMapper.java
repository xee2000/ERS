package kr.ac.ers.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.LsupporterVO;
import kr.ac.ers.dto.MemberReportLsupporterVO;
import kr.ac.ers.dto.MemberVO;

@Mapper
public interface LsupporterMapper {

	 LsupporterVO selectLsupportBywid(String wid);
	 
	 LsupporterStatusVO selectlsupporterStatus(String wid);

	 int selectcountemail(String name, String email);

	 LsupporterVO selectLsupportByemail(String email);

	 int selectLsupportBypwd(String name, String email, String wid);	
	
	List<MemberVO> selectSearchMemberList(SearchCriteria cri, String wid);
	
	int selectSearchMemberListCount(SearchCriteria cri, String wid);

	List<MemberVO> selectLsupporterMemberList(Map<String, Object> returnMap, RowBounds rowBounds);

	int selectSearchLsupporterMemberListCount(Map<String, Object> returnMap);

	void LsupporterModify(LsupporterStatusVO lsupporter);

	void insertMemberReport(MemberReportLsupporterVO reportlsupporter);
	
}
