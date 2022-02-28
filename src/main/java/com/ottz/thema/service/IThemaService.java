package com.ottz.thema.service;

import java.util.List;

import com.ottz.contents.vo.ContentsSearchVO;
import com.ottz.contents.vo.ContentsVO;

public interface IThemaService {
	public List<ContentsVO> getHero(ContentsSearchVO searchVO);
	public List<ContentsVO> getHarry(ContentsSearchVO searchVO);
	public List<ContentsVO> getRing(ContentsSearchVO searchVO);
	public List<ContentsVO> getSpring(ContentsSearchVO searchVO);
	public List<ContentsVO> getThriller(ContentsSearchVO searchVO);
	public List<ContentsVO> getDocu(ContentsSearchVO searchVO);
	public List<ContentsVO> getFantasy(ContentsSearchVO searchVO);
	public List<ContentsVO> getRandom(ContentsSearchVO searchVO);
}
