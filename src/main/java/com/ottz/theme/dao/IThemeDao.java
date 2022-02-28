package com.ottz.theme.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ottz.contents.vo.ContentsSearchVO;
import com.ottz.contents.vo.ContentsVO;

@Mapper
public interface IThemeDao {
	public List<ContentsVO> getTheme(ContentsSearchVO searchVO);
	public List<ContentsVO> getRandom(ContentsSearchVO searchVO);
	public String getGenre(ContentsSearchVO searchVO);
}
