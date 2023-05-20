package kr.ac.ers.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.ac.ers.dto.ReportFileVO;
import kr.ac.ers.repository.ReportFileMapper;

public class ReportFileService {

		@Autowired
		ReportFileMapper reportFileMapper;
		
	public void regist(ReportFileVO file) {
		reportFileMapper.insertFile(file);
	}

	
}
