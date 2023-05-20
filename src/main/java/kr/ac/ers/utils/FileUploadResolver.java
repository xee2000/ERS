package kr.ac.ers.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.util.http.fileupload.FileItem;

public class FileUploadResolver {

	public static List<File> fileUpload(FileItem[] items,String uploadPath) 
																throws Exception{
		List<File> uploadFileList = new ArrayList<File>();
		
		//경로생성
		File file = new File(uploadPath); 
		file.mkdirs();
		
		if (items != null)	for (FileItem item : items) { //파일 유무 확인
			String fileName = new File(item.getName()).getName(); // 사용자 파일명
			fileName = MakeFileName.toUUIDFileName(fileName, "$$"); // 고유한 파일명
			
			String filePath = uploadPath + File.separator + fileName;
			File storeFile = new File(filePath);
			
			try {
				item.write(storeFile);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			uploadFileList.add(storeFile);
		}
		
		return uploadFileList;
	}
}
