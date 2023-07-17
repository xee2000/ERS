package kr.ac.ers.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeFileVO {
	
	private int nFo;
	private int fNo;
	private String filename;
	private String filesize;
	private String filetype;
	private String Uploadpath;
	private List<MultipartFile>noticefileList;
}
