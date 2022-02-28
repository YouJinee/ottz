package com.ottz.save.service;

import java.util.List;

import com.ottz.login.vo.UserVO;
import com.ottz.save.vo.SaveVO;

public interface ISaveService {
	//찜하기 
	public void saveContents(SaveVO save);
	public SaveVO getSaveContents(SaveVO save);
	public void deleteSaveContents(SaveVO save);
	public List<SaveVO> getSaveBoxContents(UserVO user);
}
