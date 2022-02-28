package com.ottz.reply.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
//replyVO는 json으로 변환됩니다. 변환되려면 Serializable 해야한다.
//직렬화 -> JSON으로 만들 때 이진데이터로 변경될 수 있도록

@SuppressWarnings("serial")
public class ReplyVO implements Serializable{
	private int reNo;
	private String reCategory;
	private int reParentNo;
	private String reMemId;
	private String reContent;
	private String reRegDate;
	
	private String reNickName;
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	public int getReNo() {
		return reNo;
	}

	public void setReNo(int reNo) {
		this.reNo = reNo;
	}

	public String getReCategory() {
		return reCategory;
	}

	public void setReCategory(String reCategory) {
		this.reCategory = reCategory;
	}

	public int getReParentNo() {
		return reParentNo;
	}

	public void setReParentNo(int reParentNo) {
		this.reParentNo = reParentNo;
	}

	public String getReMemId() {
		return reMemId;
	}

	public void setReMemId(String reMemId) {
		this.reMemId = reMemId;
	}
	
	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	public String getReRegDate() {
		return reRegDate;
	}

	public void setReRegDate(String reRegDate) {
		this.reRegDate = reRegDate;
	}

	public String getReNickName() {
		return reNickName;
	}

	public void setReNickName(String reNickName) {
		this.reNickName = reNickName;
	}
	
	
	
}
