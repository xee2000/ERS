package kr.ac.ers.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class ReportFileVO {

	private int sfNo;
	private String attacher;
	private int rNo;
	private String uploadpath;
	private String filename;
	private String filetype;
	private Date regDate;
	private List<MultipartFile> uploadFile;
	private List<ReportFileVO> reportList;
	
	public ReportFileVO toReportFileVO() {
		ReportFileVO file = new ReportFileVO();
		file.setAttacher(this.attacher);
		file.setFiletype(this.filetype);
		file.setFilename(this.filename);
		file.setRegDate(this.regDate);
		file.setRNo(this.rNo);
		file.setSfNo(this.sfNo);
		return file;
	}

}
