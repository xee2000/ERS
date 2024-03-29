package kr.ac.ers.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CalinderVO {

		private String title;
		private int id;
		private String content;
		private String wid;
		private Date regDate;
		private Date updateDate;
		private Date endDate;
}
