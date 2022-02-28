<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html class="h-100">
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@500&display=swap" rel="stylesheet">

<link href="<%=request.getContextPath()%>/resources/css/step2.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form:form modelAttribute="member" method="post" action="regist.wow">
			<div class="row col-md-8 col-md-offset-2">
			<p class="ottz" style="font-family: 'Ubuntu', sans-serif;">OTTZ</p>
				<div class="page-header">
					<h3>회원가입 2단계</h3>
				</div>
				<table class="table">
					<tr>
						<th>ID</th>
						<td ><form:input path="memId" cssClass="form-control input-sm"  />
							<form:errors path="memId" />
							<button type="button" onclick="fn_idCheck()">ID 중복 체크</button></td>
					</tr>
					<tr>
						<th id="memPass.error">비밀번호</th>
						<td><form:password path="memPass" cssClass="form-control input-sm" /></td>
						<td><form:errors path="memPass" cssStyle="position: absolute; left: 1060px; top: 323px;" /></td>
					</tr>

					<tr class="form-group-sm">
						<th>회원 이름</th>
						<td><form:input path="memName" cssClass="form-control input-sm" /></td>
						<td><form:errors path="memName" cssStyle="position: absolute; left: 1060px; top: 393px;" /></td>
					</tr>
					<tr class="form-group-sm">
						<th>회원 별명</th>
						<td><form:input path="memNickName" cssClass="form-control input-sm" /></td>
						<td><form:errors path="memNickName" cssStyle="position: absolute; left: 1060px; top: 463px;" /></td>
					</tr>
						<tr class="form-group-sm">
						<th>주소</th>
						<td><form:input path="memAddress" cssClass="form-control input-sm"/></td>
						<td><form:errors path="memAddress" cssStyle="position: absolute; left: 1060px; top: 533px;" /></td>
					</tr>
					<tr class="form-group-sm">
						<th>핸드폰</th>
						<td><form:input path="memHp" cssClass="form-control input-sm"/></td>		   
						<td><form:errors path="memHp" cssStyle="position: absolute; left: 1060px; top: 603px;" /></td>
					</tr>

					<tr class="form-group-sm">
						<th>이메일</th>
						<td><form:input id="emailAdd" path="memMail" cssClass="form-control input-sm"/></td>
						<td><form:errors path="memMail" cssStyle="position: absolute; left: 1060px; top: 673px;"/></td>
					</tr>
				</table>
				
			<div class="btn_area double">
					<span class="cancel">
						<a onclick="history.back()" class="btn btn-sm btn-default" id="btnCancel"> 
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> &nbsp;&nbsp;취 소
						</a>
					</span>
					<span class="next"> 
						<button type="submit" class="btn btn-sm btn-primary" id="btnNext">
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> &nbsp;&nbsp;다 음
						</button>
					</span>
				</div>
			</div>
			
		</form:form>

	</div>
	<!-- END : 메인 콘텐츠  컨테이너  -->
</body>

<script type="text/javascript">
	var idCheckYn = "Y";
	
	function fn_idCheck() {
		event.preventDefault();
		var memId = $("#memId").val();
		$.ajax({
			url : "<c:url value='/idCheck.wow'/>",
			data : {
				"memId" : memId
			},
			types : "post",
			success : function(data) {
				if (data == "Y") {
					alert("이미 있는 아이디입니다.");
				} else if(data == "N") {
					alert("사용가능한 아이디입니다.");
				}else{
					alert("아이디를 입력해주세요");
				}
				idCheckYn = data;
			}
		});		
	}
	
	$(document).ready(function (){
		$("button[type='submit']").on("click", function(e) {
		e.preventDefault();
		if (idCheckYn == "N") {
			$("form").submit();
		} else {
			alert("ID 중복체크를 해주세요")
		}
		
		});
	});

</script>
</html>