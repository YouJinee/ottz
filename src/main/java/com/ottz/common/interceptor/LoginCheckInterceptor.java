package com.ottz.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.ottz.login.vo.UserVO;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler)
			throws Exception {
		
		String ajax = req.getHeader("X-requested-with"); // 요청이 ajax인지아닌지
				
		// mypage, 일반 로그인 체크
		HttpSession session =req.getSession(false);			
		if (session == null) {
			// 맨 처음 요청
			if (ajax != null) { //ajax 요청일 경우
				resp.sendError(401, "로그인 안했어요");
				return false;
			}
			
			resp.sendRedirect(req.getContextPath() + "/login.wow");
			return false;
		}
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		if(user == null) {
			if (ajax != null) { //ajax 요청일 경우
				//  글 쓰던 내용 유지도 되게하고 싶고요, 바로 freeView로 가고 싶어요
				resp.sendError(401, "로그인 안했어요");
				return false;
			}
			
			resp.sendRedirect(req.getContextPath() + "/login.wow");
			return false;
		}
		return true;
		
	}
}
 