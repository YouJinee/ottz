package com.ottz.review.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ottz.exception.BizAccessFailException;
import com.ottz.exception.BizNotFoundException;
import com.ottz.review.service.IReviewService;
import com.ottz.review.vo.ReviewVO;

@RestController
public class ReviewController {

	@Inject
	IReviewService reviewService;
	
	@RequestMapping(value = "/review/reviewList",  produces = "application/json; charset = utf-8")
	public Map<String, Object> reviewList(ReviewVO review){
		List<ReviewVO> reviewList = reviewService.getReviewListByParent(review);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", reviewList);
		map.put("size", reviewList.size());
		return map;
	}
	@RequestMapping(value = "/review/reviewRegist", produces = "application/json; charset = utf-8")
	public Map<String, Object> reviewRegist(String rvParentNo, String rvMemId, String rvContent) {
		System.out.println(rvParentNo + rvMemId + rvContent);
		ReviewVO review = new ReviewVO();
		review.setRvParentNo(rvParentNo);
		review.setRvMemId(rvMemId);
		review.setRvContent(rvContent);
		reviewService.registReview(review);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("msg", "등록성공");
		return map;
	}
	
	@RequestMapping(value = "/review/reviewModify", produces = "application/json; charset = utf-8")
	public Map<String, Object> reviewModify(ReviewVO review){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			reviewService.modifyReview(review);
			map.put("result", true);
			map.put("msg", "수정성공");
		} catch (BizNotFoundException e) {
			map.put("result", false);
			map.put("msg", "댓글이 없습니다.");
			e.printStackTrace();
		} catch (BizAccessFailException e) {
			map.put("result", false);
			map.put("msg", "작성자만 수정 가능합니다.");
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value = "/review/reviewDelete", produces = "application/json; charset = utf-8")
	public Map<String, Object> reviewDelete(ReviewVO review){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			reviewService.removeReview(review);
			map.put("result", true);
			map.put("msg", "댓글 작성자만 삭제할 수 있습니다.");
		} catch (BizNotFoundException e) {
			map.put("result", false);
			map.put("msg", "댓글 작성자만 삭제할 수 있습니다.");
			e.printStackTrace();
		} catch (BizAccessFailException e) {
			// TODO Auto-generated catch block
			map.put("result", false);
			map.put("msg", "댓글이 없습니다.");
		}
		return map;
	}
}
