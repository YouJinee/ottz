package com.ottz.contents.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ottz.contents.service.IContentsService;
import com.ottz.contents.vo.ContentsSearchVO;
import com.ottz.contents.vo.ContentsVO;
import com.ottz.contents.vo.ScoreVO;
import com.ottz.exception.BizNotEffectedException;

@RestController
public class restController {

	@Inject
	IContentsService contentsService;
	
	private Logger logger = LoggerFactory.getLogger(restController.class);
	
	@RequestMapping(value = "/ottSearch/contentsList", produces = "application/json; charset = utf-8")
	public Map<String, Object> contentsList( ContentsSearchVO searchVO) {

		logger.debug("serarchVO = {}", searchVO);
		System.out.println(searchVO);
		System.out.println("=================");
		for(String s : searchVO.getSearchOtt()) {
			System.out.println(s);
		}
		System.out.println("=================");
		List<ContentsVO> contentsList = contentsService.getContentList(searchVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", contentsList);
		map.put("size", contentsList.size());
		return map;
	}
	
	@RequestMapping(value="/ottView/ottScore", produces =  "application/json; charset = utf-8")
	public String contentsScore(String conNo, String memId, float score) {
		ScoreVO scoreVO = new ScoreVO();
		scoreVO.setConNo(conNo);
		scoreVO.setMemId(memId);
		scoreVO.setScore(score);
		try {
			contentsService.insertScore(scoreVO);
		} catch (BizNotEffectedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
}

