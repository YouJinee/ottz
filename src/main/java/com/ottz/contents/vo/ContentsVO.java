package com.ottz.contents.vo;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ContentsVO {
	private String conNo;                   
	private String conTitle;                
	private String conOrgTitle;             
	private String conImg;                  
	private String conDirector;             
	private String conScore;                
	private String conTime;                 
	private String conAge;                  
	private String conStory;                
	private String conClip;                 
	private String conType;
	private String conGenre;
	private String conOtt;
	
	
	public String getConOtt() {
		return conOtt;
	}
	public void setConOtt(String conOtt) {
		this.conOtt = conOtt;
	}
	public String getConGenre() {
		return conGenre;
	}
	public void setConGenre(String conGenre) {
		this.conGenre = conGenre;
	}
	public String getConNo() {
		return conNo;
	}
	public void setConNo(String conNo) {
		this.conNo = conNo;
	}
	public String getConTitle() {
		return conTitle;
	}
	public void setConTitle(String conTitle) {
		this.conTitle = conTitle;
	}
	public String getConOrgTitle() {
		return conOrgTitle;
	}
	public void setConOrgTitle(String conOrgTitle) {
		this.conOrgTitle = conOrgTitle;
	}
	public String getConImg() {
		return conImg;
	}
	public void setConImg(String conImg) {
		this.conImg = conImg;
	}
	public String getConDirector() {
		return conDirector;
	}
	public void setConDirector(String conDirector) {
		this.conDirector = conDirector;
	}
	public String getConScore() {
		return conScore;
	}
	public void setConScore(String conScore) {
		this.conScore = conScore;
	}
	public String getConTime() {
		return conTime;
	}
	public void setConTime(String conTime) {
		this.conTime = conTime;
	}
	public String getConAge() {
		return conAge;
	}
	public void setConAge(String conAge) {
		this.conAge = conAge;
	}
	public String getConStory() {
		return conStory;
	}
	public void setConStory(String conStory) {
		this.conStory = conStory;
	}
	public String getConClip() {
		return conClip;
	}
	public void setConClip(String conClip) {
		this.conClip = conClip;
	}
	public String getConType() {
		return conType;
	}
	public void setConType(String conType) {
		this.conType = conType;
	}                 
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
