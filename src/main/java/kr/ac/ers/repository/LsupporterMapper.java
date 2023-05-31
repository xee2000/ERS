package kr.ac.ers.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.LsupporterStatusVO;
import kr.ac.ers.dto.LsupporterVO;
import kr.ac.ers.dto.MemberDetailVO;
import kr.ac.ers.dto.MemberEmergencyReportVO;
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
	 
	//생활지원사에게 배정된 대상자의 보고서 리스트
	List<MemberReportLsupporterVO> selectSearchMemberList(Map<String, Object> returnMap, RowBounds rowbounds);
	int selectSearchMemberListCount(Map<String, Object> returnMap);
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

	int selectmainemergencyall(String wid);

	int selectmainemergencymiss(String wid);

	int selectmainemergencyclear(String wid);

	//여기까지

	//응급발생현황리스트
	List<MemberReportLsupporterVO> selectemergencyList(Map<String, Object> returnMap, RowBounds rowbounds);

	int selectemergencyListCount(Map<String, Object> returnMap);
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

	MemberReportLsupporterVO selectLsupporterreport(int rNo);

	void updatereport(MemberReportLsupporterVO reportlsupporterfile);

	void remove(int rNo);

	MemberVO selectMemberById(String id);
	
	//응급상황내역에서 보고서 작성시 대상자조회 멤버 리스트
	List<MemberEmergencyReportVO> selectSearchemergencyMemberList(Map<String, Object> returnMap, RowBounds rowbounds);
	
	//응급상황내역에서 보고서 작성시 대상자조회 멤버 리스트카운트
	int selectSearchemergencyMemberListCount(Map<String, Object> returnMap);

	List<MemberReportLsupporterVO> selectNowReportList(Map<String, Object> returnMap, RowBounds rowbounds);

	int selectNowReportListCount(Map<String, Object> returnMap);

	int educationreportCount(String wid);

	int lifereportCount(String wid);

	int falsereportCount(String wid);

	int longreportCount(String wid);

	int devilreportCount(String wid);

	MemberReportLsupporterVO selectlifemodifyForm(String id, int wCode);

	void lifemodify(String orgdisease, String drug, String mentalstatus, String allergy, String id, String wid);


}
