package com.ottz.review.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.ottz.common.vo.PagingVO;

@SuppressWarnings("serial")
public class ReviewVO extends PagingVO implements Serializable{
	private int rvNo;                    
	private String rvParentNo;              
	private String rvMemId;                 
	private String rvContent;               
	private String rvRegDate;
	private String rvMemName;
	public String getRvMemName() {
		return rvMemName;
	}
	public void setRvMemName(String rvMemName) {
		this.rvMemName = rvMemName;
	}
	public int getRvNo() {
		return rvNo;
	}
	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}
	public String getRvParentNo() {
		return rvParentNo;
	}
	public void setRvParentNo(String rvParentNo) {
		this.rvParentNo = rvParentNo;
	}
	public String getRvMemId() {
		return rvMemId;
	}
	public void setRvMemId(String rvMemId) {
		this.rvMemId = rvMemId;
	}
	public String getRvContent() {
		return rvContent;
	}
	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}
	public String getRvRegDate() {
		return rvRegDate;
	}
	public void setRvRegDate(String reRegDate) {
		this.rvRegDate = reRegDate;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
