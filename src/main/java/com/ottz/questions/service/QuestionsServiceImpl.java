package com.ottz.questions.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ottz.attach.dao.IAttachDao;
import com.ottz.attach.vo.AttachVO;

import com.ottz.exception.BizNotEffectedException;
import com.ottz.exception.BizNotFoundException;
import com.ottz.exception.BizPasswordNotMatchedException;

import com.ottz.questions.dao.IQuestionsDao;
import com.ottz.questions.vo.QuestionsSearchVO;
import com.ottz.questions.vo.QuestionsVO;


@Service
public class QuestionsServiceImpl implements IQuestionsService{

	@Inject
	IQuestionsDao questionsDao;
	
	@Inject
	IAttachDao attachDao;

	

	@Override
	public List<QuestionsVO> getQuestList(QuestionsSearchVO search) {
		int totalRowCount = questionsDao.getTotalRowCount(search);
		search.setTotalRowCount(totalRowCount);
		search.pageSetting();
		return questionsDao.getQuestionsList(search);
	}

	@Override
	public QuestionsVO getQuestions(int qNo) throws BizNotFoundException {
		QuestionsVO questions = questionsDao.getQuestions(qNo);
		if(questions ==null) {
			throw new BizNotFoundException();
		}
		return questions;
	}

	@Override
	public void increaseHit(int qNo) throws BizNotEffectedException {
		int cnt= questionsDao.increaseHit(qNo);
		if(cnt == 0) {
			throw new BizNotEffectedException();
		}
	}

	
	@Override
	public void modifyBoard(QuestionsVO questions) 
			throws BizNotEffectedException, BizNotFoundException {
		QuestionsVO vo = questionsDao.getQuestions(questions.getqNo());
		if(vo == null)
			throw new BizNotFoundException();
		
		int cnt = questionsDao.updateQuestions(questions);
		if (cnt == 0)
			throw new BizNotEffectedException();

		List<AttachVO> attaches = questions.getAttaches();
		if (attaches != null) {
			for (AttachVO attach : attaches) {
				attach.setAtchParentNo(questions.getqNo());
				attachDao.insertAttach(attach);
			}
		}
		int delAtchNos[] = questions.getDelAtchNos();
		if (delAtchNos != null) {
			attachDao.deleteAttaches(delAtchNos);
		}
	}
	
	
	@Override
	public void removeQuestions(QuestionsVO questions)
			throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
		QuestionsVO vo = questionsDao.getQuestions(questions.getqNo());
		if (vo == null)
			throw new BizNotFoundException();

		int cnt = questionsDao.deleteQuestions(questions);
		if (cnt == 0)
			throw new BizNotEffectedException();
	}
	

	@Override
	public void registQuestions(QuestionsVO questions) throws  BizNotEffectedException {
		int cnt=questionsDao.insertQuestions(questions);
		if(cnt==0) throw new BizNotEffectedException();
		List<AttachVO> attaches = questions.getAttaches();
		if(attaches !=null) {
			for(AttachVO attach : attaches) {
				attach.setAtchParentNo(questions.getqNo());
				attachDao.insertAttach(attach);
			}
		}
	}
}
