package com.ottz.member.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.ottz.member.vo.MemberVO;
@Mapper
public interface IMemberDao {

	public int getTotalRowCount(MemberVO memberVO);
	public List<MemberVO> getMemberList(MemberVO memberVO);
	public MemberVO getMember(String memId);
	public int updateMember(MemberVO member);
	public int deleteMember(MemberVO member);
	public int insertMember(MemberVO member);
	
}
