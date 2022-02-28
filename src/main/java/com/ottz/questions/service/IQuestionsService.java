package com.ottz.questions.service;

import java.util.List;

import com.ottz.exception.BizDuplicateKeyException;
import com.ottz.exception.BizNotEffectedException;
import com.ottz.exception.BizNotFoundException;
import com.ottz.exception.BizPasswordNotMatchedException;
import com.ottz.free.vo.FreeBoardVO;
import com.ottz.questions.vo.QuestionsVO;
import com.ottz.questions.vo.QuestionsSearchVO;

public interface IQuestionsService {
	public List<QuestionsVO> getQuestList(QuestionsSearchVO searchVO);
	public QuestionsVO getQuestions(int qNo) throws BizNotFoundException;
	public void increaseHit(int qNo) throws BizNotEffectedException;
	public void modifyBoard(QuestionsVO questions) throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException;
	public void removeQuestions(QuestionsVO questions) throws BizNotEffectedException, BizNotFoundException, BizPasswordNotMatchedException;
	public void registQuestions(QuestionsVO questions) throws BizNotEffectedException;

	
}
