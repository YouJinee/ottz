<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html class="h-100">
<head>
<%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp"%>
<div class="container">
<h3>회원 정보 수정</h3>
	<form:form action="memberModify.wow" method="post" modelAttribute="member">
	<table class="table table-striped table-bordered">
		<tbody>
			<tr>
				<th>아이디</th>
				<td>${member.memId }
				<form:hidden path="memId" />
				<form:errors path="memId" />
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
				<form:password path="memPass"/>
				<form:errors path="memPass" />
				</td>
			<tr>
				<th>회원명</th>
				<td>
				<form:input path="memName"/>
				<form:errors path="memName" />
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>
				<form:input path="memNickName"/>
				<form:errors path="memNickName" />
				</td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td>
				<form:input path="memHp"/>
				<form:errors path="memHp" />
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
				<form:input path="memMail"/>
				<form:errors path="memMail" />
				</td>
			</tr>			
			<tr>
				<th>주소</th>
				<td>
				<form:input path="memAddress"/>
				<form:errors path="memAddress" />
				</td>
			</tr>
			<tr>
				<th>회원 삭제 여부</th>
				<td>${member.memDelYn }
				<form:hidden path="memDelYn"/>
				<form:errors path="memDelYn" />
				</td>
			</tr>	
			
			<tr>
				<td colspan="2">
					<a href="memberList.wow" class="btn btn-info btn-sm">
					&nbsp;목록으로
					</a>
					<button type="submit" class="btn btn-primary">
					&nbsp;&nbsp; 저장
					</button>				
					<button type="submit" formaction="memberDelete.wow" class="btn btn-danger btn-sm">
					&nbsp;&nbsp; 삭제
					</button>				
				</td>
			</tr>
		</tbody>
	</table>
	</form:form>
</div>
</body>

<%@ include file="/WEB-INF/inc/bootjs.jsp"%>

</html>