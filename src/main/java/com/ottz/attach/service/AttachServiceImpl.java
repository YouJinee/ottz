package com.ottz.attach.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ottz.attach.dao.IAttachDao;
import com.ottz.attach.vo.AttachVO;
import com.ottz.exception.BizException;
import com.ottz.exception.BizNotFoundException;

@Service
public class AttachServiceImpl implements IAttachService {
	
	@Inject
	private IAttachDao attachDao;

	@Override
	public AttachVO getAttach(int atchNo) throws BizException {
		AttachVO vo = attachDao.getAttach(atchNo);
		if (vo == null) {
			throw new BizNotFoundException("첨부파일 [" + atchNo + "]에 대한 조회 실패");
		}
		return vo;
	}

	@Override
	public void increaseDownHit(int atchNo) throws BizException {
		attachDao.increaseDownHit(atchNo);
	}
}
