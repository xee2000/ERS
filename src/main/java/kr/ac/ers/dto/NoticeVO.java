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
public class NoticeVO {
	
	private int nNo;
	private String title;
	private String content;
	private Date regDate;
	private Date updateDate;
	private String manId;
	private List<MultipartFile> uploadFile;
}
