package com.ottz.contents.service;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ottz.contents.dao.IContentsDao;
import com.ottz.contents.vo.ContentsSearchVO;
import com.ottz.contents.vo.ContentsVO;
import com.ottz.contents.vo.ScoreVO;
import com.ottz.exception.BizNotEffectedException;
import com.ottz.exception.BizNotFoundException;

@Service
public class ContentsServiceImpl implements IContentsService {

	@Inject
	IContentsDao contentDao;
	
	@Override
	public List<ContentsVO> getContentList(ContentsSearchVO searchVO) {
		int totalRowCount = contentDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		List<ContentsVO> contentsList = contentDao.getContentsList(searchVO);
		return contentsList;
	}

	@Override
	public ContentsVO getContent(String conNo) throws BizNotFoundException {
		ContentsVO content = contentDao.getContent(conNo);
		System.out.println(content);
		return content;
	}

	@Override
	public void saveContent(ContentsVO contentVO) throws BizNotEffectedException {
		// TODO Auto-generated method stub
	}

	@Override
	public String getOtt(String conNo) throws BizNotFoundException {
		String ottStr = contentDao.getOtt(conNo);
		return ottStr;
	}

	@Override
	public String getGenre(String conNo) throws BizNotFoundException {
		String genreStr = contentDao.getGenre(conNo);
		return genreStr;
	}

	@Override
	public void insertScore(ScoreVO scoreVO) throws BizNotEffectedException {
		if (contentDao.getScore(scoreVO) == null) {
			contentDao.insertScore(scoreVO);
		}else {
			contentDao.updateScore(scoreVO);
		}
	}


	@Override
	public List<ContentsVO> getScore(String memId) {
		List<ContentsVO> scoreList = contentDao.getScoreList(memId);
		System.out.println(scoreList);
		return scoreList;
	}

}
