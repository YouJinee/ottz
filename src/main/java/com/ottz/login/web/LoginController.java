package com.ottz.login.web;

import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.checkerframework.checker.units.qual.s;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ottz.common.util.CookieUtils;
import com.ottz.login.ILoginService;
import com.ottz.login.vo.UserVO;
import com.ottz.member.vo.MemberVO;

@Controller
public class LoginController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Inject
	ILoginService loginService;

	String prePage = "";

	@GetMapping("login.wow")
	public String LoginGet(HttpServletRequest req) {
		prePage = req.getHeader("referer");
		System.out.println("referer::" + req.getHeader("referer"));
		System.out.println("prePage::" + prePage);
		return "login/login";
	}

	@PostMapping("login.wow")
	public String Login(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String id = req.getParameter("userId");
		String pass = req.getParameter("userPass");
		String saveId = req.getParameter("remmeberMe");
		if (saveId == null) {
			CookieUtils cookieUtils = new CookieUtils(req);
			if (cookieUtils.exists("SAVE_ID")) {
				Cookie cookie = CookieUtils.createCookie("SAVE_ID", id, "/", 0);
				resp.addCookie(cookie);
			}
			saveId = "";
		}
		if ((id == null || id.isEmpty()) || (pass == null || pass.isEmpty())) {
			return "redirect:" + "login.wow?msg=" + URLEncoder.encode("입력해주세요", "utf-8");
		} else {
			UserVO user = loginService.getUser(id);
			if (user == null) {
				return "redirect:" + "login.wow?msg=" + URLEncoder.encode("아이디 또는 비번확인", "utf-8");
			} else { // id만 맞았을 때
				if (user.getUserPass().equals(pass)) { // 다 맞을 경우
					if (saveId.equals("Y")) {
						resp.addCookie(CookieUtils.createCookie("SAVE_ID", id, "/", 3600 * 24 * 7));
					}
					HttpSession session = req.getSession();
					session.setAttribute("USER_INFO", user);
					prePage = req.getHeader("referer");
					String sessionPage = (String) session.getAttribute("prePage");
					// 댓글을 쓰다 온 경우 로그인을 하고 나서 freeView로 가야합니다.
//					if(prePage.contains("freeView")) {
//						return "redirect:" + prePage;
//					}
					if (sessionPage == null) {
						return "redirect:" + "conPage.wow";
					}
					if (sessionPage.contains("ottzView")) {
						return "redirect:" + session.getAttribute("prePage");
					} else if (sessionPage.contains("memberList")) {
						return "redirect:" + session.getAttribute("prePage");
					} else if (sessionPage.contains("freeList")) {
						return "redirect:" + session.getAttribute("prePage");
					} else if (sessionPage.contains("questionsList")) {
						return "redirect:" + session.getAttribute("prePage");
					} else if (sessionPage.contains("conPage")) {
						return "redirect:" + session.getAttribute("prePage");
					} else if (sessionPage.contains("ottzPromotion")) {
						return "redirect:" + session.getAttribute("prePage");
					}
					return "redirect:" + "conPage.wow";
				} else { // 비밀번호 틀림
					return "redirect:" + "login.wow?msg=" + URLEncoder.encode("아이디 또는 비번확인", "utf-8");
				}
			}
		}
	}

	@RequestMapping("logout.wow")
	public String Logout(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		session.removeAttribute("USER_INFO");
		prePage = req.getHeader("referer");
		session.setAttribute("prePage", prePage);
		String sessionPage = (String) session.getAttribute("prePage");
		if (sessionPage == "" || sessionPage == null) {
			return "redirect:" + "login.wow";
		}
		if (sessionPage.contains("memberList")) {
			return "redirect:" + sessionPage;
		} else if (sessionPage.contains("freeList")) {
			return "redirect:" + sessionPage;
		} else if (sessionPage.contains("ottzView")) {
			return "redirect:" + sessionPage;
		} else if (sessionPage.contains("questionsList")) {
			return "redirect:" + sessionPage;
		} else if (sessionPage.contains("conPage")) {
			return "redirect:" + sessionPage;
		} else if (sessionPage.contains("ottzPromotion")) {
			return "redirect:" + sessionPage;
		} else if (sessionPage.contains("login")) {
			return "redirect:" + sessionPage;
		}
		return "redirect:" + "login.wow";
	}

	@RequestMapping(value = "/login/Login")
	@ResponseBody
	public String Login(HttpServletRequest req, HttpServletResponse resp, String id, String email, String nickname) {
		logger.debug("id=" + id + ", email=" + email + ", nickname=" + nickname);
		HttpSession session = req.getSession();
		if (loginService.getUser(id) != null) {
			UserVO user = loginService.getUser(id);
			session.setAttribute("USER_INFO", user);
		} else {
			MemberVO member = new MemberVO();
			member.setMemId(id);
			member.setMemMail(email);
			member.setMemName(nickname);
			loginService.Login(member);
			UserVO user = loginService.getUser(id);
			session.setAttribute("USER_INFO", user);
		}
		return "redirect:" + "conPage.wow";
	}

	@RequestMapping("login2.wow")
	public String Login2() {
		return "login/login2";
	}

}
