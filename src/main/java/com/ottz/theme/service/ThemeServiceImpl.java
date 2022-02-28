package com.ottz.theme.service ;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ottz.contents.vo.ContentsSearchVO;
import com.ottz.contents.vo.ContentsVO;
import com.ottz.theme.dao.IThemeDao;

@Service
public class ThemeServiceImpl implements IThemeService {

	@Inject	
	IThemeDao theme;


	@Override
	public List<ContentsVO> getTheme(ContentsSearchVO searchVO) {
		List<ContentsVO> themeList = theme.getTheme(searchVO);
		return themeList;
	}
	
	public List<ContentsVO> getRandom(ContentsSearchVO searchVO) {
		List<ContentsVO> randomList = theme.getRandom(searchVO);
		return randomList;
	}
	
	public String getGenre(ContentsSearchVO searchVO) {
		String genreNm = theme.getGenre(searchVO);
		System.out.println(genreNm);
		return genreNm;
	}

	
}
