package com.ottz.common.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.ottz.attach.vo.AttachVO;
import com.ottz.free.web.FreeController;

@Component
public class OttzAttachUtils {
	@Value("#{util['file.upload.path']}")
	private String uploadPath;
	
	private Logger logger = LoggerFactory.getLogger(FreeController.class);
	
	public AttachVO getAttachByMultipart(MultipartFile multipart, String category, String path) throws IOException {
		if (!multipart.isEmpty()) {
			String fileName = UUID.randomUUID().toString();
			AttachVO vo = new AttachVO();
			vo.setAtchOriginalName(multipart.getOriginalFilename());
			vo.setAtchFileSize(multipart.getSize());
			vo.setAtchContentType(multipart.getContentType());
			vo.setAtchFileName(fileName);
			vo.setAtchCategory(category);
			vo.setAtchPath(path);
			vo.setAtchFancySize(OttzFileUtils.fancySize(multipart.getSize()));
			String filePath = uploadPath + File.separatorChar + vo.getAtchPath();
			logger.debug("filePath = {}, fileName = {}", filePath, fileName);
			FileUtils.copyInputStreamToFile(multipart.getInputStream(), new File(filePath, fileName));  
			return vo;
		} else {
			return null;
		}
	}
	
	public List<AttachVO> getAttachListByMultiparts(MultipartFile[] multipartFiles, String category, String path)
			throws IOException {
		List<AttachVO> atchList = new ArrayList<AttachVO>();
		for (int i = 0; i < multipartFiles.length; i++) {
			MultipartFile multipart = multipartFiles[i];
			AttachVO vo = this.getAttachByMultipart(multipart, category, path);
			if (vo != null) {
				atchList.add(vo);
			}
		}
		return atchList;
	}
}