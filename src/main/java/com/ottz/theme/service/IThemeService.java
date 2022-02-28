package com.ottz.theme.service;

import java.util.List;

import com.ottz.contents.vo.ContentsSearchVO;
import com.ottz.contents.vo.ContentsVO;

public interface IThemeService {
	public List<ContentsVO> getTheme(ContentsSearchVO searchVO);
	public List<ContentsVO> getRandom(ContentsSearchVO searchVO);
	public String getGenre(ContentsSearchVO searchVO);
}
