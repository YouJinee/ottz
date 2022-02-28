package com.ottz.theme.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ottz.contents.vo.ContentsSearchVO;
import com.ottz.contents.vo.ContentsVO;
import com.ottz.contents.web.restController;
import com.ottz.theme.service.IThemeService;

@Controller
public class ThemeController {

	private Logger logger = LoggerFactory.getLogger(restController.class);
	
	@Inject
	IThemeService themeService;
	
	@RequestMapping(path = "ottzThemeList.wow")
	public String ottzThemeList(Model model,@ModelAttribute("searchVO") ContentsSearchVO searchVO) {
		String themeGenre = themeService.getGenre(searchVO);
		model.addAttribute("themeGenre",themeGenre);
		return "contents/ottzTheme";
	} //빈껍데기
	
	
	@ResponseBody
	@PostMapping(path = "ottzTheme")
	public Map<String, Object> ottzTheme(ContentsSearchVO searchVO) {
		List<ContentsVO> themeList= themeService.getTheme(searchVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", themeList);
		map.put("size", themeList.size());
		return map;
	}	//데이터
	
	
	
//추가한 거
	@RequestMapping(path = "ottzRandomList.wow")
	public String ottzRandomList(@ModelAttribute("searchVO") ContentsSearchVO searchVO) {
		return "contents/ottzRandom";
	} //빈껍데기
	
	@ResponseBody
	@PostMapping(path = "ottzRandom")
	public Map<String, Object> ottzRandom(ContentsSearchVO searchVO) {
		List<ContentsVO> randomList= themeService.getRandom(searchVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", randomList);
		map.put("size", randomList.size());
		return map;
	}
	
	
	
	
	
}

