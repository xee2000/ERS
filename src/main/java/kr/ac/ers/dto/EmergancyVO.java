package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmergancyVO {

	
	private int sCode;
	private String sType;
	private Date occurTime;
	private String confirmCheck;
	private String reportCheck;
	private String id;
	private String wid;
}
