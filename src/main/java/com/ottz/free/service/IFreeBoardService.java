package com.ottz.free.service;

import java.util.List;

import com.ottz.exception.BizNotEffectedException;
import com.ottz.exception.BizNotFoundException;
import com.ottz.exception.BizPasswordNotMatchedException;
import com.ottz.free.vo.FreeBoardSearchVO;
import com.ottz.free.vo.FreeBoardVO;

public interface IFreeBoardService {
	/**
	 * DB에 있는 free_board 테이블을 조회하는 메소드이다.
	 * 
	 * @since 2021.12.03
	 * @author pc34
	 * @param 없더용
	 * @return List<FreeBoardVO>
	 */
	public List<FreeBoardVO> getBoardList(FreeBoardSearchVO searchVO);

	/**
	 * free_board를 조회하는데 한 row만 조회한다.
	 * 
	 * @param int boNo
	 * @return FreeBoardVO
	 * @throws BizNotFoundException
	 */

	public FreeBoardVO getBoard(int boNo) throws BizNotFoundException;

	public void increaseHit(int boNo) throws BizNotEffectedException;

	public void modifyBoard(FreeBoardVO freeBoard)
			throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException;

	public void removeBoard(FreeBoardVO freeBoard)
			throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException;

	public void registBoard(FreeBoardVO freeBoard) throws BizNotEffectedException;

}
