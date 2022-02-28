package com.ottz.member.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.ottz.common.valid.Modify;
import com.ottz.common.valid.Step1;
import com.ottz.common.valid.Step2;
import com.ottz.common.valid.Step3;
import com.ottz.common.vo.PagingVO;
    
public class MemberVO extends PagingVO{
	
	@NotNull(groups = {Modify.class, Step2.class}, message = "id는 필수입니다.")
	private String memId;        /* 회원 아이디 */   
	
	@NotEmpty(groups = {Modify.class, Step2.class}, message = "비밀번호는 필수입니다.")
	private String memPass;      /* 회원 비밀번호 */
	
	@NotEmpty(groups = {Modify.class, Step2.class}, message = "이름을 입력해주세요.")
	private String memName;      /* 회원 이름 */
	
	@NotEmpty(groups = {Modify.class, Step2.class}, message = "별명을 정해주세요.")
	private String memNickName;  /* 회원 별명 */

	@NotEmpty(groups = {Modify.class, Step2.class}, message = "이메일을 입력해주세요.")
	private String memMail;      /* 회원 이메일 */
	
	@NotEmpty(groups = {Modify.class, Step2.class}, message = "주소를 입력해주세요.")
	private String memAddress;   /* 회원 주소 */
	
	@NotEmpty(groups = {Modify.class, Step2.class}, message = "연락처를 입력해주세요.")
	private String memHp;        /* 회원 휴대번호 */ 
	
	
	private String memDelYn;     /* 회원 삭제 여부 */
	
	@NotEmpty(groups = {Step1.class}, message = "이용약관 동의는 필수입니다.")
	private String agreeYn;
	@NotEmpty(groups = {Step1.class}, message = "개인정보 동의는 필수입니다.")
	private String privacyYn;
	
	private String eventYn; 
	
	public String getAgreeYn() {
		return agreeYn;
	}

	public void setAgreeYn(String agreeYn) {
		this.agreeYn = agreeYn;
	}

	public String getPrivacyYn() {
		return privacyYn;
	}

	public void setPrivacyYn(String privacyYn) {
		this.privacyYn = privacyYn;
	}

	public String getEventYn() {
		return eventYn;
	}

	public void setEventYn(String eventYn) {
		this.eventYn = eventYn;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPass() {
		return memPass;
	}

	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemNickName() {
		return memNickName;
	}

	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
	}

	public String getMemAddress() {
		return memAddress;
	}

	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}

	public String getMemHp() {
		return memHp;
	}

	public void setMemHp(String memHp) {
		this.memHp = memHp;
	}

	public String getMemMail() {
		return memMail;
	}

	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}

	public String getMemDelYn() {
		return memDelYn;
	}

	public void setMemDelYn(String memDelYn) {
		this.memDelYn = memDelYn;
	}
	
}