package com.ottz.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ottz.review.vo.ReviewVO;

@Mapper
public interface IReviewDao {

	public int insertReview(ReviewVO review);
	public int getReviewCountByParent(ReviewVO review);
	public List<ReviewVO> getReviewListByParent(ReviewVO review);
	public ReviewVO getReview(int reNo);
	public int updateReview(ReviewVO review);
	public int deleteReview(ReviewVO review);
}
