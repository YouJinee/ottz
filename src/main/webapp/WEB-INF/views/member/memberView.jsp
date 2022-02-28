<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="h-100">
<head>
<%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<style>
<!--
.footer-demo.section-dark { 
	position: fixed; 
	bottom: 0; 
	width: 100%;
}
-->
</style>
<body>
<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="container">
		<h3>회원 정보</h3>
		<table class="table table-striped table-bordered">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>${member.memId }</td>
				</tr>
				<tr>
					<th>회원명</th>
					<td>${member.memName }</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${member.memNickName }</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>${member.memHp }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${member.memMail }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${member.memAddress }</td>
				</tr>
				<tr>
					<th>회원 삭제 여부</th>
					<td>${member.memDelYn }</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="memberList.wow" class="btn btn-default btn-sm"> 
							<span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;목록
						</a>
						<a href='memberEdit.wow?memId=${member.memId }' class="btn btn-info btn-sm">
							<span class="glyphicon glyphicon-king" aria-hidden="true"></span> &nbsp;수정
						</a>
					</td>
				</tr>
			</tbody>
		</table>		
	</div>
	<%@ include file="/WEB-INF/inc/bottom.jsp"%>
</body>
<%@ include file="/WEB-INF/inc/bootjs.jsp"%>
</html>