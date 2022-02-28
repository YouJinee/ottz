package com.ottz.attach.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ottz.attach.service.IAttachService;
import com.ottz.attach.vo.AttachVO;
import com.ottz.exception.BizNotFoundException;
import com.ottz.free.web.FreeController;

@Controller
public class AttachController {
	
	@Value("#{util['file.upload.path']}")
	private String uploadPath;
	
	@Inject
	private IAttachService attachService;
	
	private Logger logger = LoggerFactory.getLogger(FreeController.class);
	
	@RequestMapping("/attach/download/{atchNo:[0-9]{1,16}}")
	public void process(@PathVariable(name = "atchNo") int atchNo, HttpServletResponse resp) throws Exception {
		logger.debug("atchNo = {}", atchNo);
		try {
			AttachVO vo = attachService.getAttach(atchNo);
			String originalName = new String(vo.getAtchOriginalName().getBytes("utf-8"), "iso-8859-1");
			String filePath = uploadPath + File.separatorChar + vo.getAtchPath();
			String fileName = vo.getAtchFileName();
			logger.debug("originalName = {}", originalName);
			logger.debug("filePath = {}", filePath);
			logger.debug("fileName = {}", fileName);
			
			File f = new File(filePath, fileName);
			if(!f.isFile()) {
				throw new BizNotFoundException("해당 첨부파일이 존재하지 않습니다");
			}
			resp.setHeader("Content-Type", "application/octet-stream;");
			resp.setHeader("Content-Disposition", "attachment;filename=\"" + originalName + "\";");
			resp.setHeader("Content-Transfer-Encoding", "binary;");
			resp.setContentLength((int) f.length());
			resp.setHeader("Pragma", "no-cache;");
			resp.setHeader("Expires", "-1;");
			
			FileUtils.copyFile(f, resp.getOutputStream());
			resp.getOutputStream().close();
			try {
				attachService.increaseDownHit(atchNo);
			} catch(Throwable e) {
				logger.error(e.getMessage(), e);
			}
		} catch (BizNotFoundException e) {
			logger.error(e.getMessage(), e);
			printMessage(resp, "해당 첨부파일이 존재하지 않습니다");
		} catch (IOException e) {
			resp.reset();
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
	}

	private void printMessage(HttpServletResponse resp, String msg) throws Exception {
		resp.setCharacterEncoding("utf-8");
		resp.setHeader("Content-Type", "text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		out.println("<script type='text/javascript'>");
		out.println(" alert('" + msg + "');");
		out.println(" self.close();");
		out.println("</script>");
		out.println("<h4>첨부파일 문제 " + msg + "</h4>");
		out.println("<button onclick='self.close()'>닫기</button>");
	}
}
