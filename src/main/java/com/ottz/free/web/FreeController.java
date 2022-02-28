package com.ottz.free.web;

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
import com.ottz.free.service.IFreeBoardService;
import com.ottz.free.vo.FreeBoardSearchVO;
import com.ottz.free.vo.FreeBoardVO;
import com.ottz.login.vo.UserVO;

@Controller
public class FreeController {
	
	private Logger logger = LoggerFactory.getLogger(FreeController.class);
	
	@Inject
	IFreeBoardService freeBoardService;
	
	@Inject
	ICommCodeService codeService;
	
	@Inject
	OttzAttachUtils ottzAttachUtils;
	
	@ModelAttribute("cateList")
	public List<CodeVO> cateList() {
		return codeService.getCodeListByParent("BC00");
	}
	
	@RequestMapping("freeList.wow")
	public String freeList(Model model, @ModelAttribute("searchVO") FreeBoardSearchVO searchVO){
		logger.debug("searchVO={}", searchVO);
		logger.info("searchVO={}", searchVO);
		List<FreeBoardVO> freeBoardList = freeBoardService.getBoardList(searchVO);
		model.addAttribute("freeBoardList", freeBoardList);
		return "free/freeList";
	}
	
	@RequestMapping("freeView.wow")
	public String freeView(Model model, @RequestParam(required = true)int boNo) {
		try {
			FreeBoardVO freeBoard = freeBoardService.getBoard(boNo);
			model.addAttribute("freeBoard", freeBoard);
			freeBoardService.increaseHit(boNo);
		} catch (BizNotFoundException enf) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글찾기실패", "글을 찾는데 실패함. 해당글이 없음", "freeList.wow", "목록으로");
			return "common/message";
		} catch (BizNotEffectedException ene) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "조회수 증가 실패", "조회수 증가 실패. 해당글이 없음", "freeList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
		return "free/freeView";
	}
	
	@RequestMapping(value = "freeEdit.wow", params = {"boNo"})
	public String freeEdit(Model model, int boNo) {
		try {
			FreeBoardVO freeBoard = freeBoardService.getBoard(boNo);
			model.addAttribute("freeBoard", freeBoard);
		} catch (BizNotFoundException enf) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 찾기 실패", "글을 찾는데 실패했습니다. 해당글이 없습니다.", "freeList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
		return "free/freeEdit";
	}
	
	@RequestMapping("freeModify.wow")
	public String freeModify(Model model, @ModelAttribute("freeBoard") 
			@Validated(value = {Modify.class, Default.class}) FreeBoardVO freeBoard, BindingResult error,
			@RequestParam(value = "boFiles", required = false) MultipartFile[] boFiles
			) throws IOException, com.ottz.exception.BizPasswordNotMatchedException {
		if(error.hasErrors()) {
			return "free/freeEdit";
		}
		try {
			if(boFiles != null) {
				List<AttachVO> attaches = ottzAttachUtils.getAttachListByMultiparts(boFiles, "FREE", "free");
				freeBoard.setAttaches(attaches);
			}
			freeBoardService.modifyBoard(freeBoard);
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "글 수정 성공", "글을 수정했습니다.", "freeList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message3";
	}catch (BizNotFoundException enf) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 찾기 실패", "글을 찾는데 실패했습니다. 해당 글이 없습니다.", "freeList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizNotEffectedException ene) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "조회수 증가 실패", "조회수 증가가 실패했습니다.", "freeList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
	}
	
	@RequestMapping (value = "freeDelete.wow", method = RequestMethod.POST)
	public String freeDelete(Model model, FreeBoardVO freeBoard) throws com.ottz.exception.BizPasswordNotMatchedException {
		try {
			freeBoardService.removeBoard(freeBoard);
			//message.jsp로 가도록
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "삭제 성공", "삭제가 성공했습니다", "freeList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message3";
		} catch (BizNotFoundException enf) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 찾기 실패", "글을 찾는데 실패했습니다. 해당 글이 없습니다.", "freeList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizNotEffectedException ene) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "조회수 증가 실패", "조회수 증가가 실패했습니다.", "freeList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
	}
	
	@RequestMapping("freeForm.wow") 
	public String freeForm (Model model, @ModelAttribute("freeBoard") FreeBoardVO freeBoard, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
	 freeBoard.setBoWriter(user.getUserNickName());
		model.addAttribute("freeBoard",freeBoard);
		return "free/freeForm";
	}
	
	@RequestMapping(value = "freeRegist.wow", method = RequestMethod.POST)
		public String freeRegist(Model model
		, @ModelAttribute("freeBoard") @Validated(value = {Default.class})
		FreeBoardVO freeBoard
		, BindingResult error
		, @RequestParam(value = "boFiles", required = false)MultipartFile[] boFiles) throws IOException {		
			logger.debug("freeBoard={}", freeBoard);
			if(error.hasErrors()) {
				return "free/freeForm";
			}
		try {
			if(boFiles != null) {
				List<AttachVO> attaches = ottzAttachUtils.getAttachListByMultiparts(boFiles, "FREE", "free");
				freeBoard.setAttaches(attaches);
			}
			freeBoardService.registBoard(freeBoard);
			System.out.println(freeBoard);
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(true, "글 등록 성공", "글 등록이 성공했습니다.", "freeList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message3";
		}catch(BizNotEffectedException ebe) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글 등록 실패", "글 등록에 실패했습니다.", "freeList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
	}
	
	
}
