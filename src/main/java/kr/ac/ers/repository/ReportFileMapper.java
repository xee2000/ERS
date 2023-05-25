package kr.ac.ers.repository;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.ers.dto.ReportFileVO;

@Mapper
public interface ReportFileMapper {


	void save(ReportFileVO reportfile);

	ReportFileVO selectFilenumber(int sfNo);
	
	int selectReportFileSequenceNextValue();
}
