package kr.ac.ers.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
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
	private String viewCheck;
	private String reType;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date occurTime;
	private String occurType;
	private String callCheck;
	private String lNum;
	private int wCode;
	private String pwd;
	private String uploadpath;
	private String filename;
	private String fileType;
	private Long size;
	private List<MultipartFile> uploadFile;
	private List<ReportFileVO> reportFileList;

	public void setFiletype(String fileType) {
		this.fileType = fileType;
	}

}
