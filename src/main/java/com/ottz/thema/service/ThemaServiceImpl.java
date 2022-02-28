package com.ottz.thema.service ;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ottz.contents.vo.ContentsSearchVO;
import com.ottz.contents.vo.ContentsVO;
import com.ottz.thema.dao.IThemaDao;

@Service
public class ThemaServiceImpl implements IThemaService {

	@Inject	
	IThemaDao thema;
	/*
	@Override
	public List<ContentsVO> getHero(ContentsSearchVO searchVO) {
		int totalRowCount=thema.getHeroTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();

		List<ContentsVO> heroList = thema.getHero(searchVO);

		return heroList;
	}
*/

	@Override
	public List<ContentsVO> getHero(ContentsSearchVO searchVO) {
		List<ContentsVO> heroList = thema.getHarry(searchVO);
		return heroList;
	}
	
	
	@Override
	public List<ContentsVO> getHarry(ContentsSearchVO searchVO) {
		List<ContentsVO> harryList = thema.getHarry(searchVO);
		return harryList;
	}


	@Override
	public List<ContentsVO> getRing(ContentsSearchVO searchVO) {
		List<ContentsVO> ringList = thema.getRing(searchVO);
		return ringList;
		}


	@Override
	public List<ContentsVO> getSpring(ContentsSearchVO searchVO) {
		List<ContentsVO> springList = thema.getSpring(searchVO);
		return springList;
	}


	@Override
	public List<ContentsVO> getThriller(ContentsSearchVO searchVO) {
		List<ContentsVO> thrillerList = thema.getThriller(searchVO);
		return thrillerList;
	}


	@Override
	public List<ContentsVO> getDocu(ContentsSearchVO searchVO) {
		List<ContentsVO> docuList = thema.getDocu(searchVO);
		return docuList;
	}


	@Override
	public List<ContentsVO> getFantasy(ContentsSearchVO searchVO) {
		List<ContentsVO> fantasyList = thema.getFantasy(searchVO);
		return fantasyList;
	}


	@Override
	public List<ContentsVO> getRandom(ContentsSearchVO searchVO) {
		List<ContentsVO> randomList = thema.getRandom(searchVO);
		System.out.println(randomList);
		return randomList;
	}



	
}
