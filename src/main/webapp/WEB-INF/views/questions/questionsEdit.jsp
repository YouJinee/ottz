<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html class="h-100">
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


	<%@ include file="/WEB-INF/inc/header.jsp"%>

</head>
<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div class="container">
		<div class="page-header">
			<h3>
				 문의사항 - <small>글 수정</small>
			</h3>
		</div>
		<form:form action="questionsModify.wow" method="post" 	modelAttribute="questions" enctype="multipart/form-data">
			<table class="table table-striped table-bordered">
				<colgroup>
					<col width="20%" />
					<col />
				</colgroup>
				<tr>
					<th>글번호</th>
					<td>${questions.qNo }<form:hidden path="qNo" /> <form:errors	path="qNo" />
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><form:input path="qTitle"
							cssClass="form-control input-sm" /> <form:errors path="qTitle" />
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${questions.qWriter }<form:hidden path="qWriter" /> <form:errors
							path="qWriter" />
					</td>
				</tr>
				<tr>
					<th>분류</th>
					<td><form:select path="qCategory"
							cssClass="form-control input-sm">
							<form:option value="">--선택하세요--</form:option>
							<form:options items="${codeList }" itemLabel="commNm"
								itemValue="commCd" />
						</form:select> <form:errors path="qCategory"></form:errors></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><form:textarea path="qContent" rows="10"
							cssClass="form-control input-sm" /> <form:errors
							path="qContent" /></td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${questions.qHit }</td>
				</tr>
				<tr>
					<th>첨부파일
						<button type="button" id="id_btn_new_file" style="background-color:#3a4848 ">추가</button>
					</th>
					<td class="file_area"><c:forEach var="f"
							items="${questions.attaches}" varStatus="st">
							<div>
								# 파일 ${st.count} <a
									href="<c:url value='/attach/download/${f.atchNo}' />"
									target="_blank"> <span class="glyphicon glyphicon-save"
									aria-hidden="true"></span> ${f.atchOriginalName}
								</a> Size : ${f.atchFancySize} Down : ${f.atchDownHit}
								<button class="btn_file_delete" data-atch-no="${f.atchNo}" style="color: black;">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								</button>

							</div>
						</c:forEach>
						<div class="form-inline">
							<input type="file" name="qFiles" class="form-control">
							<button type="button" class="btn_delete btn btn-sm" style="margin-left: 10px;">삭제</button>
						</div></td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="pull-left">
							<a href="questionsList.wow" class="btn btn-default btn-sm"> <span
								class="glyphicon glyphicon-list" aria-hidden="true"></span>
								&nbsp;&nbsp;목록
							</a>
						</div>
						<div class="pull-right">

							<button type="submit" class="btn btn-sm btn-primary">
								<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
								&nbsp;&nbsp;저장
							</button>

							<button type="submit" formaction="questionsDelete.wow"
								class="btn btn-sm btn-danger">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								&nbsp;&nbsp;삭제
							</button>
						</div>
					</td>
				</tr>
			</table>
		</form:form>
	</div>
	<!-- container -->

</body>
<script>
$('#id_btn_new_file').click(function() {
	$('.file_area').append(
		'<div class="form-inline">'
		+ '<input type="file" name="boFiles" class="form-control">'
		+ ' <button type="button" class="btn_delete btn btn-sm">삭제</button>'
		+ '</div>');
		}); 

	$('.file_area').on('click', '.btn_delete', function() {
		$(this).closest('div').remove();
	});

	$('.btn_file_delete').click(
			function() {
				$btn = $(this);
				$btn.closest('div').html(
						'<input type="hidden" name="delAtchNos" value="'
								+ $btn.data("atch-no") + '" />');
			});
</script>



</html>