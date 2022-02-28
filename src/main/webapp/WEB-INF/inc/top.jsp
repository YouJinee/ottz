<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-ct-transparent" role="navigation-demo" id="demo-navbar">
	<div class="container">
      <a class="logo-container" href="http://localhost:8080/ottz/conPage.wow">
      	 <img class="logo" src="resources/images/11.png" alt="Creative Tim Logo"
      	 style="width: 60px;">
      </a>   
      <button onclick="location.href='conPage.wow'" class="btn btn-simple">HOME</button>
      <button onclick="location.href='ottzPromotion.wow'" class="btn btn-simple">INFORMATION</button>
      <button onclick="location.href='ottzSearch.wow'" class="btn btn-simple">CONTENTS</button>
      <button onclick="location.href='freeList.wow'" class="btn btn-simple">COMMUNITY</button>
      <button onclick="location.href='questionsList.wow'" class="btn btn-simple">Q & A</button>    
      
	      <ul class="nav navbar-nav navbar-right">
	          <c:if test="${USER_INFO == null }">
	          <li>
	            <a href="step1.wow" class="btn btn-simple">회원가입</a>
	          </li>	          
                 <button class="btn btn-neutral" data-toggle="modal" data-target="#myModal">로그인</button>
	           </c:if>
	           
	          <c:if test="${USER_INFO != null && USER_INFO.userRole ne 'MANAGER'}">
	          <li>
               <a href="info.wow" class="btn btn-simple" style="margin: 15px 3px; padding: 0px 10px; top: -2px">
	          	 	<img alt="이미지 없음" src="<%=request.getContextPath()%>/resources/images/user.png" 
	          	 	style="position: relative; width: 40px; right: 10px">${USER_INFO.userNickName }님
	          	 </a>
	          </li>
	          
			   <li >
                <button class="dropdown-toggle btn btn" data-toggle="dropdown">MyPage <b class="caret"></b></button>
                <ul class="dropdown-menu dropdown-info dropdown-menu-right">
                  <li class="dropdown-header">${USER_INFO.userNickName }님</li>
                  <li><a href="info.wow">내 정보</a></li>
                  <li><a href="edit.wow">정보 수정</a></li>
                  <!-- <li><a href="zzim.wow">찜 목록</a></li> -->
                  <li onclick="naverLogout(); return false;"><a href="#">로그아웃</a></li>
                </ul>        
             </li>
             </c:if>
             
             <c:if test="${USER_INFO.userRole eq 'MANAGER'}">
	          <li>
               <a href="info.wow" class="btn btn-simple" style="margin: 15px 3px; padding: 0px 10px; top: -2px">
	          	 	<img alt="이미지 없음" src="<%=request.getContextPath()%>/resources/images/user.png" 
	          	 	style="position: relative; width: 40px; right: 10px">${USER_INFO.userNickName }님
	          	 </a>
	          </li>
	          
			   <li >
                <button class="dropdown-toggle btn btn" data-toggle="dropdown">MyPage <b class="caret"></b></button>
                <ul class="dropdown-menu dropdown-info dropdown-menu-right">
                  <li class="dropdown-header">${USER_INFO.userNickName }님</li>
                  <li><a href="info.wow">내 정보</a></li>
                  <li><a href="edit.wow">정보 수정</a></li>
                  <!-- <li><a href="zzim.wow">찜 목록</a></li> -->
                  <li><a href="memberList.wow">회원 목록</a></li>
                  <li onclick="naverLogout(); return false;"><a href="#">로그아웃</a></li>
                </ul>        
             </li>
             </c:if>
	      </ul>
	           
  </div><!-- /.container-->
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
		<div class="modal-dialog">
			<div class="modal-content" style="background-color: #efefef; width: 500px">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" style="	font-size: 50px; margin-top: -15px;">&times;</button>
					<h4 class="modal-title" id="myModalLabel" 
					style="font-family: 'Bungee Shade', cursive; font-size: 60px">OTTZ</h4>
				</div>				
				
				<div class="modal-body" style="height: 600px;">
				<%@ include file="/WEB-INF/views/login/modalLogin.jsp"%>
				</div>
				
			</div>
		</div>
	</div>


</nav>


