package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberEmergancyReportVO {

	private String id;
	private String name;
	private String birth;
	private String address;
	private String phone;
	private String gender;
	private String picture;
	private String mentalstatus;
	private String fam_rel;
	private String wid;
	private String caution;
	private String pacemaker;
	private Date regDate;
	private Date equipDate;
	private String status;
	private String dropstatus;
	private String dropDate;
	private String drug;
	private String orgdisease;
	private String allergy;
	private String equipment;
	private String afNo;
	
	private int sCode;
	private String sType;
	private Date occurTime;
	private String confirmCheck;
	private String reportCheck;
	
	private int rNo;
	private String content;
	private int wCode;
	private String reDone;
	private String viewCheck;
	private String reType;
	private String occurType;
	private String callCheck;	

}
