package kr.ac.ers.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LsupporterStatusVO {

		private String name;
		private String birth;
		private String address;
		private String picture;
		private String phone;
		private String wid;
		private String pwd;
		private String email;
		

		public LsupporterStatusVO toLsupporterStatusVO() {
			//MemberVO setting
			LsupporterStatusVO lsupporter = new LsupporterStatusVO();
			lsupporter.setWid(this.wid);
			lsupporter.setPwd(this.pwd);
			lsupporter.setName(this.name);
			lsupporter.setPhone(this.phone.replace("-", ""));
			lsupporter.setEmail(this.email);
			lsupporter.setPicture(this.picture);
			
			return lsupporter;
		
		}
}
