package com.ottz.save.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ottz.login.vo.UserVO;
import com.ottz.save.vo.SaveVO;

@Mapper
public interface ISaveDao {
	public int saveContents (SaveVO save);
	public SaveVO getSave(SaveVO save);
	public int deleteSaveContents(SaveVO save);
	public List<SaveVO> getSaveBox(UserVO user);
}
