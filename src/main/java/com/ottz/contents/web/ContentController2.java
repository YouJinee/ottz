package com.ottz.contents.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ottz.contents.service.IContentsService;
import com.ottz.contents.vo.ContentsSearchVO;
import com.ottz.contents.vo.ContentsVO;
import com.ottz.exception.BizNotFoundException;
import com.ottz.login.vo.UserVO;
import com.ottz.save.service.ISaveService;
import com.ottz.save.vo.SaveVO;

@Controller
public class ContentController2 {

	@Inject
	IContentsService contentsService;
	@Inject
	ISaveService saveService;
	
	@RequestMapping(path = "ottzSearch.wow")
	public String ottzSearch(Model model, @ModelAttribute("searchVO") ContentsSearchVO searchVO
			  ) {
		return "contents/ottzSearch";
	}
	
	@RequestMapping(path = "ottzView.wow")
	public String ottzView(HttpServletRequest req, Model model, @RequestParam(required = true) String conNo) {
		try {
			ContentsVO content = contentsService.getContent(conNo);
			System.out.println(content);
			model.addAttribute("content", content);
			List<String> ottList = new ArrayList<String>();
			String ottStr = contentsService.getOtt(conNo);
			if(ottStr != null) {
				String[] ottArray = ottStr.split(",");
				for(int i=0; i<ottArray.length; i++) {
					ottList.add(ottArray[i]);
				}
			}
			model.addAttribute("ottList", ottList);
			String conGenre = contentsService.getGenre(conNo);
			model.addAttribute("conGenre", conGenre);
			if (content.getConScore()!=null ) {
				int conScore = Integer.parseInt(content.getConScore());
				model.addAttribute("conScore", conScore);
			}
			HttpSession session = req.getSession();
			UserVO user = (UserVO) session.getAttribute("USER_INFO");
			SaveVO save = new SaveVO();
			save.setConNo(conNo);
			SaveVO saveVO = new SaveVO();
			if(user != null) {
				save.setMemId(user.getUserId());
				saveVO= saveService.getSaveContents(save);
				model.addAttribute("saveVO", saveVO); 
			}else {
				model.addAttribute("saveVO", null);
			}
		} catch (BizNotFoundException e) {
			e.printStackTrace();
		}
		return "contents/ottzView";
	}
}
