package com.ottz.review.service;
import java.util.List;

import com.ottz.exception.BizAccessFailException;
import com.ottz.exception.BizNotFoundException;
import com.ottz.review.vo.ReviewVO;

public interface IReviewService {
	//리뷰 등록
	public void registReview(ReviewVO review) ;
	//리뷰 리스트 가져오기
	public List<ReviewVO> getReviewListByParent(ReviewVO review);
	public void modifyReview(ReviewVO review) throws BizNotFoundException,BizAccessFailException;
	//댓글이 존재하지 않으면 BizNotFound, 댓글 작성자와 사용자가 다르면 BizAccessFail
	public void removeReview(ReviewVO review) throws BizNotFoundException, BizAccessFailException;
}
