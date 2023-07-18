package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyVO {

		private int nNo;
		private int rNo;
		private String content;
		private String writer;
		private Date regDate;
		private Date updateDate;
}
