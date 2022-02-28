package com.ottz.thema.web;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ottz.contents.vo.ContentsSearchVO;
import com.ottz.contents.vo.ContentsVO;
import com.ottz.contents.web.restController;
import com.ottz.thema.service.IThemaService;

@Controller
public class ThemaController {

	private Logger logger = LoggerFactory.getLogger(restController.class);
	
	@Inject
	IThemaService themaService;
	
	@ResponseBody
	@RequestMapping(path = "ottzHero.wow")
	public List<ContentsVO> ottzHero(ContentsSearchVO searchVO) {
		List<ContentsVO> heroList= themaService.getHero(searchVO);
		return heroList;
	}
	
	
	@ResponseBody
	@RequestMapping(path = "ottzHarry.wow")
	public List<ContentsVO> ottzHarry(ContentsSearchVO searchVO) {
		List<ContentsVO> harryList= themaService.getHarry(searchVO);
		return harryList;
	}

	@ResponseBody
	@RequestMapping(path = "ottzRing.wow")
	public List<ContentsVO> ottzRing(ContentsSearchVO searchVO) {
		List<ContentsVO> ringList= themaService.getRing(searchVO);
		return ringList;
	}
	
	
	
	@ResponseBody
	@RequestMapping(path = "ottzFantasy.wow")
	public List<ContentsVO> ottzFantasy(ContentsSearchVO searchVO) {
		List<ContentsVO> fantasyList= themaService.getFantasy(searchVO);
		return fantasyList;
	}

	
	
	@ResponseBody
	@RequestMapping(path = "ottzSpring.wow")
	public List<ContentsVO> ottzSpring(ContentsSearchVO searchVO) {
		List<ContentsVO> springList= themaService.getSpring(searchVO);
		return springList;
	}
	
	
	@ResponseBody
	@RequestMapping(path = "ottzThriller.wow")
	public List<ContentsVO> ottzThriller(ContentsSearchVO searchVO) {
		List<ContentsVO> thrillerList= themaService.getThriller(searchVO);
		return thrillerList;
	}

	
	@ResponseBody
	@RequestMapping(path = "ottzDocu.wow")
	public List<ContentsVO> ottzDocu(ContentsSearchVO searchVO) {
		List<ContentsVO> docuList= themaService.getDocu(searchVO);
		return docuList;
	}
	
	
	@ResponseBody
	@RequestMapping(path = "ottzRandom.wow")
	public List<ContentsVO> ottzRandom(ContentsSearchVO searchVO) {
		List<ContentsVO> randomList= themaService.getRandom(searchVO);
		return randomList;
	}
}






/* 창희쌤 최고..!
		List<ContentsVO> totalList= themaService.getHero(searchVO); //전체리스트
		List<ContentsVO> heroList= totalList.stream().filter( n-> n.getConTitle().contains("어벤져스") ).collect(Collectors.toList());
		List<ContentsVO> harryList= totalList.stream().filter( n->n.getConTitle().contains("해리 포터") ).collect(Collectors.toList());
		List<ContentsVO> ringList= totalList.stream().filter( n->	n.getConTitle().contains("반지%") ).collect(Collectors.toList());
		List<ContentsVO> thriller= totalList.stream().filter( n->	(n.getConGenre().contains("스릴러")) ).collect(Collectors.toList());
		List<ContentsVO> thrillerPaging= new ArrayList<ContentsVO>(); for(int i=searchVO.getFirstRow(); 
				i<searchVO.getLastRow(); i++) {
		thrillerPaging.add(thriller.get(i)); }
 */