package kr.ac.ers.controller.lsupporter;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLDecoder;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.ers.utils.MakeFileName;

@Controller
public class SummernoteController {
	
	
	@Value("${summernotepath}")
	private String summernotepath;
	
	@PostMapping(value = "/summernotepath", produces = "text/plain;charset=utf-8")
	public String uploadImg(MultipartFile file,HttpServletRequest request, HttpServletResponse response , HttpSession session) throws Exception {
		String savePath = summernotepath.replace("/", File.separator);
		String fileName = MakeFileName.toUUIDFileName(file.getOriginalFilename(), "");
		File saveFile = new File(savePath, fileName);
		saveFile.mkdirs();
		file.transferTo(saveFile);
		System.out.println("saveFile" +saveFile);
		return request.getContextPath() + "/getImg?fileName=" + fileName;
	}

	@GetMapping("/getImg")
	public byte[] getImg(String fileName, HttpServletRequest request) throws Exception {
		String savePath = summernotepath.replace("/", File.separator);
		File sendFile = new File(savePath, fileName);
		InputStream in = new FileInputStream(sendFile);
		byte[] data = null;
		try {
			data = IOUtils.toByteArray(in);
			
		}finally {
			if(in!=null)in.close();
		}
		return data;
	}

	@GetMapping(value = "/deleteImg", produces = "text/plain;charset=utf-8")
	public String delteImg(String fileName) throws Exception {

		fileName = URLDecoder.decode(fileName, "utf-8");
		String savePath = summernotepath.replace("/", File.separator);
		File target = new File(savePath, fileName);
		if (target.exists())
			target.delete();
		return fileName;

	}
}
