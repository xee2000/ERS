package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class MemberDetailVO {
	
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
	private String mCode;
	private String memType;
	private String status;
	private String dropstatus;
	private String dropDate;
	private String drug;
	private String orgdisease;
	private String allergy;
	private String equipment;
	private String afNo;
	private int rNo;
	private String content;
	private int wCode;
	private String reDone;
	private String viewCheck;
	private String reType;
	private Date occurTime;
	private String occurType;
	private String callCheck;
    private String relation;
	private int mNum;
	private String mStatus;
	
	private int cNum;
	private Date changeDate;
	private String changeStatus;
	private String lNum;
}
