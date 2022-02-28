package com.ottz.save.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ottz.save.service.ISaveService;
import com.ottz.save.vo.SaveVO;

@Controller
public class SaveController {
	@Inject
	ISaveService saveService;

	@RequestMapping(value = "/save/contentsSave", produces = "application/json; charset = utf-8")
	@ResponseBody
	public String contentsSave(SaveVO save) {
		saveService.saveContents(save);
		return "";
	}
	@RequestMapping(value = "/save/contentsUnsave", produces = "application/json; charset = utf-8")
	@ResponseBody
	public String contentsUnsave(SaveVO save) {
		saveService.deleteSaveContents(save);
		return "";
	}
	
	
}
