package com.ottz.login;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ottz.exception.BizNotFoundException;
import com.ottz.login.dao.ILoginDao;
import com.ottz.login.vo.UserVO;
import com.ottz.member.dao.IMemberDao;
import com.ottz.member.vo.MemberVO;

@Service
public class LoginServiceImpl implements ILoginService{

	@Inject
	IMemberDao memberDao;
	
	@Inject
	ILoginDao loginDao;
	
	@Override
	public UserVO getUser(String id) {
		MemberVO member = memberDao.getMember(id);
		System.out.println(member);
		if (member == null) {
			
			return null;			
		} else {
			UserVO user = new UserVO();
			user.setUserId(member.getMemId());
			user.setUserName(member.getMemName());
			user.setUserPass(member.getMemPass());
			user.setUserNickName(member.getMemNickName());
			if (member.getMemId().equals("ottz1998")) {
				user.setUserRole("MANAGER");
			} else {
				user.setUserRole("MEMBER");
			}
			return user;
		}
		
	}
	@Override
	public void Login(MemberVO member){
		String match = "[\"]";
		member.setMemName(member.getMemName().replaceAll(match, ""));
		member.setMemMail(member.getMemMail().replaceAll(match, ""));
		
		MemberVO vo = memberDao.getMember(member.getMemId());
		if (vo == null) {			
			loginDao.Login(member);
		}
	}
}
