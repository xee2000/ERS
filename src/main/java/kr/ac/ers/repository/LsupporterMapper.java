package kr.ac.ers.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.LsupporterVO;
import kr.ac.ers.dto.MemberDetailVO;
import kr.ac.ers.dto.MemberReportLsupporterVO;
import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.dto.MembereducationVO;
import kr.ac.ers.dto.ReportVO;

@Mapper
public interface LsupporterMapper {

	 LsupporterVO selectLsupportBywid(String wid);
	 
	 //마이페이지
	 LsupporterStatusVO selectlsupporterStatus(String wid);
	 void LsupporterModify(LsupporterStatusVO lsupporter);
	 //여기까지

	 	//이메일 관련 메서드
	 int selectcountemail(String name, String email);

	 LsupporterVO selectLsupportByemail(String email);

	 int selectLsupportBypwd(String name, String email, String wid);	
	 //여기까지
	 
	//모달창의 대상자 조회
	List<MemberReportLsupporterVO> selectSearchMemberList(Map<String, Object> returnMap, RowBounds rowbounds);
	int selectSearchMemberListCount(SearchCriteria cri, String wid);
	//여기까지
	
	//보고서리스트
	List<MemberVO> selectLsupporterMemberList(Map<String, Object> returnMap, RowBounds rowBounds);
	int selectSearchLsupporterMemberListCount(Map<String, Object> returnMap);
	//여기까지
	
	//보고서 등록
	void insertMemberReport(MemberReportLsupporterVO reportlsupporter);

	//보고서 번호 자동생성
	int selectReportSequenceNextValue();
	
	
    //돌봄내역 리스트
	List<MembereducationVO> selectmembereducationList(Map<String, Object> returnMap, RowBounds rowBounds);
	int selectmembereducationListCount(Map<String, Object> returnMap);
	//여기까지

	//메인에 뿌려주는 현황
	int selectmaineducationfutureDate(String wid);

	int selectmaineducationclearDate(String wid);
	
	int selectmaineducationnotmachine(String wid);

	int selectmainemergancyall(String wid);

	int selectmainemergancyno(String wid);
	//여기까지

	//응급발생현황리스트
	List<MemberReportLsupporterVO> selectemergancyList(Map<String, Object> returnMap, RowBounds rowbounds);

	int selectemergancyListCount(Map<String, Object> returnMap);
	//여기까지
	
	//대상자상세
	MemberDetailVO selectMemberDetail(String wid,String id);
	
	//비상연락망 리스트
	List<MemberDetailVO> selectMemberEcall(String wid, String id);
	
	//대상자 상세에 있는 총 응급누적건수
	int selectemergencyCount(String wid, String id);

	//대상자 상세에 있는 총 화재누적건수
	int selectfireCount(String wid, String id);

	//대상자 상세에 있는 장비리스트
	List<MemberDetailVO> selectMemberDetailmachine(String wid, String id);
	
	//보고서리스트와 카운트
	List<MemberReportLsupporterVO> selectReportList(Map<String, Object> returnMap, RowBounds rowbounds);
	int selectReportListCount(Map<String, Object> returnMap);
	//여기까지
	
	//보고서 상세
	ReportVO selectreportdetail(int rNo);

	ReportVO selectReportModifyForm(int rNo);

}
