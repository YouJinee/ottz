package com.ottz.member.service;

import java.util.List;

import com.ottz.exception.BizDuplicateKeyException;
import com.ottz.exception.BizNotEffectedException;
import com.ottz.exception.BizNotFoundException;
import com.ottz.member.vo.MemberVO;

public interface IMemberService {
	
	public List<MemberVO> getMemberList(MemberVO memberVO);
	
	public MemberVO getMember(String memId) throws BizNotFoundException ;
	
	public void modifyMember(MemberVO memberVO) throws BizNotEffectedException, BizNotFoundException ;
	
	public void removeMember(MemberVO memberVO) throws BizNotEffectedException, BizNotFoundException;
	
	public void registMember(MemberVO memberVO) throws BizDuplicateKeyException,BizNotEffectedException;
}
