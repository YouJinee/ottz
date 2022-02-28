package com.ottz.questions.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.groups.Default;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ottz.attach.vo.AttachVO;
import com.ottz.code.service.ICommCodeService;
import com.ottz.code.vo.CodeVO;
import com.ottz.common.util.OttzAttachUtils;
import com.ottz.common.valid.Modify;
import com.ottz.common.vo.ResultMessageVO;
import com.ottz.exception.BizNotEffectedException;
import com.ottz.exception.BizNotFoundException;
import com.ottz.login.vo.UserVO;
import com.ottz.questions.service.IQuestionsService;
import com.ottz.questions.vo.QuestionsSearchVO;
import com.ottz.questions.vo.QuestionsVO;

@Controller
public class questionsController { //서비스동작상태, 에러파악&알림
	private Logger logger = LoggerFactory.getLogger(questionsController.class);
	
	@Inject
	IQuestionsService questionsService;
	
	@Inject
	ICommCodeService codeService;

	@Inject
	OttzAttachUtils ottzAttachUtils;
	
	@ModelAttribute("codeList")
	public List<CodeVO> codeList(){
		return codeService.getCodeListByParent("QA00");
	}
	
	
//	글쓰기 목록
	@RequestMapping("questionsList.wow")
	public String questList(Model model, @ModelAttribute("searchVO") QuestionsSearchVO searchVO) {
		List<QuestionsVO> questionsList = questionsService.getQuestList(searchVO);
		model.addAttribute("questionsList",questionsList);
		return "questions/questionsList";
	}
	
	
	
	
	
	
//글 읽기
	@RequestMapping("questionsView.wow")
	public String questionsView(Model model, @RequestParam(required = true)int qNo) {
		try {
			QuestionsVO questions = questionsService.getQuestions(qNo);
			model.addAttribute("questions", questions);
			questionsService.increaseHit(qNo);
		}catch(BizNotFoundException enf){
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글찾기실패", "글을 찾는데 실패함. 해당글이 없음", "questionsList.wow", "목록으로");
			return "common/messages";
		}catch(BizNotEffectedException ene) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "조회수 증가 실패", "조회수 증가 실패. 해당글이 없음", "questionsList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/messages";
		}
		return "questions/questionsView";
	}

	

//글 수정중
	@RequestMapping(value = "questionsEdit.wow", params = {"qNo"})
	public String questionsEdit(Model model, int qNo) {
		try {
			QuestionsVO questions = questionsService.getQuestions(qNo);
			model.addAttribute("questions",questions);
		}catch(BizNotFoundException enf) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 찾기 실패", "글을 찾는데 실패했습니다. 해당글이 없습니다.", "questionsList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/messages";
		}
		return "questions/questionsEdit";
	}

	
//글 작성	
	@RequestMapping("questionsForm.wow") 
	public String questionsForm (Model model, @ModelAttribute("questions") QuestionsVO questions, HttpSession session) {
		UserVO user =(UserVO) session.getAttribute("USER_INFO");
		questions.setqWriter(user.getUserNickName());
		model.addAttribute("questions",questions);
		return "questions/questionsForm";
	}
	

//글수정	완료
	@RequestMapping("questionsModify.wow")
	public String freeModify(Model model, @ModelAttribute("questions") 
			@Validated(value = {Modify.class, Default.class}) QuestionsVO questions, BindingResult error,
			@RequestParam(value = "qFiles", required = false) MultipartFile[] qFiles
			) throws IOException, com.ottz.exception.BizPasswordNotMatchedException {
		System.out.println(questions);
		if(error.hasErrors()) {
			return "questions/questionsEdit";
		}
		try {
			if(qFiles != null) {
				List<AttachVO> attaches = ottzAttachUtils.getAttachListByMultiparts(qFiles, "QUESTIONS", "questions");
				questions.setAttaches(attaches);
			}
			questionsService.modifyBoard(questions);
			ResultMessageVO resultMessageVO =new ResultMessageVO();
			resultMessageVO.messageSetting(true, "글 수정 성공", "글을 수정했습니다.", "questionsList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message4";
	}catch (BizNotFoundException enf) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 찾기 실패", "글을 찾는데 실패했습니다. 해당 글이 없습니다.", "questionsList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/messages";
		} catch (BizNotEffectedException ene) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
		resultMessageVO.messageSetting(false, "조회수 증가 실패", "조회수 증가가 실패했습니다.", "questionsList.wow", "목록으로");
		model.addAttribute("resultMessageVO", resultMessageVO);
		return "common/messages";
	}
}
		
	
// 글 삭제
	@RequestMapping(value = "questionsDelete.wow", method = RequestMethod.POST)
	public String questionsDelete(Model model, QuestionsVO questions) throws com.ottz.exception.BizPasswordNotMatchedException {
	try {
		questionsService.removeQuestions(questions);
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		resultMessageVO.messageSetting(true, "삭제 성공", "삭제가 성공했습니다.", "questionsList.wow", "목록으로");
		model.addAttribute("resultMessageVO", resultMessageVO);
		return "common/message4";
	} catch (BizNotFoundException enf) {
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		resultMessageVO.messageSetting(false, "글 찾기 실패", "글을 찾는데 실패했습니다. 해당 글이 없습니다.", "questionsList.wow", "목록으로");
		model.addAttribute("resultMessageVO", resultMessageVO);
		return "common/messages";
	} catch (BizNotEffectedException ene) {
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		resultMessageVO.messageSetting(false, "조회수 증가 실패", "조회수 증가가 실패했습니다.", "questionsList.wow", "목록으로");
		model.addAttribute("resultMessageVO", resultMessageVO);
		return "common/messages";
	}
}
	
	
//글 작성
	@RequestMapping(value = "questionsRegist.wow", method = RequestMethod.POST)
	public String questionsRegist(Model model
	,@ModelAttribute("questions") @Validated(value = {Default.class})
	QuestionsVO questions
	,BindingResult error
	,@RequestParam(value = "qFiles", required = false)MultipartFile[] qFiles) throws IOException {	
		logger.debug("questions={}", questions);
		if(error.hasErrors()) {
			return "questions/questionsForm";
		}
	try {
		if(qFiles != null) {
			List<AttachVO> attaches = ottzAttachUtils.getAttachListByMultiparts(qFiles, "QUESTIONS", "questions");
			questions.setAttaches(attaches);
		}
		questionsService.registQuestions(questions);
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		resultMessageVO.messageSetting(true, "글 등록 성공", "글 등록이 성공했습니다", "questionsList.wow", "목록으로");
		model.addAttribute("resultMessageVO", resultMessageVO);
		return "common/message4";
		}catch(BizNotEffectedException ebe) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 등록 실패", "글 등록에 실패했습니다.", "questionsList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/messages";
		}
	}

}
	
