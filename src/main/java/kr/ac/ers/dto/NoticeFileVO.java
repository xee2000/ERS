package kr.ac.ers.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeFileVO {
	
	private int nNm;
	private int fNo;
	private String filename;
	private String filesize;
	private String filetype;
	private List<MultipartFile>fileList;
}
