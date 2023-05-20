package kr.ac.ers.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLDecoder;

import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import kr.ac.ers.utils.MakeFileName;

@RestController
public class SummernoteController {

	@Resource(name = "imgPath")

	private String imgPath;

	@PostMapping(value = "/uploadImg", produces = "text/plain;charset=utf-8")
	public String uploadImg(MultipartFile file, HttpServletRequest request) throws Exception {
		String savePath = imgPath.replace("/", File.separator);
		String fileName = MakeFileName.toUUIDFileName(file.getOriginalFilename(), "");
		File saveFile = new File(savePath, fileName);

		saveFile.mkdirs();
		file.transferTo(saveFile);
		return request.getContextPath() + "/getImg.do?fileName=" + fileName;
	}

	@GetMapping("/getImg")
	public byte[] getImg(String fileName, HttpServletRequest request) throws Exception {
		String savePath = imgPath.replace("/", File.separator);
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
		String savePath = imgPath.replace("/", File.separator);
		File target = new File(savePath, fileName);
		if (target.exists())
			target.delete();
		return fileName;

	}
}
