package com.ottz.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.ottz.member.vo.MemberVO;

@Mapper
public interface ILoginDao {
	public int Login(MemberVO member);
}
