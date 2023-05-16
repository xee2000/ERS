package kr.ac.ers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.LsupporterVO;
import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.dto.SearchCriteria;

@Mapper
public interface LsupporterMapper {

	 LsupporterVO selectLsupportBywid(String wid);
	 
	 LsupporterStatusVO selectlsupporterStatus(String wid);

	 int selectcountemail(String name, String email);

	 LsupporterVO selectLsupportByemail(String email);

	 int selectLsupportBypwd(String name, String email, String wid);
	
	List<MemberVO> selectSearchMemberList(SearchCriteria cri, String wid);
	
	int selectSearchMemberListCount(SearchCriteria cri, String wid);

	List<MemberVO> selectLsupporterMemberList(SearchCriteria cri, String wid);

	int selectSearchLsupporterMemberListCount(SearchCriteria cri, String wid);

	void LsupporterModify(LsupporterStatusVO lsupporter);
	
}
