<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="en" class="h-100">
<head>
<style>
<!--
.wholePage {
	width: 100%;
}

.py-5 {
	color: white;
}

table {
	border-radius: 10%;
}

.clipDiv {
	width: 100%;
	text-align: center;
}

.starpoint_wrap {
	display: inline-block;
}

.starpoint_box {
	position: relative;
	background:
		url(https://hsecode.github.io/images_codepen/codepen_sp_star.png) 0 0
		no-repeat;
	font-size: 0;
}

.starpoint_box .starpoint_bg {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	height: 18px;
	background:
		url(https://hsecode.github.io/images_codepen/codepen_sp_star.png) 0
		-20px no-repeat;
	pointer-events: none;
}

.starpoint_box .label_star {
	display: inline-block;
	width: 10px;
	height: 18px;
	box-sizing: border-box;
}

.starpoint_box .star_radio {
	opacity: 0;
	width: 0;
	height: 0;
	position: absolute;
}

.starpoint_box .star_radio:nth-of-type(1):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(1):checked ~ .starpoint_bg {
	width: 10%;
}

.starpoint_box .star_radio:nth-of-type(2):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(2):checked ~ .starpoint_bg {
	width: 20%;
}

.starpoint_box .star_radio:nth-of-type(3):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(3):checked ~ .starpoint_bg {
	width: 30%;
}

.starpoint_box .star_radio:nth-of-type(4):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(4):checked ~ .starpoint_bg {
	width: 40%;
}

.starpoint_box .star_radio:nth-of-type(5):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(5):checked ~ .starpoint_bg {
	width: 50%;
}

.starpoint_box .star_radio:nth-of-type(6):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(6):checked ~ .starpoint_bg {
	width: 60%;
}

.starpoint_box .star_radio:nth-of-type(7):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(7):checked ~ .starpoint_bg {
	width: 70%;
}

.starpoint_box .star_radio:nth-of-type(8):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(8):checked ~ .starpoint_bg {
	width: 80%;
}

.starpoint_box .star_radio:nth-of-type(9):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(9):checked ~ .starpoint_bg {
	width: 90%;
}

.starpoint_box .star_radio:nth-of-type(10):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(10):checked ~ .starpoint_bg {
	width: 100%;
}

.blind {
	position: absolute;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
	overflow: hidden;
}

.btn.btn-secondary {
	margin-top: 5px;
	top: -20px;
	left: 10px;
}

.iframeDiv {
	margin-top: 10px;
	width: 100%;
	height: 100%;
	text-align: center;
}

.container {
	color: white;
	width: 100%;
}

#id_review_list_area button {
	width: 45px;
	height: 35px;
	margin-right: 10px;
	display: inline-block;
	float: right;
}

-->
#id_review_list_area .row {
	margin-bottom: 35px;
	vertical-align: middle;
}

.mb-5 {
	color: white;
}

.ms-3 {
	width: 100%;
}

.review_textarea {
	width: 150%;
	display: flex;
}

#btn_review_regist {
	margin-left: 20px;
	width: 80px;
	height: 50px;
	position: relative;
	top: 10px;
}

#review_text {
	color: white;
	font-size: 14px;
	position: relative;
	left: 80px;
	margin-bottom: 10px;
}

#id_review_list_area pre {
	display: inline;
	vertical-align: sub;
}
/* #review_text{
background-color: white;
border-radius: 3px;
} */
textarea.form-control {
	margin-bottom: 15px;
}

#regDateDiv {
	position: relative;
	color: darkgrey;
	font-size: smaller;
	left: 13px;
	top: 6px;
}

.name_date {
	position: relative;
	display: flex;
	width: 80%;
	top: 20px;
	margin-bottom: 10px;
}

.userImg {
	position: relative;
	width: 80px;
	top: 20px;
}

.buttonsDiv {
	height: 100%;
	width: 100%;
	position: relative;
	left: -50px;
}

.headerUl {
	display: flex;
	margin-top: 60px;
	margin-bottom: 50px;
}

.headerUl li {
	list-style-type: none;
	padding: 0 134px;
	height: 10px;
}

.headerUl a {
	font-family: 'Nanum Gothic', sans-serif;
	text-decoration-line: none;
	color: white;
	font-size: 19px;
	transition: all ease-out 0.2s 0s;
	text-decoration: none;
}

.footerDiv {
	background-color: black;
	height: 100px;
	width: 100%;
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 100px;
}

#id_review_list_more {
	margin: 0 auto;
	width: 30%;
}

.ottz {
	font-size: 20px;
	font-weight: bold;
	color: #7a7a7a;
	margin-top: 20px;
	margin-left: 20px;
	margin-right: 15px;
}

html, body {
	height: 100%;
	width: 100%;
	margin: 0;
	display: table;
}

footer {
	display: table-row;
	height: 0;
	background-color: #1a1817;
	position: relative;
	top : 40px;
}

#test li {
	float: left;
	margin: 0;
	padding: 0;
	font-weight: normal;
	text-decoration: none !important;
}

.copyright .pull-right {
	float: right !important;
}

.pull-right {
	color: #777777;
	font-size: 14px;
	margin: 15px -140px;
	line-height: 20px;
	text-align: center;
	margin-left: 10px;
	position: relative;
    right: -50px;
}

.pull-left{
	left: -50px;
    position: relative;
}
.pull-left li {
	list-style: none;
	list-style-type: none !important;
	float: left;
}
.pull-left a {
  text-decoration-line: none;	
}
#contents_div{
   background-color: #0B1426;
    padding-top: 70px;
    border-radius: 50px;
    position: relative;
    top: 20px;
}
.modal-header h4 {
    color: dimgray;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/ottzSearch.css"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/viewBootstrap/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="<%=request.getContextPath()%>/resources/viewBootstrap/css/styles.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootjs/css/styles.css"
	rel="stylesheet" />
</head>
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
	<div class="wholePage">
		<section class="py-5">
			<div class="container px-4 px-lg-5 my-5" style="width: 100%;" id="contents_div">
				<div class="row gx-4 gx-lg-5 align-items-center">
					<div class="col-md-6">
						<img class="card-img-top mb-5 mb-md-0" src="${content.conImg }"
							alt="..." />
					</div>
					<div class="col-md-6">
						<h1 class="display-5 fw-bolder">${content.conTitle }</h1>
						<c:if test="${content.conOrgTitle !=null }">
							<div class="fs-5 mb-5">
								<span> ${content.conOrgTitle }</span>
							</div>
						</c:if>

						<c:forEach items="${ottList }" var="ott">
							<c:if test="${ott eq 'Disney Plus' }">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/disneyPlus.png"
									width="50px" height="50px">
							</c:if>
							<c:if test="${ott eq 'Netflix'}">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/netflix.jpg"
									width="45px" height="45px" style="border-radius: 20%;">
							</c:if>
							<c:if test="${ott eq 'Watcha'}">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/whatcha.png"
									width="47px" height="47px" style="border-radius: 20%;">
							</c:if>
							<c:if test="${ott eq 'wavve'}">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/wavve.jpg"
									width="45px" height="45px" style="border-radius: 20%;">
							</c:if>
							<c:if test="${ott eq 'Amazon Prime Video'}">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/Amazon.png"
									width="45px" height="45px" style="border-radius: 20%;">
							</c:if>
							<c:if test="${ott eq 'Apple TV Plus'}">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/appleTV.png"
									width="45px" height="45px" style="border-radius: 20%;">
							</c:if>
							<c:if test="${ott eq 'BroadwayHD'}">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/brodwartHD.png"
									width="45px" height="45px" style="border-radius: 20%;">
							</c:if>
							<c:if test="${ott eq 'GuideDoc'}">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/guideDoc.png"
									width="45px" height="45px" style="border-radius: 20%;">
							</c:if>
							<c:if test="${ott eq 'Curiosity Stream'}">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/curiosityStream.png"
									width="45px" height="45px" style="border-radius: 20%;">
							</c:if>
							<c:if test="${ott eq 'Hoichoi'}">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/Hoichoi.png"
									width="45px" height="45px" style="border-radius: 20%;">
							</c:if>
							<c:if test="${ott eq 'WOW Presents Plus'}">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/wowPresentsPlus.png"
									width="45px" height="45px" style="border-radius: 20%;">
							</c:if>
							<c:if test="${ott eq 'Dekkoo'}">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/Dekkoo.png"
									width="45px" height="45px" style="border-radius: 20%;">
							</c:if>
							<c:if test="${ott eq 'Plex'}">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/plex.png"
									width="45px" height="45px" style="border-radius: 20%;">
							</c:if>
							<c:if test="${ott eq 'DocAlliance Films'}">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/DocAlliance.jpg"
									width="45px" height="45px" style="border-radius: 20%;">
							</c:if>
							<c:if test="${ott eq 'Crunchyroll'}">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/Crunchyoll.png"
									width="45px" height="45px" style="border-radius: 20%;">
							</c:if>
							<c:if test="${ott eq 'Mubi'}">
								<img alt=""
									src="<%=request.getContextPath()%>/resources/images/ottLogo/Mubi.png"
									width="45px" height="45px" style="border-radius: 20%;">
							</c:if>
						</c:forEach>
						<br> <br>
						<div class="table_div">
							<table class="table table-hover" id="table_id"
								style="table-layout: fixed; height: auto'">
								<tbody>
									<c:if test="${content.conDirector !=null }">
										<tr class="table-dark">
											<th scope="row" width="30%">감독</th>
											<td>${content.conDirector }</td>
										</tr>
									</c:if>
									<c:if test="${conGenre != null }">
										<tr class="table-dark">
											<th scope="row" width="30%">장르</th>
											<td>${conGenre }</td>
										</tr>
									</c:if>
									<c:if test="${conScore != null }">
										<tr class="table-dark">
											<th scope="row" width="30%">평점</th>
											<td><div class="progress">
													<div
														class="progress-bar progress-bar-striped progress-bar-animated"
														role="progressbar" aria-valuenow="${conScore }"
														aria-valuemin="0" aria-valuemax="100"
														style="width: ${conScore}%;">${conScore}%</div>
												</div></td>
										</tr>
									</c:if>
									<c:if test="${content.conAge != null }">
										<tr class="table-dark">
											<th scope="row" width="30%">연령</th>
											<td>${content.conAge }세이상</td>
										</tr>
									</c:if>
									<c:if test="${content.conTime != null }">
										<tr class="table-dark">
											<th scope="row" width="30%">상영시간</th>
											<td>${content.conTime }</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
						<strong>줄거리</strong>
						<p class="lead">${content.conStory }</p>
						<div class="d-flex">
							<c:if test="${saveVO == null }">
								<button class="btn btn-outline-light flex-shrink-0"
									name="btn-save" type="button">
									<i class="bi-cart-fill me-1"></i> 찜하기
								</button>
							</c:if>
							<c:if test="${saveVO != null }">
								<button class="btn btn-outline-light flex-shrink-0"
									name="btn-unsave" type="button">찜 해제</button>
							</c:if>
						</div>
						<br>
						<div class="starpoint_wrap">
							<strong>평점 주기&nbsp;&nbsp;</strong>
							<form action="ottzView.wow?conNo=${content.conNo }"
								class="starForm" id="starForm" method="POST">
								<div class="starpoint_box" style="float: left;">
									<label for="starpoint_1" class="label_star" title="0.5">
										<span class="blind">0.5점</span>
									</label> <label for="starpoint_2" class="label_star" title="1">
										<span class="blind">1점</span>
									</label> <label for="starpoint_3" class="label_star" title="1.5">
										<span class="blind">1.5점</span>
									</label> <label for="starpoint_4" class="label_star" title="2">
										<span class="blind">2점</span>
									</label> <label for="starpoint_5" class="label_star" title="2.5">
										<span class="blind">2.5점</span>
									</label> <label for="starpoint_6" class="label_star" title="3">
										<span class="blind">3점</span>
									</label> <label for="starpoint_7" class="label_star" title="3.5">
										<span class="blind">3.5점</span>
									</label> <label for="starpoint_8" class="label_star" title="4">
										<span class="blind">4점</span>
									</label> <label for="starpoint_9" class="label_star" title="4.5">
										<span class="blind">4.5점</span>
									</label> <label for="starpoint_10" class="label_star" title="5">
										<span class="blind">5점</span>
									</label> <input type="radio" name="starpoint" id="starpoint_1"
										class="star_radio" value="0.5"> <input type="radio"
										name="starpoint" id="starpoint_2" class="star_radio"
										value="1.0"> <input type="radio" name="starpoint"
										id="starpoint_3" class="star_radio" value="1.5"> <input
										type="radio" name="starpoint" id="starpoint_4"
										class="star_radio" value="2.0"> <input type="radio"
										name="starpoint" id="starpoint_5" class="star_radio"
										value="2.5"> <input type="radio" name="starpoint"
										id="starpoint_6" class="star_radio" value="3.0"> <input
										type="radio" name="starpoint" id="starpoint_7"
										class="star_radio" value="3.5"> <input type="radio"
										name="starpoint" id="starpoint_8" class="star_radio"
										value="4.0"> <input type="radio" name="starpoint"
										id="starpoint_9" class="star_radio" value="4.5"> <input
										type="radio" name="starpoint" id="starpoint_10"
										class="star_radio" value="5.0"> <span
										class="starpoint_bg"></span>
								</div>
								<div class="btn-group-vertical" style="float: left;">
									<button type="submit" class="btn btn-secondary "
										name="btn_star_submit" id="btn_star_submit">제출</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<c:if test="${content.conClip !=null }">
					<div class="iframeDiv">
						<iframe src="${content.conClip }" width="600px" height="400px">
						</iframe>
					</div>
				</c:if>
			</div>
		</section>

		<div class="container" >
			<!-- // START : 댓글 등록 영역  -->
			<div class="panel panel-default">
				<div class="panel-body form-horizontal" id="review_regist_div">
					<form name="frm_review" class="review_form"
						action="<c:url value='/review/reviewRegist' />" method="post"
						onclick="return false;">
						<input type="hidden" name="rvParentNo" value="${content.conNo}">
						<input type="hidden" name="rvMemId" value="${USER_INFO.userId }">
						<div class="form-group">
							<label class="col-sm-2  control-label">REVIEW</label>
							<div class="col-sm-8">
								<div class="review_textarea">
									<textarea rows="3" name="rvContent" class="form-control"></textarea>
									<div class="col-sm-2">
										<button id="btn_review_regist" type="button"
											class="btn btn-sm btn-secondary">등록</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- // END : 댓글 등록 영역  -->
			<!-- // START : 댓글 목록 영역  -->
			<div id="id_review_list_area">
				<div class="row"></div>
			</div>
			<div class="row text-center" id="id_review_list_more">
				<a id="btn_review_list_more"
					class="btn btn-secondary btn-lg col-sm-10 col-sm-offset-1"> <span
					class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
					더보기
				</a>
			</div>
			<div class="modal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Modal title</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true"></span>
							</button>
						</div>
						<div class="modal-body">
							<p>Modal body text goes here.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary">Save
								changes</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>

			<!-- START : 댓글 수정용 Modal -->
			<div class="modal fade" id="id_review_edit_modal" role="dialog">
				<div class="modal-dialog" role="document">
					<!-- Modal content-->
					<div class="modal-content">
						<form name="" action="<c:url value='/review/reviewModify' />"
							method="post" onclick="return false;">
							<div class="modal-header">
								<h4 class="modal-title">댓글수정</h4>
							</div>
							<div class="modal-body">
								<input type="hidden" name="rvNo" value="">
								<textarea rows="3" name="rvContent" class="form-control"></textarea>
								<input type="hidden" name="rvMemId" value="${USER_INFO.userId }">
							</div>
							<div class="modal-footer">
								<button id="btn_review_modify" type="button"
									class="btn btn-sm btn-dark">저장</button>
								<button type="button" class="btn btn-dark btn-sm"
									data-bs-dismiss="modal" aria-label="Close">닫기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- END : 댓글 수정용 Modal -->
		</div>
	</div>
	<footer class="footer-demo section-dark" id="test">
		<div class="container">
			<nav class="pull-left">
				<ul>
					<li><a href="https://www.netflix.com/kr">
							<div class="ottz">netflix</div>
					</a></li>
					<li><a href="https://watcha.com/">
							<div class="ottz">watcha</div>
					</a></li>
					<li><a href="https://www.disneyplus.com/ko-kr">
							<div class="ottz">disney</div>
					</a></li>


					<li><a href="https://www.tving.com/onboarding">
							<div class="ottz">tving</div>
					</a></li>
				</ul>
			</nav>
			<div class="copyright pull-right">
				&copy; 2022, made with Baeungeollo Mandeul-Eossda <i
					class="fa fa-heart heart"></i> by Dagat-i Mandeun <br>Copyright
				© OTTZ studio 2021 | Tel : 010-3851-6275 | Fax : 042-635-0624 |
				e-Mail : okokccc@naver.com | <br>(34897) Ott Trade Team Zip |
				60-10, Gyebaek-ro 1603beon-gil, Jung-gu, Daejeon |
			</div>
		</div>

	</footer>
	<script
		src="<%=request.getContextPath()%>/resources/bootjs/js/jquery-1.11.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bootjs/js/star.js"></script>
</body>
<script type="text/javascript">
	$form = ("form[name = 'starForm']");
	$('#btn_star_submit').on("click", function(e) {
		var sum = 0;
		$(":radio:checked").each(function() {
			sum += $(this).val() * 1
		});
		console.log(sum); 
		var params = {
			"memId" : "${USER_INFO.userId}",
			"conNo" : "${content.conNo}",
			"score" : sum
		}
		$.ajax({
			url : "<c:url value = '/ottView/ottScore'/>",
			type : 'POST',
			data : params,
			dataType : 'JSON',
			success : function(data) {
				alert("별점 부여가 완료되었습니다.");
			},
			error : function(req, st, err) {
				if (req.status == 401) {
					alert("별점 로그인 후 가능합니다.");
					location.href = "<c:url value = '/login.wow' />";
				}
			}
		})
	});
	var params = {
		"curPage" : 1,
		"rowSizePerPage" : 5,
		"rvParentNo" : "${content.conNo}"
	};
	function fn_review_list() {
		$.ajax({
					url : "<c:url value = '/review/reviewList' />",
					type : "POST",
					data : params,
					dataType : "JSON",
					success : function(data, size) {
						console.log("size:::"+data.size);
						if(data.size < 5){
							$('#id_review_list_more').remove();
						}
						
						$.each(
										data.data,
										function(index, element) {
											var str = "";
											str = str
													+ '<div class="row" data-rv-no ="'+element.rvNo+' ">'
													+'<img class = "userImg"alt="" src="<%=request.getContextPath()%>/resources/images/user.png" style="width: 80px;">'
													+ '<div class="name_date">'
													+ '<div class="rvMemName" style="font-weight : bold;font-size:large;">'
													+ element.rvMemName
													+ '</div>'
													+ '<div class="col-sm-2" id="regDateDiv">'
													+ element.rvRegDate
													+ '</div></div>'
													+ '<div class="col-sm-6" id = "review_text">'
													+ element.rvContent
													+ '</div>'
													+ '<div class="buttonsDiv">'
											if (element.rvMemId == "${USER_INFO.userId }") {
												str = str
														+ '<button name="btn_review_edit" type="button" class=" btn btn-sm btn-info">수정</button>'
														+ '<button name="btn_review_delete" type="button" class="btn btn-sm btn-danger">삭제</button>';
											}
											str = str + '</div> </div><hr>';
											$('#id_review_list_area').append(
													str);
										});
						params.curPage += 1;
					}
				})
	}
	/* 더보기 */
	$("#btn_review_list_more").on("click", function(e) {
		e.preventDefault();
		fn_review_list();
	});
	/* 후기 수정 버튼 */
	$("#id_review_list_area").on(
			"click",
			'button[name = "btn_review_edit"]',
			function(e) {
				var review = $(this).closest(".row").find("#review_text")
						.text();
				var rvNo = $(this).closest(".row").data("rv-no");
				$('#id_review_edit_modal').find('.modal-body textarea').val(
						review);
				$('input[name=rvNo]').attr('value', rvNo);
				$('#id_review_edit_modal').modal('show');
			})
	$('#btn_review_modify').on("click", function(e) {
		e.preventDefault();
		$form = $(this).closest('form');
		console.log($form.serialize());
		$.ajax({
			url : "<c:url value='/review/reviewModify'/>",
			type : 'POST',
			data : $form.serialize(),
			dataType : 'JSON',
			success : function(data) {
				$('#id_review_edit_modal').modal('hide');
				$("#id_review_list_area").html('');
				params.curPage = 1;
				fn_review_list();
				$modal = $('#id_review_edit_modal');
				$modal.find('textarea').val('');
				$modal.find('input[name=rvNo]').val('');
			}
		})
	})

	/* 	function fn_save_list(){
	 var params = {"memId":"${USER_INFO.userId}", "conNo" : "${content.conNo}"}
	 $.ajax({
	 url : "<c:url value='/save/saveList'/>",
	 type : "POST",
	 dataType : "text",
	 data : params,
	 success: function(){
	 alert("ㅇㅇ");
	 },
	 error : function(req, st, err){
	 alert(req+st+err);
	 }
	 })
	 } */
	$(document).ready(function() {
		fn_review_list();
		/*등록  */
		$('#btn_review_regist').on("click", function(e) {
			e.preventDefault();
			$form = $(this).closest("form[name='frm_review']");
			$.ajax({
				url : "<c:url value='/review/reviewRegist' />",
				type : "POST",
				dataType : "JSON",
				data : $form.serialize(),
				success : function(data) {
					console.log(data);
					$form.find("textarea[name = 'rvContent']").val('');
					$('#id_review_list_area').html('');
					params.curPage = 1;
					fn_review_list()
				},
				error : function(req, st, err) {
					if (req.status == 401) {
						alert("후기는 로그인 후 작성 가능합니다.");
						location.href = "<c:url value = '/login.wow' />";
					}
				}
			});
		}) //등록버튼

	})
	$("#id_review_list_area").on("click", 'button[name="btn_review_delete"]',
			function(e) {
				$div = $(this).closest(".row");
				rvNo = $div.data('rv-no');
				rvMemId = "${USER_INFO.userId}";
				$.ajax({
					url : "<c:url value='/review/reviewDelete'/>",
					type : "POST",
					data : {
						"rvNo" : rvNo,
						"rvMemId" : rvMemId
					},
					dataType : 'JSON',
					success : function() {
						$div.remove();
					},
					error : function() {
						alert("실패했더염");
					}
				});
			})
	$('button[name = "btn-save"]').on("click", function(e) {
		var params = {
			"memId" : "${USER_INFO.userId}",
			"conNo" : "${content.conNo}"
		}
		if (params.memId === null || params.memId === "") {
			alert("로그인 후 가능합니다.");
			location.href = "<c:url value = '/login.wow' />";
		} else {
			$.ajax({
				url : "<c:url value='/save/contentsSave'/>",
				type : "POST",
				data : params,
				dataType : 'text',
				success : function() {
					alert("찜 완료되었습니다.");
					location.reload();
				}
			})
		}
	})
	$('button[name = "btn-unsave"]').on("click", function(e) {
		var params = {
			"memId" : "${USER_INFO.userId}",
			"conNo" : "${content.conNo}"
		}
		$.ajax({
			url : "<c:url value='/save/contentsUnsave'/>",
			type : "POST",
			data : params,
			dataType : 'text',
			success : function() {
				alert("찜 목록에서 삭제되었습니다.");
				location.reload();
			}
		})
	})
</script>
</html>
