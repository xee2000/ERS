package kr.ac.ers.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LsupporterStatusVO {

		private String name;
		private String birth;
		private String address;
		private	MultipartFile picture;	
		private String phone;
		private String wid;
		private String pwd;
		private String email;
		private String id;
		private String oldPicture;

	
}
