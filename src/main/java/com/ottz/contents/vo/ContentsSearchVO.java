package com.ottz.contents.vo;

import java.io.Serializable;
import java.util.List;

import com.ottz.common.vo.PagingVO;

/**
 * @author pc34
 *
 */
@SuppressWarnings("serial")
public class ContentsSearchVO extends PagingVO implements Serializable{
	private List<String> searchGenre;
	private List<String> searchOtt;
	private String searchWord;
	private String theme;
	
	
	
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public List<String> getSearchGenre() {
		return searchGenre;
	}
	public void setSearchGenre(List<String> searchGenre) {
		this.searchGenre = searchGenre;
	}
	public List<String> getSearchOtt() {
		return searchOtt;
	}
	public void setSearchOtt(List<String> searchOtt) {
		this.searchOtt = searchOtt;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	
	
	
	

}
