package kr.ac.ers.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor 
@ToString
public class ReportFileVO {
	
	private int sfNo;
	private String id;
	private String attacher;
	private int rNo;
	private String content;
	private String uploadpath;
	private String filename;
	private String fileType;
	private Date regDate;
	private Long size;
	private List<MultipartFile> uploadFile;
	private List<ReportFileVO> reportList;
	
	   public void setFiletype(String fileType) {
	        this.fileType = fileType;
	    }
	   
	   
	
}
