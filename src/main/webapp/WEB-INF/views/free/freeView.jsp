<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="h-100">
<head>
 <%@ include file="/WEB-INF/inc/header.jsp"%>
 <%--
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootjs/js/bootstrap.js"></script> --%>

</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp"%>  
	<div class="container">
		<div class="page-header">
			<h3>
				커뮤니티 - <small>글 보기</small>
			</h3>
		</div>
		<table class="table table-striped table-bordered">
			<tbody>
				<tr>
					<th>글번호</th>
					<td>${freeBoard.boNo }</td>
				</tr>
				<tr>
					<th>글제목</th>
					<td>${freeBoard.boTitle }</td>
				</tr>
				<tr>
					<th>글분류</th>
					<td>${freeBoard.boCategoryNm }</td>
				</tr>
				<tr>
					<th>작성자명</th>
					<td>${freeBoard.boWriter }</td>
				</tr>
				<!-- 비밀번호는 보여주지 않음  -->
				<tr>
					<th>내용</th>
					<td><textarea rows="10" name="boContent"
							class="form-control input-sm">
						${freeBoard.boContent }
					</textarea></td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${freeBoard.boHit }</td>
				</tr>
				<tr>
					<th>등록일자</th>
					<td>${freeBoard.boRegDate}</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><c:forEach var="f" items="${freeBoard.attaches}"
							varStatus="st">
							<div>
								파일 ${st.count} <a
									href="<c:url value='/attach/download/${f.atchNo}' />"
									target="_blank"> <span class="glyphicon glyphicon-save"
									aria-hidden="true"></span> ${f.atchOriginalName}
								</a> Size : ${f.atchFancySize} Down : ${f.atchDownHit}
							</div>
						</c:forEach></td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="pull-left">
							<a href="freeList.wow" class="btn btn-default btn-sm"> <span
								class="glyphicon glyphicon-list" aria-hidden="true"></span>
								&nbsp;&nbsp;목록
							</a>
						</div> 
						<c:if test="${USER_INFO.userNickName == freeBoard.boWriter}">
							<div class="pull-right">
								<a href="freeEdit.wow?boNo=${freeBoard.boNo }"
									class="btn btn-success btn-sm"> <span
									class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									&nbsp;&nbsp;수정
								</a>
							</div>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="container">
		<!-- // START : 댓글 등록 영역  -->
		<div class="">
			<div class="form-horizontal">
				<form name="frm_reply" action="<c:url value='/replyRegist' />"
					method="post" onclick="return false;">
					<input type="hidden" name="reParentNo" value="${freeBoard.boNo}">
					<input type="hidden" name="reCategory" value="FREE"> 
					<input type="hidden" name="reMemId" value="${USER_INFO.userId }">
					<div class="form-group" style="margin-left: 220px">
						<label class="col-sm-2  control-label">댓글</label>
						<div class="col-sm-8">
							<textarea rows="3" name="reContent" class="form-control"></textarea>
						</div>
						<div class="col-sm-2">
							<button id="btn_reply_regist" type="button"
								class="btn btn-sm btn-info">등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<hr>
		<!-- // END : 댓글 등록 영역  -->

		<!-- // START : 댓글 목록 영역  -->
		<div id="id_reply_list_area">
			<div class="row" style="margin-left: 50px"></div>
		</div>

		<div class="row text-center" id="id_reply_list_more">
			<a id="btn_reply_list_more"
				class="btn btn-sm btn-default col-sm-10 col-sm-offset-1"
				style="margin-bottom: 33px;"> <span
				class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
				더보기
			</a>
		</div>
		<!-- // END : 댓글 목록 영역  -->

		<!-- The Modal -->
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Modal Heading</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">Modal body..</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
		<!-- START : 댓글 수정용 Modal -->
		<div class="modal fade" id="id_reply_edit_modal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<form name="frm_reply_edit" action="<c:url value='/replyModify' />"
						method="post" onclick="return false;">
						<div class="modal-header">
							<h4 class="modal-title" style="color: black">댓글수정</h4>
						</div>
						<div class="modal-body">
							<input type="hidden" name="reNo" value="">
							<textarea rows="3" name="reContent" class="form-control"></textarea>
							<input type="hidden" name="reMemId" value="${USER_INFO.userId }">
						</div>
						<div class="modal-footer">
							<button id="btn_reply_modify" type="button"
								class="btn btn-sm btn-info">저장</button>
							<button type="button" class="btn btn-default btn-sm"
								data-dismiss="modal" style="border-color: #EB5E28; color: #EB5E28;">닫기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- END : 댓글 수정용 Modal -->
	</div>
		<%@ include file="/WEB-INF/inc/bottom.jsp"%>
</body>

<script type="text/javascript">
	var params = {
		"curPage" : 1,
		"rowSizePerPage" : 5,
		"reCategory" : "FREE",
		"reParentNo" : "${freeBoard.boNo}"
	};

	function fn_reply_list() {
		$
				.ajax({
					url : "<c:url value = '/replyList' />",
					type : "POST",
					data : params,
					dataType : "JSON",
					success : function(data, size) {
						if(data.size < 5){
							$('#id_reply_list_more').remove();
						}
						console.log(data)
						$
								.each(
										data.data,
										function(index, element) {
											var str = "";
											str = str
													+ '<div class="row" data-re-no="'+ element.reNo +'">'
													+ '<div class="col-sm-2 text-center" >'
													+ element.reNickName
													+ '</div>'
													+ '<div class="col-sm-6"><pre>'
													+ element.reContent
													+ '</pre></div>'
													+ '<div class="col-sm-2" >'
													+ element.reRegDate
													+ '</div>'
													+ '<div class="col-sm-2">';

											if (element.reMemId == "${USER_INFO.userId}") {
												str = str
														+ '<button name="btn_reply_edit" type="button" class="btn btn-sm btn-info" >수정</button>'
														+ '<button name="btn_reply_delete" type="button" class="btn btn-sm btn-danger" >삭제</button>';
											}
											str = str + '</div>' + '</div>';
											$('#id_reply_list_area')
													.append(str);
										});
						params.curPage += 1;
					}
				})
	}

	$(document)
			.ready(
					function() {
						fn_reply_list();
						$('#btn_reply_list_more').on("click", function(e) {
							e.preventDefault();
							fn_reply_list();
						});

						$('#btn_reply_regist')
								.on(
										"click",
										function(e) {
											e.preventDefault();
											$form = $(this).closest(
													"form[name='frm_reply']");
											$
													.ajax({
														url : "<c:url value='/replyRegist' />",
														type : "POST",
														dataType : "JSON",
														data : $form
																.serialize(),
														success : function(data) {
															console.log(data);
															$form
																	.find(
																			"textarea[name = 'reContent']")
																	.val('');
															$(
																	'#id_reply_list_area')
																	.html('');
															params.curPage = 1;
															fn_reply_list()
														},
														error : function(req,
																st, err) {
															if (req.status == 401) {
																alert("로그인 후 이용가능합니다.");
																location.href = "<c:url value = '/login.wow' />";
															}
														}
													});
										}) //등록버튼

						$("#id_reply_list_area").on(
								"click",
								'button[name = "btn_reply_edit"]',
								function(e) {
									e.preventDefault();
									$ori_div = $(this).closest(".row");
									$edit_form = $('#id_reply_edit_modal');
									var text = $ori_div.find("pre").text();
									$edit_form.find('textarea').val(text);
									$edit_form.find('input[name="reNo"]').val(
											$ori_div.data('re-no'));
									$edit_form.modal('show');
								}); //수정버튼

						$("#btn_reply_modify").on(
								"click",
								function(e) {
									e.preventDefault();
									$form = $(this).closest(
											"form[name ='frm_reply_edit']");
									$.ajax({
										url : "<c:url value='/replyModify' />",
										type : "POST",
										data : $form.serialize(),
										dataType : "JSON",
										success : function(data) {
											console.log(data);
											$modal = $('#id_reply_edit_modal');
											$modal.modal('hide');
											$('#id_reply_list_area').html('');
											params.curPage = 1;
											fn_reply_list();
											$modal.find('textarea').val('');
											$modal.find('input[name=reNo]')
													.val('');
										}
									});
								}); //모달창 저장버튼

						$("#id_reply_list_area").on("click",
								'button[name="btn_reply_delete"]', function(e) {
									e.preventDefault();
									$div = $(this).closest('.row');
									reNo = $div.data('re-no');
									reMemId = "${USER_INFO.userId}";
									$.ajax({
										url : "<c:url value='/replyDelete' />",
										type : "POST",
										data : {
											"reNo" : reNo,
											"reMemId" : reMemId
										},
										dataType : "JSON",
										success : function() {
											$div.remove();
										}
									});
								}); //삭제버튼
					})
</script>
 <%@ include file="/WEB-INF/inc/bootjs.jsp"%>
</html>