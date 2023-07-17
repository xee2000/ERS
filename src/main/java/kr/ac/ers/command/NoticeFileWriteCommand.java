package kr.ac.ers.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.ers.dto.NoticeFileVO;
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
	private List<NoticeFileVO>noticefileList;
}
