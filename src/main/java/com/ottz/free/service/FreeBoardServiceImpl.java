package com.ottz.free.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ottz.attach.dao.IAttachDao;
import com.ottz.attach.vo.AttachVO;
import com.ottz.exception.BizNotEffectedException;
import com.ottz.exception.BizNotFoundException;
import com.ottz.exception.BizPasswordNotMatchedException;
import com.ottz.free.dao.IFreeBoardDao;
import com.ottz.free.vo.FreeBoardSearchVO;
import com.ottz.free.vo.FreeBoardVO;

@Service
public class FreeBoardServiceImpl implements IFreeBoardService {

	@Inject
	IFreeBoardDao freeBoardDao;

	@Inject
	IAttachDao attachDao;

	@Override
	public List<FreeBoardVO> getBoardList(FreeBoardSearchVO searchVO) {
		int totalRowCount = freeBoardDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return freeBoardDao.getBoardList(searchVO);
	}

	@Override
	public FreeBoardVO getBoard(int boNo) throws BizNotFoundException {
		FreeBoardVO freeBoard = freeBoardDao.getBoard(boNo);
		if (freeBoard == null) {
			throw new BizNotFoundException();
		}
		return freeBoard;
	}

	@Override
	public void increaseHit(int boNo) throws BizNotEffectedException {
		int cnt = freeBoardDao.increaseHit(boNo);
		if (cnt == 0) {
			throw new BizNotEffectedException();
		}
	}

	@Override
	public void modifyBoard(FreeBoardVO freeBoard)
			throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
		FreeBoardVO vo = freeBoardDao.getBoard(freeBoard.getBoNo());
		if (vo == null)
			throw new BizNotFoundException();

		int cnt = freeBoardDao.updateBoard(freeBoard);
		if (cnt == 0)
			throw new BizNotEffectedException();

		List<AttachVO> attaches = freeBoard.getAttaches();
		if (attaches != null) {
			for (AttachVO attach : attaches) {
				attach.setAtchParentNo(freeBoard.getBoNo());
				attachDao.insertAttach(attach);
			}
		}
		int delAtchNos[] = freeBoard.getDelAtchNos();
		if (delAtchNos != null) {
			attachDao.deleteAttaches(delAtchNos);
		}
		System.out.println(attaches);

	}

	@Override
	public void removeBoard(FreeBoardVO freeBoard)
			throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
		FreeBoardVO vo = freeBoardDao.getBoard(freeBoard.getBoNo());
		if (vo == null)
			throw new BizNotFoundException();

		int cnt = freeBoardDao.deleteBoard(freeBoard);
		if (cnt == 0)
			throw new BizNotEffectedException();
	}

	@Override
	public void registBoard(FreeBoardVO freeBoard) throws BizNotEffectedException {
		int cnt = freeBoardDao.insertBoard(freeBoard);
		if (cnt == 0)
			throw new BizNotEffectedException();
		List<AttachVO> attaches = freeBoard.getAttaches();
		if (attaches != null) {
			for (AttachVO attach : attaches) {
				attach.setAtchParentNo(freeBoard.getBoNo());
				attachDao.insertAttach(attach);
			}
		}
	}
}
