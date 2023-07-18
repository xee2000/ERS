package kr.ac.ers.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeModifyCommand {
	
	private String[] deleteFile;
	private String title;
	private String content;
	private List<MultipartFile>uploadFile;
	private int nNo;
	private int fNo;
}
