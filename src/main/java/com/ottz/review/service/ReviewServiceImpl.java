package com.ottz.review.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ottz.exception.BizAccessFailException;
import com.ottz.exception.BizNotFoundException;
import com.ottz.review.dao.IReviewDao;
import com.ottz.review.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements IReviewService{

	@Inject
	IReviewDao reviewDao;

	@Override
	public void registReview(ReviewVO review) {
		System.out.println(review);
		reviewDao.insertReview(review);
	}

	@Override
	public List<ReviewVO> getReviewListByParent(ReviewVO review) {
		int totalRowCount = reviewDao.getReviewCountByParent(review);
		review.setTotalRowCount(totalRowCount);
		review.pageSetting();
		List<ReviewVO> reviewList = reviewDao.getReviewListByParent(review);
		return reviewList;
	}

	@Override
	public void modifyReview(ReviewVO review) throws BizNotFoundException, BizAccessFailException {
		ReviewVO vo = reviewDao.getReview(review.getRvNo());
		if(vo==null) throw new BizNotFoundException();
		if(!vo.getRvMemId().contentEquals(review.getRvMemId())) throw new BizAccessFailException();
		reviewDao.updateReview(review);
	}

	@Override
	public void removeReview(ReviewVO review) throws BizNotFoundException, BizAccessFailException {
		ReviewVO vo = reviewDao.getReview(review.getRvNo());
		if(vo==null) throw new BizNotFoundException();
		if(!vo.getRvMemId().equals(review.getRvMemId())) throw new BizAccessFailException();
		reviewDao.deleteReview(review);
	}
	
	
}
