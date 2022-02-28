<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html class="h-100">
<head>

<%@ include file="/WEB-INF/inc/header.jsp"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
.text-center {
 	display: table; margin-left: auto; margin-right: auto;
}
.footer-demo.section-dark { 
/* 	position: fixed;  */
	bottom: 0; 
	width: 100%;
}
</style>
</head>
<body>

<%@ include file="/WEB-INF/inc/top.jsp"%>

 <div class="container">	            
	<h3>회원목록</h3>	
	<!-- START : 검색 폼  -->
		<div class="panel panel-default collapse in" id="id_search_area">
			<div class="panel-body">
				<form name="search" action="memberList.wow" method="post" class="form-horizontal">
					<input type="hidden" name="curPage" value="${memberVO.curPage }">
					<input type="hidden" name="rowSizePerPage" value="${memberVO.rowSizePerPage }">
				</form>
			</div>
		</div>
		<!-- END : 검색 폼  -->
		
	<!-- START : 목록건수 및 새글쓰기 버튼  -->
	<div class="row" style="margin-bottom: 10px;">
		<div class="col-sm-3 form-inline">
			전체 ${memberVO.totalRowCount }건 조회 <select id="id_rowSizePerPage"
				name="rowSizePerPage" class="form-control input-sm">
				<c:forEach var="i" begin="5" end="10" step="1">
					<option value="${i }"
						${memberVO.rowSizePerPage eq i ? "selected='selected'" : "" }>${i }</option>
				</c:forEach>
			</select>
		</div>
	</div>
	
	<!-- END : 목록건수 및 새글쓰기 버튼  -->
	<div>
		<a href="memberForm.wow" class="btn btn-dark btn-sm pull-right">회원 등록</a>
	</div>
	<table class="table table-striped table-bordered">
		<caption class="hidden">회원목록 조회</caption>
		<colgroup>
			<col style="width: 20%" />
			<col style="width: 10%" />
			<col style="width: 12%" />
			<col style="width: 12%" />
			<col style="width: 23%" />
			<col style="width: 23%" />
		</colgroup>
		<thead>
			<tr>
				<th>ID</th>
				<th>회원명</th>
				<th>닉네임</th>
				<th>핸드폰번호</th>
				<th>이메일</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${memberList }" var="member">
				<tr>
					<td>
						<c:choose>
							<c:when test="${fn:length(member.memId) gt 21}">
							<c:out value="${fn:substring(member.memId, 0, 20)}...">
							</c:out>
							</c:when>
							<c:otherwise>
							<c:out value="${member.memId}"></c:out>
							</c:otherwise>	
						</c:choose>
					</td>
					<td><a href="memberView.wow?memId=${member.memId }">
					${member.memName }</a></td>
					<td>${member.memNickName }</td>
					<td>${member.memHp }</td>
					<td>${member.memMail }</td>
					<td>${member.memAddress }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


	<!-- START : 페이지네이션  -->
	<nav class="text-center">
		<ul class="pagination pagination-lg">
			<!-- 첫 페이지  -->
			<li class="pagination pagination-lg"><a class="page-link" href="memberList.wow?curPage=1" data-page="1"><span
					aria-hidden="true">&laquo;</span></a></li>
			<!-- 이전 페이지 -->
			<c:if test="${memberVO.firstPage!=1 }">
				<li class="page-item active"><a class="page-link" href="memberList.wow?curPage=${memberVO.firstPage - 1 }"
					data-page="${memberVO.firstPage-1 }"><span aria-hidden="true">&lt;</span></a></li>
			</c:if>

			<!-- 페이지 넘버링  -->
			<c:forEach begin="${memberVO.firstPage }" end="${memberVO.lastPage }"
				var="i">
				<c:if test="${memberVO.curPage !=i }">
					<li class="page-item"><a class="page-link" href="memberList.wow?curPage=${i }" data-page="${i }">${i }</a></li>
				</c:if>
				<c:if test="${memberVO.curPage ==i }">
					<li class="active"><a class="page-link" href="#">${i }</a></li>
				</c:if>
			</c:forEach>

			<!-- 다음  페이지  -->
			<c:if test="${memberVO.lastPage!=memberVO.totalPageCount }">
				<li class="page-item"><a class="page-link" href="memberList.wow?curPage=${memberVO.lastPage+1 }"
					data-page="${memberVO.lastPage+1 }"><span aria-hidden="true">&gt;</span></a></li>
			</c:if>

			<!-- 마지막 페이지 -->
			<li class="page-item"><a class="page-link" href="memberList.wow?curPage=${memberVO.totalPageCount }"
				data-page="${memberVO.totalPageCount }"><span aria-hidden="true">&raquo;</span></a></li>
		</ul>
	</nav>
	</div>
	<!-- END : 페이지네이션  -->
	
<%@ include file="/WEB-INF/inc/bottom.jsp"%>
</body>

<script type="text/javascript">

	$form=$("form[name='search']");
	$curPage=$form.find("input[name='curPage']");
	
	$('ul.pagination li a[data-page]').click(function(e) {
		e.preventDefault();
		$curPage.val($(this).data('page'));
		$form.submit();	
	});
	
	$('#id_rowSizePerPage').change(function(e) {
		$curPage.val(1);
		$form.find("input[name='rowSizePerPage']").val($(this).val());
		$form.submit();
	}); // '#id_rowSizePerPage'.change
</script>

<%@ include file="/WEB-INF/inc/bootjs.jsp"%>

</html>