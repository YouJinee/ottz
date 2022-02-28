package com.ottz.member.web;

import java.util.List;

import javax.inject.Inject;
import javax.validation.groups.Default;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ottz.code.service.ICommCodeService;
import com.ottz.common.valid.Modify;
import com.ottz.common.vo.ResultMessageVO;
import com.ottz.exception.BizDuplicateKeyException;
import com.ottz.exception.BizNotEffectedException;
import com.ottz.exception.BizNotFoundException;
import com.ottz.member.service.IMemberService;
import com.ottz.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Inject
	IMemberService memberService;
	
	@Autowired
	ICommCodeService codeService;
	
	@RequestMapping("memberList.wow")
	public String memberList(Model model, @ModelAttribute("memberVO") MemberVO memberVO) {			
		List<MemberVO> memberList = memberService.getMemberList(memberVO);
		model.addAttribute("memberList", memberList);
		return "member/memberList";		
	}
	
	@RequestMapping("memberView.wow") 
	public String memberView(Model model, @RequestParam(required = true) String memId) {
		try {
			MemberVO member = memberService.getMember(memId);
			model.addAttribute("member", member);
		} catch (BizNotFoundException e) {
			ResultMessageVO resultMemberVO = new ResultMessageVO();	
			resultMemberVO.messageSetting(false, "회원 찾기 실패", "회원을 찾는데 실패했습니다.", "memberList.wow", "목록으로");
			model.addAttribute("resultMemberVO", resultMemberVO);
			return "common/message";
		}
		return "member/memberView";
	}
	
	@RequestMapping("memberEdit.wow")
	public String memberEdit(Model model, String memId) {
		try {
			MemberVO member = memberService.getMember(memId);
			model.addAttribute("member",member);
		} catch (BizNotFoundException e) {
			ResultMessageVO resultMemberVO = new ResultMessageVO();	
			resultMemberVO.messageSetting(false, "회원 찾기 실패", "회원을 찾는데 실패했습니다.", "memberList.wow", "목록으로");
			model.addAttribute("resultMemberVO", resultMemberVO);
			return "common/message";
		}
		return "member/memberEdit";
	}
	
	@PostMapping("memberModify.wow")
	public String memberModify(Model model, @ModelAttribute("memberVO")
	@Validated(value = {Default.class, Modify.class})
	MemberVO memberVO, BindingResult erorr) {
			try {
				memberService.modifyMember(memberVO);
				ResultMessageVO resultMessageVO = new ResultMessageVO();
				resultMessageVO.messageSetting(true, "정상적으로 수정 되었습니다.", "축하축하", "memberList.wow", "홈으로");
				model.addAttribute("resultMessageVO", resultMessageVO);
				return "common/message";
			} catch (BizNotEffectedException enf) {
				ResultMessageVO resultMessageVO = new ResultMessageVO();
				resultMessageVO.messageSetting(true, "", "축하축하", "memberList.wow", "홈으로");
				model.addAttribute("resultMessageVO", resultMessageVO);
				return "common/message";
			} catch (BizNotFoundException ene) {
				ResultMessageVO resultMessageVO = new ResultMessageVO();
				resultMessageVO.messageSetting(true, "이제 비회원이네요", "축하축하", "memberList.wow", "홈으로");
				model.addAttribute("resultMessageVO", resultMessageVO);
				return "common/message";
			}		
	}
	
	@RequestMapping("memberDelete.wow")
	public String memberDelete(Model model, MemberVO memberVO) {
		try{
			memberService.removeMember(memberVO);			
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "회원 삭제 성공", "회원 삭제에 성공했습니다.", "memberList.wow", "목록으로");			
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}catch(BizNotFoundException enf){
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "회원 찾기 실패", "회원 찾기에 실패했습니다.", "memberList.wow", "목록으로");			
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}catch(BizNotEffectedException ene){
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "회원 삭제 실패", "회원 삭제에 실패했습니다.", "memberList.wow", "목록으로");			
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
	}
	
	@RequestMapping("memberForm.wow")
	public String memberForm(Model model, @ModelAttribute("memberVO") MemberVO memberVO) {
		return "member/memberForm";
	}
	
	@PostMapping("memberRegist.wow")
	public String memberRegist(Model model, MemberVO memberVO) {
		try{
			System.out.println(memberVO);
			memberService.registMember(memberVO);		
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "회원등록 성공", "정상적으로 회원등록되었습니다.", "/member/memberList.wow", "목록으로");		
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";		
		}catch(BizNotEffectedException ene){
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "회원등록 실패", "회원등록에 실패했습니다. 회훤정보가 잘못했습니다.", "/member/memberList.wow", "목록으로");			
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";		
		}catch(BizDuplicateKeyException ede){
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "회원등록 실패", "회원등록에 실했습니다. 회원정보가 이미 잘못했습니다.", "/member/memberList.wow", "목록으로");			
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
	}		
}









