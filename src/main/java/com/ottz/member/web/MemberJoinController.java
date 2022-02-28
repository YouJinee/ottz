package com.ottz.member.web;

import javax.inject.Inject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.ottz.code.service.ICommCodeService;
import com.ottz.common.valid.Step1;
import com.ottz.common.valid.Step2;
import com.ottz.common.valid.Step3;
import com.ottz.common.vo.ResultMessageVO;
import com.ottz.exception.BizDuplicateKeyException;
import com.ottz.exception.BizNotEffectedException;
import com.ottz.exception.BizNotFoundException;
import com.ottz.member.service.IMemberService;
import com.ottz.member.vo.MemberVO;

@Controller
@SessionAttributes("member")
public class MemberJoinController {
	
	@ModelAttribute("member")
	public MemberVO member() {
		return new MemberVO();
	}

	@Inject
	IMemberService memberService;

	@Autowired
	ICommCodeService codeService;

	@RequestMapping("step1.wow")
	public String step1(@ModelAttribute("member") MemberVO memberVO) {
		return "join/step1";
	}

	@RequestMapping("step2.wow")
	public String step2(@ModelAttribute("member") @Validated(value = { Step1.class }) MemberVO memberVO,
			BindingResult error) {
		if (error.hasErrors())
			return "join/step1";
		return "join/step2";
	}

	@RequestMapping("regist.wow")
	public String regist(Model model, @ModelAttribute("member") @Validated(value = { Step2.class }) MemberVO memberVO,
			BindingResult error, SessionStatus sessionStatus, String memNic) throws BizNotFoundException {
		if (error.hasErrors())
			return "join/step2";
		try {
			memberService.registMember(memberVO);
			memberService.getMember(memberVO.getMemId());
			sessionStatus.setComplete();
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "회원가입 성공", "정상적으로 회원등록되었습니다!", "ottzSearch.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/messages";
		} catch (BizDuplicateKeyException ede) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "회원가입되었습니다", "OTTZ를 이용해보세요", "ottzSearch.wow", "홈으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message2";
		} catch (BizNotEffectedException ene) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "회원가입 실패.", "회원가입에 실패했습니다.", "login.wow", "로그인 페이지로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/messages";
		}
	}

	@RequestMapping("cancel")
	public String cancel(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "join/step1";
	}

	@RequestMapping("idCheck.wow")
	@ResponseBody
	public String idCheck(String memId) {
		try {
			if (memId == null || memId.equals("")) {
				return "O";
			}
			MemberVO memberVO = memberService.getMember(memId);
			
			return "Y";
		} catch (BizNotFoundException e) {
			return "N";
		}
	}
}
