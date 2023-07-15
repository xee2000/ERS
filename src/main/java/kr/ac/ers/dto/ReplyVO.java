package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyVO {

		private int nNo;
		private int rNo;
		private String content;
		private String writer;
		private Date regDate;
		private Date updateDate;
}
