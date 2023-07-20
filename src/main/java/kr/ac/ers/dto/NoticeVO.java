package kr.ac.ers.dto;

import java.util.Date;


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
	private int count;
}
