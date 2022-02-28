<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html class="h-100">
<head>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/slate/bootstrap.min.css"
	integrity="sha384-8iuq0iaMHpnH2vSyvZMSIqQuUnQA7QM+f6srIdlgBrTSEyd//AWNMyEaSF2yPzNQ"
	crossorigin="anonymous">
</head>
<style>
.headerUl {
	display: flex;
	padding-top: 30px;
	padding-bottom: 30px;
	margin-bottom: 50px;
	background-color: #0B1426;
}

.headerUl li {
	list-style-type: none;
	padding: 0 134px;
}

.headerUl a {
	font-family: 'Nanum Gothic', sans-serif;
	text-decoration-line: none;
	color: white;
	font-size: 19px;
	transition: all ease-out 0.2s 0s;
	text-decoration: none;
}
</style>
<body>

	<!--header  -->
	<header>
		<div class="headerDiv">
			<ul class="headerUl">
				<li><a href="conPage.wow">HOME</a></li>
				<li><a href="ottzPromotion.wow">INFORMATION</a></li>
				<li><a href="ottzSearch.wow">CONTENTS</a></li>
				<li><a href="freeList.wow">COMMUNITY</a></li>
				<li><a href="questionsList.wow">Q & A</a></li>
			</ul>
		</div>
	</header>

<%@ include file="/WEB-INF/inc/header.jsp"%>
	<div class="container">
		<div class="page-header">
			<h3>
				커뮤니티 - <small>글 등록</small>
			</h3>
		</div>
		<form:form action="freeRegist.wow" method="post"
			modelAttribute="freeBoard" enctype="multipart/form-data">
			<table class="table table-striped table-bordered">
				<colgroup>
					<col width="20%" />
					<col />
				</colgroup>
				<tr>
					<th>제목</th>
					<td><form:input path="boTitle"
							cssClass="form-control input-sm" /> <form:errors path="boTitle" />
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${USER_INFO.userNickName }
					<form:hidden path="boWriter"  cssClass="form-control input-sm" />
					<form:errors path="boWriter" />
					</td>
				</tr>
				<tr>
					<th>분류</th>
					<td><form:select path="boCategory"
							cssClass="form-control input-sm">
							<form:option value="">--선택하세요--</form:option>
							<form:options items="${cateList }" itemLabel="commNm"
								itemValue="commCd" />
						</form:select></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><form:textarea path="boContent" rows="10"
							cssClass="form-control" /> <form:errors path="boContent" /></td>
				</tr>
				<tr>
					<th>첨부파일
						<button type="button" id="id_btn_new_file" style="background-color: #3a4848;">추가</button>
					</th>
					<td class="file_area">
						<div class="form-inline">
							<input type="file" name="boFiles" class="form-control">
							<button type="button" class="btn_delete btn btn-sm">삭제</button>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="pull-left">
							<a href="freeList.wow" class="btn btn-default btn-sm"> <span
								class="glyphicon glyphicon-list" aria-hidden="true"></span>
								&nbsp;&nbsp;목록
							</a>
						</div>
						<div class="pull-right">
							<button type="submit" class="btn btn-sm btn-primary">
								<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
								&nbsp;&nbsp;저장
							</button>
						</div>
					</td>
				</tr>
			</table>
		</form:form>
	</div>

</body>

<script type="text/javascript">
	$('#id_btn_new_file').click(function() {
			$('.file_area').append(
			'<div class="form-inline">'
			+ '<input type="file" name="boFiles" class="form-control">'
			+ '<button type="button" class="btn_delete btn btn-sm">삭제</button>' + '</div>');
			});

	$('.file_area').on('click', '.btn_delete', function() {
		$(this).closest('div').remove();
	});
</script>
</html>