package com.ottz.reply.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.ottz.reply.dao.IReplyDao;
import com.ottz.exception.BizAccessFailException;
import com.ottz.exception.BizNotFoundException;
import com.ottz.reply.vo.ReplySearchVO;
import com.ottz.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements IReplyService{

	@Inject
	IReplyDao replyDao;
	
	@Override
	public List<ReplyVO> getReplyListByParent(ReplySearchVO searchVO) {
		int totalRowCount = replyDao.getReplyCountByParent(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		List<ReplyVO> replyList = replyDao.getReplyListByParent(searchVO);
		return replyList;
	}

	@Override
	public void registReply(ReplyVO reply) {
		replyDao.insertReply(reply);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws BizNotFoundException, BizAccessFailException {
		ReplyVO vo = replyDao.getReply(reply.getReNo());
		if(vo == null) throw new BizNotFoundException();
		if(!vo.getReMemId().equals(reply.getReMemId())) throw new BizAccessFailException();
		replyDao.updateReply(reply);
	}

	@Override
	public void removeReply(ReplyVO reply) throws BizNotFoundException, BizAccessFailException {
		ReplyVO vo = replyDao.getReply(reply.getReNo());
		if(vo == null) throw new BizNotFoundException();
		if(!vo.getReMemId().equals(reply.getReMemId())) throw new BizAccessFailException();
		replyDao.deleteReply(reply);
	}

}
