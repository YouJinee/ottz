<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html class="h-100">
<head>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
<!--
.footer-demo.section-dark { 
	position: fixed; 
	bottom: 0; 
	width: 100%;
}
-->
</style>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>

<div class="container">
<h3>회원가입</h3>
	<form:form action="memberRegist.wow" method="post" modelAttribute="memberVO">
	<table class="table table-striped table-bordered">
		<tbody>
			<tr>
				<th>아이디</th>
				<td>
				<input type="text" name="memId" class="form-control input-sm" 
						required="required" pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력" >
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="memPass" class="form-control input-sm"
						   required="required" pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력" ></td>
			</tr>
			<tr>
				<th>회원명</th>
				<td><input type="text" name="memName" class="form-control input-sm"
						   required="required" pattern="[가-힣]{2,}" title="한글로 2글자 이상 입력" ></td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td><input type="text" name="memHp" class="form-control input-sm" ></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="memMail" class="form-control input-sm" ></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="memAddress" class="form-control input-sm" ></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="memNickName" class="form-control input-sm" ></td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="memberList.wow" class="btn btn-info btn-sm">
					목록으로
					</a>
					<button type="submit" class="btn btn-info btn-sm">
					회원가입
					</button>							
				</td>
			</tr>
		</tbody>
	</table>
	</form:form>
</div>
<%@ include file="/WEB-INF/inc/bottom.jsp"%>
</body>
<%@ include file="/WEB-INF/inc/bootjs.jsp"%>
</html>