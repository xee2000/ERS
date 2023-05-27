package kr.ac.ers.command;


import kr.ac.ers.dto.MemberReportLsupporterVO;

public class ReportModifyCommand extends MemberReportLsupporterVO{
	
	private String rNo;
	private String[] deleteFile;
	
	
	@Override
	public MemberReportLsupporterVO toMemberReportLsupporter() {
		MemberReportLsupporterVO report = new MemberReportLsupporterVO();
		report.setRNo(Integer.parseInt(this.rNo));
		return report;
	}


	public String getrNo() {
		return rNo;
	}


	public void setrNo(String rNo) {
		this.rNo = rNo;
	}


	public String[] getDeleteFile() {
		return deleteFile;
	}


	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}




}
