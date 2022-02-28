package com.ottz.contents.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ottz.contents.vo.ContentsSearchVO;
import com.ottz.contents.vo.ContentsVO;
import com.ottz.contents.vo.ScoreVO;
@Mapper
public interface IContentsDao {
	public List<ContentsVO> getContentsList(ContentsSearchVO SearchVO);
	public ContentsVO getContent(String conNo);
	public int getTotalRowCount(ContentsSearchVO searchVO);
	public String getOtt(String conNo);
	public String getGenre(String conNo);
	public void insertScore(ScoreVO scoreVO);
	public List<ContentsVO> getScoreList(String memId);
	public ScoreVO getScore(ScoreVO scoreVO);
	public int updateScore(ScoreVO scoreVO); 
}
