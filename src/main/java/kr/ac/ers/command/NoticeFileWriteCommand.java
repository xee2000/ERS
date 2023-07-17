package kr.ac.ers.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeFileWriteCommand {
	private String title;
	private String content;
	private List<MultipartFile>uploadFile;
}
