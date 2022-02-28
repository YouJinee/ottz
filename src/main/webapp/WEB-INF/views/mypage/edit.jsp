<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html class="h-100">
<head>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
.text-center {
	display: table;
	margin-left: auto;
	margin-right: auto;
}

.footer-demo.section-dark {
	/* 	position: fixed;  */
	bottom: 0;
	width: 100%;
}

table td input {
	background-color: white;
    border-radius: 5px;
    border-style: solid;
    border-left-width: 0;
    border-right-width: 0;
    border-top-width: 0;
    border-bottom: 1px solid darkgray;
    color: black;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="container">
		<form:form action="modify.wow" method="post" modelAttribute="member">
			<h3><b>회원 정보</b></h3>
			<table class="table table-striped table-bordered">
				<tbody>
					<tr>
						<th style="width: 400px;" >아이디</th>
						<c:if test="${member.memPass != null}">
							<td>${member.memId }</td>
							<form:hidden path="memId" />
							<form:errors path="memId" />
						</c:if>
						<c:if test="${member.memPass == null}">
							<td>${member.memName }</td>
						</c:if>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><form:password path="memPass" title="8글자 이상 숫자, 문자 포함" />
							<form:errors path="memPass" /></td>
					</tr>
					<tr>
						<th>회원 이름</th>
						<td><form:input path="memName" /> <form:errors path="memName" />
						</td>
					</tr>
					<tr>
						<th>회원 별명</th>
						<td><form:input path="memNickName" /> <form:errors
								path="memNickName" /></td>
					</tr>
					<tr>
						<th>회원 이메일</th>
						<td><form:input path="memMail" /> <form:errors path="memMail" />
						</td>
					</tr>
					<tr>
						<th>회원 주소</th>
						<td><form:input path="memAddress" /> <form:errors
								path="memAddress" /></td>
					</tr>
					<tr>
						<th>회원 휴대번호</th>
						<td><form:input path="memHp" /> <form:errors path="memHp" />
						</td>
					</tr>
					<tr>
						<th>회원 탈퇴 여부</th>
						<td>${member.memDelYn }<form:hidden path="memDelYn"
								cssClass="form-control input-sm" /> <form:errors path="memDelYn" />
						</td>
					</tr>
					<tr>
						<td colspan="2"><a onclick="location.href='info.wow'"
							class="btn btn-info btn-sm"> <span
								class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
								&nbsp;이전으로
						</a>
							<button type="submit" class="btn btn-primary">
								<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
								&nbsp;&nbsp; 저장
							</button></td>
					</tr>
				</tbody>
			</table>
		</form:form>
	</div>

	<%@ include file="/WEB-INF/inc/bottom.jsp"%>

</body>

<script type="text/javascript">
	
</script>
<%@ include file="/WEB-INF/inc/bootjs.jsp"%>

</html>