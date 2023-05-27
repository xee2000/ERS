package kr.ac.ers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.dto.ReportFileVO;

@Mapper
public interface ReportFileMapper {


	void save(ReportFileVO reportfile);

	ReportFileVO selectFilenumber(int sfNo);
	
	int selectReportFileSequenceNextValue();

	List<ReportFileVO> selectReportFileByrNo(int rNo);

	ReportFileVO selectReportFileBysfNo(int sfNo);

	void removeReportFileBysfNo(int sfNo);

	void remove(int rNo);

	

}
