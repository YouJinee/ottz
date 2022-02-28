package com.ottz.reply.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ottz.exception.BizAccessFailException;
import com.ottz.exception.BizNotFoundException;
import com.ottz.reply.service.IReplyService;
import com.ottz.reply.vo.ReplySearchVO;
import com.ottz.reply.vo.ReplyVO;

@RestController
public class ReplyController {

	@Inject
	IReplyService replyService;
	
	@RequestMapping(value = "replyList", produces = "application/json; charset = utf-8")
	public Map<String, Object> replyList(ReplySearchVO searchVO) {
		List<ReplyVO> replyList = replyService.getReplyListByParent(searchVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", replyList);
		map.put("size", replyList.size());
		return map;
	}
	
	@RequestMapping(value = "replyRegist", produces = "application/json; charset = utf-8")
		public Map<String, Object> replyRegist(ReplyVO reply) {
			replyService.registReply(reply);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("result", true);
			map.put("msg", "등록성공");
			return map;
	}
	
	@RequestMapping(value = "replyModify", produces = "application/json; charset = utf-8")
		public Map<String, Object> replyModify(ReplyVO reply) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			replyService.modifyReply(reply);
			map.put("result", true);
			map.put("msg", "수정성공");
		} catch (BizAccessFailException e) {
			map.put("result", false);
			map.put("msg", "당신은 작성자가 아닙니다");
		} catch (BizNotFoundException e) {
			map.put("result", false);
			map.put("msg", "댓글이 없습니다");
		}
		return map;
	} 
	
	@RequestMapping(value = "replyDelete", produces = "application/json; charset = utf-8")
	public Map<String, Object> replyDelete(ReplyVO reply) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			replyService.removeReply(reply);
			map.put("result", true);
			map.put("msg", "삭제성공");
		} catch (BizAccessFailException e) {
			map.put("result", false);
			map.put("msg", "당신은 작성자가 아닙니다");
		} catch (BizNotFoundException e) {
			map.put("result", false);
			map.put("msg", "댓글이 없습니다");
		}
		return map;
	}
	
}
