package com.ottz.questions.vo;

import java.util.List;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Positive;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.ottz.attach.vo.AttachVO;
import com.ottz.common.valid.Modify;

public class QuestionsVO {	
	@Positive(message="글 번호는 필수입니다", groups= {Modify.class})
	private int qNo;
	@NotEmpty(message="글 제목은 필수입니다")
	private String qTitle;
	@NotEmpty(message="글 분류는 필수입니다")
	private String qCategory;
	private String qWriter;
	@Size(min = 1, message = "글 내용 필수")
	private String qContent;
	private int qHit;
	private String qRegDate;
	private String qCategoryNm;
	private List<AttachVO> attaches;
	private int[] delAtchNos;
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqCategory() {
		return qCategory;
	}

	public void setqCategory(String qCategory) {
		this.qCategory = qCategory;
	}

	public String getqWriter() {
		return qWriter;
	}

	public void setqWriter(String qWriter) {
		this.qWriter = qWriter;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public int getqHit() {
		return qHit;
	}

	public void setqHit(int qHit) {
		this.qHit = qHit;
	}

	public String getqRegDate() {
		return qRegDate;
	}

	public void setqRegDate(String qRegDate) {
		this.qRegDate = qRegDate;
	}

	public String getqCategoryNm() {
		return qCategoryNm;
	}

	public void setqCategoryNm(String qCategoryNm) {
		this.qCategoryNm = qCategoryNm;
	}

	public List<AttachVO> getAttaches() {
		return attaches;
	}

	public void setAttaches(List<AttachVO> attaches) {
		this.attaches = attaches;
	}

	public int[] getDelAtchNos() {
		return delAtchNos;
	}

	public void setDelAtchNos(int[] delAtchNos) {
		this.delAtchNos = delAtchNos;
	}
	

	
}
