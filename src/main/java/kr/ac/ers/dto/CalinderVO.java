package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CalinderVO {

		private String title;
		private String content;
		private String wid;
		private Date regDate;
		private Date updateDate;
		private Date endDate;
}
