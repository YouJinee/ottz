package com.ottz.myPage.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ottz.common.valid.Modify;
import com.ottz.common.vo.ResultMessageVO;
import com.ottz.contents.dao.IContentsDao;
import com.ottz.contents.service.IContentsService;
import com.ottz.contents.vo.ContentsVO;
import com.ottz.exception.BizNotEffectedException;
import com.ottz.exception.BizNotFoundException;
import com.ottz.login.vo.UserVO;
import com.ottz.member.service.IMemberService;
import com.ottz.member.vo.MemberVO;
import com.ottz.save.service.ISaveService;
import com.ottz.save.vo.SaveVO;

@Controller
public class MypageController {

	@Inject
	IMemberService memberService;
	
	@Inject
	ISaveService saveService;
	@Inject
	IContentsService contentService;
	@RequestMapping("info.wow")
	public String Info(Model model, HttpSession session, @ModelAttribute("save") SaveVO save) {
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		try {
			List<SaveVO> saveList = saveService.getSaveBoxContents(user);
			MemberVO member = memberService.getMember(user.getUserId());
			List<ContentsVO> scoreList = contentService.getScore(user.getUserId());
			System.out.println(scoreList);
			model.addAttribute("saveList", saveList);
			model.addAttribute("scoreList", scoreList);
			model.addAttribute("member", member);
			return "mypage/info";
		} catch (BizNotFoundException e) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "회원없음", "회원이 존재하지 않습니다.", "/", "홈으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/messages";
		}
	}
	
	@RequestMapping("edit.wow")
	public String Edit(Model model, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		try {
			MemberVO member = memberService.getMember(user.getUserId());
			model.addAttribute("member", member);
			return "mypage/edit";
		} catch (BizNotFoundException e) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "회원없음", "회원이 존재하지 않습니다.", "/", "홈으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/messages";
		}
		
	}
	
	
	@PostMapping("modify.wow")
	public String Modify(Model model, HttpSession session, HttpServletRequest req,
			@ModelAttribute("member") @Validated(value = {Modify.class}) 
			MemberVO memberVO, BindingResult error) {
		if (error.hasErrors()) {
			return "mypage/edit";
		}
		
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		
		try {
			memberService.modifyMember(memberVO);
			user.setUserName(memberVO.getMemName());
			user.setUserPass(memberVO.getMemPass());
			session.setAttribute("USER_INFO", user);
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "내 정보 수정 완료", "내 정보가 수정되었습니다", "/", "이전으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			
			return "common/message";
		} catch (BizNotFoundException e) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "내 정보 없음", "내 정보가 존재하지 않습니다.", "/", "홈으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/messages";
			
		} catch (BizNotEffectedException e) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "내 정보 수정 실패", "내 정보 수정에 실패했습니다.", "/", "홈으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/messages";
		}
		
	}
	
}

