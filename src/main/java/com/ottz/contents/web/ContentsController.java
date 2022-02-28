package com.ottz.contents.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ottz.contents.vo.ContentsSearchVO;
import com.ottz.contents.vo.ContentsVO;
import com.ottz.contents.vo.RankVO;


	@Controller
	public class ContentsController {
		
		private Logger logger = LoggerFactory.getLogger(restController.class);
	
//	실시간차트
	@RequestMapping(path="/conPage.wow",method=RequestMethod.GET)
	public String conPage(Model model) {
		ArrayList<RankVO> rankList = new ArrayList<RankVO>();
	   model.addAttribute("rankList", rankList);
		return "contents/conPage";
		}
	
	
	@RequestMapping(value = "/conPage_1.wow", produces = "application/json; charset = utf-8")
	@ResponseBody
	public Map<String, Object> conPage_1() {

		Map<String, Object> map = new HashMap<String, Object>();
		MovieRank movieRank  = new MovieRank();
		ArrayList<RankVO> rankList = new ArrayList<RankVO>();
		rankList = movieRank.rank();
		map.put("result", true);
		map.put("rankList", rankList);
		return map;
	}
	
//홍보페이지
	@RequestMapping(path = "ottzPromotion.wow")
	public String ottzPromotion(Model model, @ModelAttribute("searchVO") ContentsSearchVO searchVO
			  ) {
		return "contents/ottzPromotion";
	}
	
	
}
	
	
	