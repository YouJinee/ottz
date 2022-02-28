package com.ottz.save.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ottz.login.vo.UserVO;
import com.ottz.save.dao.ISaveDao;
import com.ottz.save.vo.SaveVO;

@Service
public class SaveServiceImpl implements ISaveService {

	@Inject
	ISaveDao saveDao;

	@Override
	public void saveContents(SaveVO save) {
		if (saveDao.getSave(save) == null) {
			saveDao.saveContents(save);
		}else {
			System.out.println("이미 리스트에 있습니당!!!!!!");
		}
	}

	@Override
	public SaveVO getSaveContents(SaveVO save) {
		return saveDao.getSave(save);
		
	}

	@Override
	public void deleteSaveContents(SaveVO save) {
		saveDao.deleteSaveContents(save);
	}

	@Override
	public List<SaveVO> getSaveBoxContents(UserVO user) {
		return saveDao.getSaveBox(user);
		
	}
	
	
	
}
