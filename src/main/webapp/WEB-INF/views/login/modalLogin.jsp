<%@page import="com.ottz.login.vo.UserVO"%>
<%@page import="com.ottz.common.util.CookieUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 네이버 스크립트 start -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8">
</script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js">
</script>
<!-- 네이버 스크립트 end -->	

<!-- 카카오 스크립트 start-->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 카카오 스크립트 end -->

<!-- 구글 start-->
<meta name ="google-signin-client_id" content="489139840278-5a70gbojfltaqpsjp9554dkr7og6np5v.apps.googleusercontent.com" charset="UTF-8">
<!-- 구글 end -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<%@ include file="/WEB-INF/inc/header.jsp"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bungee+Shade&display=swap" rel="stylesheet">

</head>
<body>

	<%
	String msg = request.getParameter("msg");
	String id = "";
	String checked = "";

	if (msg != null) {
		out.print(msg);
	}
	CookieUtils cookieUtils = new CookieUtils(request);

	if (cookieUtils.exists("SAVE_ID")) {
		id = cookieUtils.getValue("SAVE_ID");
		checked = "checked='checked'";
	}
	
	UserVO user=(UserVO)session.getAttribute("USER_INFO");
	%>	
	
	<c:if test="<%=user!=null %>">
	로그인 중
		<ul>
			<li onclick="naverLogout(); return false;">
		      <a href="#">
		          <span>로그아웃</span>
		      </a>
			</li>
		</ul>				
	</c:if>
	
	<c:if test="<%=user==null %>">	
	<div class="container-contact100">
		<div class="wrap-contact100">
			<form action="login.wow" class="contact100-form validate-form" method="post">
				
				<div class="contact100-form-title">
					<div class="wrap-input100 validate-input" data-validate="Name is required" style="font-size: 17px; ">
						<p><span class="label-input100" style="margin-right: 88%;">아이디</span></p>
						<p><input class="input100" type="text" name="userId" value="" placeholder="ID"
						required="required" pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력" 
						style="border:none; width: 100%; height: 50px; font-size: 18px;"></p>
					</div>
					<hr style="border-color: gray; margin-top: 0;">
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz" style="font-size: 17px;">
						<p><span class="label-input100"class="label-input100" style="margin-right: 85%;">비밀번호</span></p>
						<p><input class="input100" type="password" name="userPass" placeholder="PASSWORD"
						required="required" pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력"
						style="border:none; margin-right: 14px; width: 100%; height: 50px; font-size: 18px;"></p>
					</div>
					<hr style="border-color: gray; margin-top: 0;">
				</div>
				
				<div>
					<label><input type="checkbox" name="rememberMe" value="Y" >ID 기억하기</label>
				</div>
				
				<div class="wrap-input100 input100-select">
				
				<div class="container-contact100-form-btn">
					<div class="wrap-contact100-form-btn"
					style="padding: 13px; background-color: #13334e;
					border-radius: 30px 30px; margin: 10px 10px 10px 10px;">
						<div class="contact100-form-bgbtn"></div>
						<button class="contact100-form-btn" type="submit">
							<span style="color: white;">
								로그인
								<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
							</span>
						</button>
					</div>
				</div>
				<div class="container-contact100-form-btn">
					<div class="wrap-contact100-form-btn" 
					style="padding: 13px; background-color: #13334e;
					border-radius: 30px 30px; margin: 10px 10px 10px 10px;">
						<div class="contact100-form-bgbtn"></div>
						<button class="button" onclick="location.href='step1.wow'">
							<span style="color: white;">
								회원가입
								<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
							</span>
						</button>
					</div>
				</div>
				
			<div>
			 <!-- 카카오 로그인 -->		
				<div class="container-contact100-form-btn" >
					<button>
					<img src="/ottz/resources/loginBootstrap/images/icons/kakao.png"
					id="kakao-login-btn" onclick="javascript:kakaoLogin()">
					</button>			
				</div>
			
			 <!-- 네이버 로그인 -->
				<div class="container-contact100-form-btn" style="with">
					<button>
					<img src="/ottz/resources/loginBootstrap/images/icons/naver.png"
					id="naverIdLogin_loginButton" onclick="javascript:void(0)">
					</button>
					</div> 	
		
		 	 <!-- 구글 로그인 -->		
				<div class="container-contact100-form-btn" style="with">
					<button>
					<img src="/ottz/resources/loginBootstrap/images/icons/google.png"
					id="GgCustomLogin" onclick="javascript:void(0)">
					</button>
				</div>
			</div>
			</div>	
			</form>
		</div>
	</div>
	</c:if>	
	
</body>

<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>

	var id="";
	var email="";
	var nickname="";
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "pZ4LvHgsnFtxZU4nnNQy", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
				callbackUrl: "http://localhost:8080/ottz/conPage.wow", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
				isPopup: false,
				callbackHandle: true
			}
		);	
	
	naverLogin.init();
	
	$("#naverIdLogin_loginButton").click(function () {
		$.ajax({
			type : 'post',
			url : '<c:url value = '/login/Login'/>',
			data : {
				'id' : id,
				'email' : email,
				'nickname' : name
			},
			success : function(result) {
				console.log('성공 발생')
			},
			error : function(result) {
				console.log('오류 발생')
			}
		}); //ajax
	});
	
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {			
				var age = naverLogin.user.getAge();
				var birthday = naverLogin.user.getBirthday();
				var mobile = naverLogin.user.getMobile();
				var nickName = naverLogin.user.getNickName();
				id = naverLogin.user.getId();
				name = naverLogin.user.getName();
				email = naverLogin.user.getEmail();
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
	
	var testPopUp;
	function openPopUp() {
	    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	}
	function closePopUp(){
	    testPopUp.close();
	}
	function naverLogout() {
		openPopUp();
		setTimeout(function() {
			closePopUp();
			location.href="logout.wow";
			}, 1000);		
	}
	</script>
	<!-- 네이버 로그인 스크립트 end-->
	
	<!-- 카카오 로그인 스크립트 start-->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
	Kakao.init('24ec39241160efbefe137a31bb7eb6c2'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	 console.log(response);
	        	 console.log(JSON.stringify(response));
	        	 console.log(response.conntext_at);
				//location.href
					$.ajax({
						url:"<c:url value = '/login/Login'/>"
						,type : 'post'
						,data : {"id":response.id,  "email":JSON.stringify(response.kakao_account.email)
							,"nickname" : JSON.stringify(response.properties.nickname)
						}
						,success: function (data) {
							location.href = data;
							location.reload();
						}
						,error: function(req,st,err){
							alert("aabb");
						}
					})	          
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  
	</script>
	<!-- 카카오 로그인 스크립트 end-->
	
	<!-- 구글 로그인 스크립트 start-->
	<script>
	
	//처음 실행하는 함수
	function init() {
		gapi.load('auth2', function() {
			gapi.auth2.init();
			options = new gapi.auth2.SigninOptionsBuilder();
			options.setPrompt('select_account');
	        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
			options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
	        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
	        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
			gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
		})
	}
	function onSignIn(googleUser) {
		var access_token = googleUser.getAuthResponse().access_token
		$.ajax({
	    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
			url: 'https://people.googleapis.com/v1/people/me'
	        // key에 자신의 API 키를 넣습니다.
			, data: {personFields:'birthdays', key:'AIzaSyBmEoXPzjTXlW3vDoEI010X1HgqMdpSxhw', 'access_token': access_token}
			, method:'GET'
		})
		.done(function(e){
	        //프로필을 가져온다.
			var profile = googleUser.getBasicProfile();
	        console.log(profile);
			$.ajax({
				url:"<c:url value = '/login/Login'/>"
				,type : 'post'
				,data : { "id":profile.SW, "email":profile.zv, "nickname":profile.sf}
				,success: function (data) {
					location.href = data;
				}
				,error: function(req,st,err){
					alert("aabb");
				}
			})	
		})
		.fail(function(e){
			console.log(e);
		})
	}
	function onSignInFailure(t){		
		console.log(t);
	}
	</script>
	<!-- 구글 로그인 스크립트 start-->
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
	<!-- 구글 로그인 스크립트 end-->

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'UA-23581568-13');
	</script>

</html>