package com.ottz.member.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.ottz.exception.BizDuplicateKeyException;
import com.ottz.exception.BizNotEffectedException;
import com.ottz.exception.BizNotFoundException;
import com.ottz.member.dao.IMemberDao;
import com.ottz.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements IMemberService {
	
	@Inject
   IMemberDao memberDao;

	@Override
	public List<MemberVO> getMemberList(MemberVO memberVO) {
		int totalRowCount = memberDao.getTotalRowCount(memberVO);
		memberVO.setTotalRowCount(totalRowCount);
		memberVO.pageSetting();
		return memberDao.getMemberList(memberVO);
	}
	
	@Override
	public MemberVO getMember(String memId) throws BizNotFoundException {
		MemberVO member = memberDao.getMember(memId);
		System.out.println(member);
		if (member == null) throw new BizNotFoundException();
		return member;
	}

	@Override
	public void modifyMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
		MemberVO vo = memberDao.getMember(member.getMemId());
		if (vo == null) throw new BizNotFoundException();
		int cnt = memberDao.updateMember(member);
		if(cnt == 0) throw new BizNotEffectedException();
	}

	@Override
	public void removeMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
		MemberVO vo = memberDao.getMember(member.getMemId());
		if (vo == null) throw new BizNotFoundException();
		int cnt = memberDao.deleteMember(member);
		if(cnt == 0) throw new BizNotEffectedException();
	}

	@Override
	public void registMember(MemberVO member) throws BizDuplicateKeyException, BizNotEffectedException {
		MemberVO vo = memberDao.getMember(member.getMemId());
		if (vo != null) throw new BizDuplicateKeyException();
		int cnt = memberDao.insertMember(member);
		if(cnt == 0) throw new BizNotEffectedException();
	}
	
}
