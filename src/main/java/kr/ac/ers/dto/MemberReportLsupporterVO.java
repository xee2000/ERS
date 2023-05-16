package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberReportLsupporterVO {
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
	private String manId;
	
	private int rNo;
	private String content;
	private String reDone;
	private String viewcheck;
	private String reType;
	private Date occurtime;
	private String occurtype;
	private String callcheck;
	
	private String lNum;
	private int wCode;
	private String pwd;

}
