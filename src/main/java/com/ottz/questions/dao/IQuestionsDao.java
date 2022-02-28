package com.ottz.questions.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ottz.free.vo.FreeBoardVO;
import com.ottz.questions.vo.QuestionsSearchVO;
import com.ottz.questions.vo.QuestionsVO;

@Mapper
public interface IQuestionsDao {
	public int getTotalRowCount(QuestionsSearchVO searchVO);
	public List<QuestionsVO> getQuestionsList(QuestionsSearchVO searchVO);
	public QuestionsVO getQuestions(int qNo);
	public int increaseHit(int qNo);
	public int updateQuestions(QuestionsVO questions);
	public int deleteQuestions(QuestionsVO questions);
	public int insertQuestions(QuestionsVO questions);

	public List<FreeBoardVO> getQuestionsMap(Map<String, Object> map);
	public List<FreeBoardVO> getQuestionsAnotation(@Param(value="qNo") int qNo, @Param (value="qTitle")String qTitle);
}