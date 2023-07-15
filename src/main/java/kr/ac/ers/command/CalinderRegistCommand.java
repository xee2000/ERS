package kr.ac.ers.command;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CalinderRegistCommand {

		private String wid;
		private String title;
		private String content;
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private Date regDate;
		private int id;
		
		
}
