package kr.ac.ers.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReportVO {

	private int rNo;
	private String name;
	private Date regDate;
	private String content;
	private String id;
	private int wCode;
	private String reDone;
	private String viewCheck;
	private String reType;
	private Date occurTime;
	private String occurType;
	private String callCheck;
	private String uploadpath;
	private String filename;
	private String fileType;
	private Long size;
	private List<MultipartFile> uploadFile;
	public void setFiletype(String fileType) {
        this.fileType = fileType;
    }

	

}
