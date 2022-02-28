package  com.ottz.login;

import com.ottz.login.vo.UserVO;
import com.ottz.member.vo.MemberVO;

public interface ILoginService {
	
	public UserVO getUser(String id);
	
	public void Login(MemberVO member);
	
}
