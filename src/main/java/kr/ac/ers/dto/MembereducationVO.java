package kr.ac.ers.dto;

import java.util.Calendar;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MembereducationVO {
	private String age;
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
	private String memType;
	private int rNo;
	private String outConfirm;
	private Date outTime;
	private Date activeTime;	
	
	public void setBirth(String birth) {
		this.birth = birth;
	    Calendar now = Calendar.getInstance(); //년월일시분초
	    Integer currentYear = now.get(Calendar.YEAR);
	       
	    //태어난년도를 위한 세팅
	    String stringBirthYear = "19"+this.birth.substring(0, 2);
	    //태어난 년도
	    Integer birthYear = Integer.parseInt(stringBirthYear);

	    // 현재 년도 - 태어난 년도 => 나이 (만나이X)
	     int age = (currentYear - birthYear +1);
	     String outputAge = Integer.toString(age);
	        
	     setAge(outputAge + "세");
		
	}
	
}
