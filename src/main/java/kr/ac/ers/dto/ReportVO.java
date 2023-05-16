package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReportVO {

	private int rNo;
	private Date regDate;
	private String content;
	private String id;
	private int wCode;
	private String reDone;
	private String viewcheck;
	private String reType;
	private Date occurtime;
	private String occurtype;
	private String callcheck;
	
	
	

}
