<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="h-100">
<head>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	.footer{
		position: fixed;
		bottom: 0;
		width: 100%;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="container">
		<!-- START : 검색 폼  -->
		<div class="page-header">
			<h3>
				커뮤니티 - <small>글 목록</small>
			</h3>
		</div>

		<!-- START : 목록건수 및 새글쓰기 버튼  -->
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-sm-3 form-inline">
				전체 ${searchVO.totalRowCount } 조회 <select id="id_rowSizePerPage"
					name="rowSizePerPage" class="form-control input-sm">
					<c:forEach var="i" begin="10" end="50" step="10">
						<option value="${i }"
							${searchVO.rowSizePerPage eq i ? "selected = 'selected'" : "" }>${i }</option>
					</c:forEach>
				</select>
			</div>
			<div class="">
				<div class="panel-body">
					<form name="search" action="freeList.wow" method="post"
						class="form-horizontal">
						<input type="hidden" name="curPage" value="${searchVO.curPage }">
						<input type="hidden" name="rowSizePerPage"
							value="${searchVO.rowSizePerPage}">
						<div class="form-group">
							<label for="id_searchCategory"
								class="col-sm-2 col-sm-offset-2 control-label"
								style="margin-left: 40px">분류</label>
							<div class="col-sm-2">
								<select id="id_searchCategory" name="searchCategory"
									class="form-control input-sm">
									<option value="">-- 전체 --</option>
									<c:forEach items="${cateList}" var="code">
										<option value="${code.commCd}"
											${searchVO.searchCategory eq code.commCd ? "selected = 'selected'" : ""}>${code.commNm}</option>
									</c:forEach>
								</select>
							</div>
							<label for="id_searchType" class="col-sm-2 control-label"
								style="margin-left: 40px">검색</label>
							<div class="col-sm-2">
								<select id="id_searchType" name="searchType"
									class="form-control input-sm">
									<option value="T"
										${searchVO.searchType eq "T" ? "selected = 'selected'" : ""}>제목</option>
									<option value="W"
										${searchVO.searchType eq "W" ? "selected = 'selected'" : ""}>작성자</option>
									<option value="C"
										${searchVO.searchType eq "C" ? "selected = 'selected'" : ""}>내용</option>
								</select>
							</div>
							<div class="col-sm-2">
								<input type="text" name="searchWord"
									class="form-control input-sm" value="${searchVO.searchWord }"
									placeholder="검색어">
							</div>

							<div class="col-sm-1 text-right">
								<button type="submit" class="btn btn-sm btn-primary"
									style="margin-left: 20px">
									<i class="fa fa-search"></i> &nbsp;&nbsp;검 색
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- END : 목록건수 및 새글쓰기 버튼  -->

		<!-- END : 검색 폼  -->

		<table class="table table-striped table-bordered">
			<colgroup>
				<col width="10%" />
				<col width="15%" />
				<col width="40%" />
				<col width="10%" />
				<col width="15%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th>글번호</th>
					<th>분류</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${freeBoardList }" var="freeBoard">
					<tr class="text-center">
						<td>${freeBoard.boNo }</td>
						<td>${freeBoard.boCategoryNm }</td>
						<td class="text-left"><a href="freeView.wow?boNo=${freeBoard.boNo }"> ${freeBoard.boTitle } </a></td>
						<td>${freeBoard.boWriter }</td>
						<td>${freeBoard.boRegDate }</td>
						<td>${freeBoard.boHit }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="row">
			<div class="col-sm-2 col-sm-offset-10 text-right"
				style="margin-bottom: 5px;">
				<a href="freeForm.wow" class="btn btn-primary btn-sm"> <span
					class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
					&nbsp;새글쓰기
				</a>
			</div>
		</div>


		<!-- START : 페이지네이션  -->
		<nav class="text-center">
			<ul class="pagination">

				<!-- 첫 페이지  -->
				<li><a href="freeList.wow?curPage=1" data-page="1"><span
						aria-hidden="true">&laquo;</span></a></li>

				<!-- 이전 페이지 -->
				<c:if test="${searchVO.firstPage != 1 }">
					<li><a href="freeList.wow?curPage=${searchVO.firstPage - 1 }"
						data-page="${searchVO.firstPage - 1 }"><span
							aria-hidden="true">&lt;</span></a></li>
				</c:if>

				<!-- 페이지 넘버링  -->
				<c:forEach begin="${searchVO.firstPage }"
					end="${searchVO.lastPage }" var="i">
					<c:if test="${searchVO.curPage != i }">
						<li><a href="freeList.wow?curPage=${i }" data-page="${i }">${i }</a></li>
					</c:if>
					<c:if test="${searchVO.curPage == i }">
						<li class="active"><a href="#">${i }</a></li>
					</c:if>
				</c:forEach>

				<!-- 다음  페이지  -->
				<c:if test="${searchVO.lastPage != searchVO.totalPageCount }">
					<li><a href="freeList.wow?curPage=${searchVO.lastPage + 1}"
						data-page="${searchVO.lastPage + 1}"><span aria-hidden="true">&gt;</span></a></li>
				</c:if>

				<!-- 마지막 페이지 -->
				<li><a href="freeList.wow?curPage=${searchVO.totalPageCount }"
					data-page="${searchVO.totalPageCount }"><span
						aria-hidden="true">&raquo;</span></a></li>
			</ul>
		</nav>
		<!-- END : 페이지네이션  -->
	</div>
	
		<%@ include file="/WEB-INF/inc/bottom.jsp"%>
</body>

<script type="text/javascript">
	$form = $("form[name='search']");
	$curPage = $form.find("input[name='curPage']");

	$('ul.pagination li a[data-page]').click(function(e) {
		e.preventDefault();
		$curPage.val($(this).data('page'));
		$form.submit();
	});
	$form.find("button[type=submit]").click(function(e) {
		e.preventDefault();
		$curPage.val(1);
		$form.submit();
	});
	$('#id_rowSizePerPage').change(function(e) {
		$curPage.val(1);
		$form.find("input[name='rowSizePerPage']").val($(this).val());
		$form.submit();
	});
	$('#id_btn_reset').click(
			function() {
				$curPage.val(1);
				$form.find("input[name='searchWord']").val("");
				$form.find("select[name='searchType'] option:eq(0)").attr(
						"selected", "selected");
				$form.find("select[name='searchCategory'] option:eq(0)").attr(
						"selected", "selected");

			});
</script>
<%@ include file="/WEB-INF/inc/bootjs.jsp"%>
</html>