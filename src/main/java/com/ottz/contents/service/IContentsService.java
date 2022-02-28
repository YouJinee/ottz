package com.ottz.contents.service;

import java.util.List;

import com.ottz.contents.vo.ContentsSearchVO;
import com.ottz.contents.vo.ContentsVO;
import com.ottz.contents.vo.ScoreVO;
import com.ottz.exception.BizNotEffectedException;
import com.ottz.exception.BizNotFoundException;

public interface IContentsService {
	public List<ContentsVO> getContentList(ContentsSearchVO searchVO);
	
	public ContentsVO getContent(String conNo) throws BizNotFoundException;
	
	public void saveContent(ContentsVO contentVO) throws BizNotEffectedException;
	
	public String getOtt(String conNo) throws BizNotFoundException;
	
	public String getGenre(String conNo) throws BizNotFoundException;

	public void insertScore(ScoreVO scoreVO) throws BizNotEffectedException;
	
	public List<ContentsVO> getScore (String memId);
}
